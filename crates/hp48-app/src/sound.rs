//! The calculator's speaker, played through the computer's sound output.
//!
//! The machine logs each change of the speaker bit with the CPU cycle it
//! happened at (`hp48::speaker`). The runner thread hands those changes
//! here, with the clock to play them at (`hp48::speaker::clock`, the one
//! the ROM's beeps are timed for), and the output stream plays them as a
//! square wave. Being timed in cycles, a tone keeps its pitch even when the
//! CPU runs faster than the real one; it then takes its real length to
//! play, after the calculator has gone on.
//!
//! Changes arrive a tick (8 ms) at a time, so playing starts `LEAD` behind
//! the first one, enough that the next tick's changes are always in time.

use cpal::traits::{DeviceTrait, HostTrait, StreamTrait};
use hp48::CPU_HZ;
use std::collections::VecDeque;
use std::sync::{Arc, Mutex};

/// How far behind the machine the sound plays, in seconds.
const LEAD: f64 = 0.040;

/// Playing more than this far behind (the CPU at full speed, or the output
/// stalled), skip ahead, in seconds.
const MAX_BEHIND: f64 = 0.5;

/// After the last change, keep the clock running this long before going
/// idle, in seconds: a gap within a tune stays a gap.
const IDLE_AFTER: f64 = 0.1;

/// The square wave's height.
const VOLUME: f32 = 0.25;

/// Speaker changes waiting to be played, and the clock to play them at.
struct Pending {
    /// (CPU cycle, level).
    edges: VecDeque<(u64, bool)>,
    /// CPU cycles per second.
    clock: f64,
}

type Queue = Arc<Mutex<Pending>>;

/// Hands speaker changes to the output stream; given to the runner thread.
#[derive(Clone)]
pub struct Feed(Queue);

impl Feed {
    /// Play `edges`, CPU cycles being `clock` per second.
    pub fn push(&self, edges: Vec<(u64, bool)>, clock: f64) {
        if !edges.is_empty() {
            let mut pending = self.0.lock().unwrap();
            pending.edges.extend(edges);
            pending.clock = clock;
        }
    }
}

/// The open output stream. Sound stops when it is dropped.
pub struct Sound {
    _stream: cpal::Stream,
    feed: Feed,
}

impl Sound {
    /// Open the default output, if there is one.
    pub fn open() -> Option<Sound> {
        let device = cpal::default_host().default_output_device()?;
        let config = device.default_output_config().ok()?;
        let format = config.sample_format();
        let config: cpal::StreamConfig = config.into();
        let queue = Arc::new(Mutex::new(Pending { edges: VecDeque::new(), clock: CPU_HZ as f64 }));
        let stream = match format {
            cpal::SampleFormat::F32 => build::<f32>(&device, config, queue.clone()),
            cpal::SampleFormat::I16 => build::<i16>(&device, config, queue.clone()),
            cpal::SampleFormat::I32 => build::<i32>(&device, config, queue.clone()),
            cpal::SampleFormat::U16 => build::<u16>(&device, config, queue.clone()),
            other => {
                eprintln!("no sound: the output wants {other} samples");
                return None;
            }
        };
        let stream = stream
            .and_then(|s| {
                s.play()?;
                Ok(s)
            })
            .map_err(|e| eprintln!("no sound: {e}"))
            .ok()?;
        Some(Sound { _stream: stream, feed: Feed(queue) })
    }

    pub fn feed(&self) -> Feed {
        self.feed.clone()
    }
}

fn build<T: cpal::SizedSample + cpal::FromSample<f32>>(
    device: &cpal::Device,
    config: cpal::StreamConfig,
    queue: Queue,
) -> Result<cpal::Stream, cpal::Error> {
    let channels = usize::from(config.channels);
    let mut player = Player::new(f64::from(config.sample_rate), CPU_HZ as f64);
    device.build_output_stream(
        config,
        move |data: &mut [T], _: &cpal::OutputCallbackInfo| {
            let mut pending = queue.lock().unwrap();
            player.set_clock(pending.clock);
            for frame in data.chunks_mut(channels) {
                let value = T::from_sample(player.sample(&mut pending.edges));
                frame.fill(value);
            }
        },
        |e| eprintln!("sound: {e}"),
        None,
    )
}

/// Turns speaker changes into samples.
struct Player {
    /// Samples per second.
    rate: f64,
    /// CPU cycles per second, and per sample.
    clock: f64,
    step: f64,
    /// The CPU cycle being played, or None while idle.
    at: Option<f64>,
    /// The speaker's level, and the cycle of its last change.
    level: bool,
    last: f64,
    /// DC blocker: the last input and output. The speaker rests on or
    /// off, and either must be silence.
    x: f32,
    y: f32,
}

impl Player {
    fn new(rate: f64, clock: f64) -> Self {
        Player { rate, clock, step: clock / rate, at: None, level: false, last: 0.0, x: 0.0, y: 0.0 }
    }

    fn set_clock(&mut self, clock: f64) {
        self.clock = clock;
        self.step = clock / self.rate;
    }

    fn sample(&mut self, queue: &mut VecDeque<(u64, bool)>) -> f32 {
        let input = match self.at {
            None => match queue.front() {
                Some(&(first, _)) => {
                    self.at = Some(first as f64 - LEAD * self.clock);
                    self.level_now()
                }
                None => 0.0,
            },
            Some(_) => self.level_now(),
        };
        if let Some(at) = &mut self.at {
            *at += self.step;
            if let Some(&(newest, _)) = queue.back() {
                if newest as f64 - *at > MAX_BEHIND * self.clock {
                    *at = newest as f64 - LEAD * self.clock;
                }
            }
            while let Some(&(cycle, level)) = queue.front() {
                if cycle as f64 > *at {
                    break;
                }
                queue.pop_front();
                self.level = level;
                self.last = cycle as f64;
            }
            if queue.is_empty() && *at - self.last > IDLE_AFTER * self.clock {
                self.at = None;
            }
        }
        // y[n] = x[n] - x[n-1] + R y[n-1]: removes the level's DC part,
        // with a corner around 30 Hz at 48 kHz.
        self.y = input - self.x + 0.996 * self.y;
        self.x = input;
        self.y
    }

    fn level_now(&self) -> f32 {
        if self.level {
            VOLUME
        } else {
            0.0
        }
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    /// A 1 kHz square wave in changes: the level at each half period.
    fn tone(start: u64, periods: u64) -> VecDeque<(u64, bool)> {
        let half = CPU_HZ / 2000;
        (0..2 * periods).map(|i| (start + i * half, i % 2 == 0)).collect()
    }

    fn play(player: &mut Player, queue: &mut VecDeque<(u64, bool)>, samples: usize) -> Vec<f32> {
        (0..samples).map(|_| player.sample(queue)).collect()
    }

    #[test]
    fn a_tone_plays_at_its_pitch() {
        let mut player = Player::new(48_000.0, CPU_HZ as f64);
        let mut queue = tone(1_000_000, 200);
        let out = play(&mut player, &mut queue, 48_000 / 5);
        // After the lead, count the rising zero crossings over 100 ms.
        let lead = (LEAD * 48_000.0) as usize;
        let window = &out[lead + 480..lead + 480 + 4800];
        let rises = window.windows(2).filter(|w| w[0] <= 0.0 && w[1] > 0.0).count();
        assert!((99..=101).contains(&rises), "{rises} periods in 100 ms");
    }

    /// Cycles play at the clock given: the same changes at half the clock
    /// are half the pitch.
    #[test]
    fn the_clock_sets_the_pitch() {
        let mut player = Player::new(48_000.0, CPU_HZ as f64 / 2.0);
        let mut queue = tone(1_000_000, 200);
        let out = play(&mut player, &mut queue, 48_000 / 2);
        let lead = (LEAD * 48_000.0) as usize;
        let window = &out[lead + 480..lead + 480 + 4800];
        let rises = window.windows(2).filter(|w| w[0] <= 0.0 && w[1] > 0.0).count();
        assert!((49..=51).contains(&rises), "{rises} periods in 100 ms");
    }

    #[test]
    fn silence_when_nothing_plays() {
        let mut player = Player::new(48_000.0, CPU_HZ as f64);
        let mut queue = VecDeque::new();
        assert!(play(&mut player, &mut queue, 1000).iter().all(|&s| s == 0.0));
    }

    #[test]
    fn it_goes_idle_and_quiet_after_a_beep() {
        let mut player = Player::new(48_000.0, CPU_HZ as f64);
        let mut queue = tone(0, 50);
        let out = play(&mut player, &mut queue, 48_000);
        assert!(queue.is_empty());
        assert!(player.at.is_none());
        assert!(out[out.len() - 100..].iter().all(|s| s.abs() < 1e-3));
    }

    #[test]
    fn it_catches_up_when_far_behind() {
        let mut player = Player::new(48_000.0, CPU_HZ as f64);
        let mut queue = tone(0, 10);
        queue.extend(tone(CPU_HZ * 10, 10));
        play(&mut player, &mut queue, 10);
        let at = player.at.unwrap();
        assert!(at > (CPU_HZ * 10) as f64 - 2.0 * LEAD * CPU_HZ as f64, "skipped ahead to the newest changes");
    }
}
