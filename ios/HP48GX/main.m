// The iOS app's entry point. The calculator is Rust (crates/hp48-ios):
// hp48_main starts UIKit and never returns.
//
// UIKit requires the scene life cycle, but winit (under eframe) knows
// nothing of scenes: it creates a plain UIWindow when the app has finished
// launching and calls makeKeyAndVisible on it, before UIKit connects a
// scene. A window without a scene is never shown. So Info.plist declares a
// scene with HP48SceneDelegate, and makeKeyAndVisible is wrapped to give a
// window without a scene the app's scene, or to keep it until the scene
// connects.
//
// The app's window shows black until its first frame is drawn, so a cover
// made from the launch storyboard sits over it until Rust calls
// hp48_shown (its first frames are on screen), and then fades out: the
// launch screen goes straight to the calculator.

#import <AVFAudio/AVFAudio.h>
#import <UIKit/UIKit.h>
#import <objc/runtime.h>

extern void hp48_main(void);
extern void hp48_suspend(void);
extern void hp48_resume(void);

/// The app's one scene, once connected.
static UIWindowScene *appScene;
/// Windows shown before the scene connected.
static NSMutableArray<UIWindow *> *waitingWindows;
/// UIWindow's own makeKeyAndVisible.
static IMP originalMakeKeyAndVisible;

/// The launch screen's view over the app's window, until its first frames
/// are drawn; and whether they have been.
static UIView *launchCover;
static BOOL shown;

/// Longest the cover stays if hp48_shown never comes.
static const NSTimeInterval launchCoverLimit = 5.0;

/// Called by Rust (crates/hp48-ios): the first frames are on screen.
void hp48_shown(void) {
    shown = YES;
    UIView *cover = launchCover;
    launchCover = nil;
    if (cover == nil) {
        return;
    }
    [UIView animateWithDuration:0.15
        animations:^{
          cover.alpha = 0;
        }
        completion:^(BOOL finished) {
          [cover removeFromSuperview];
        }];
}

/// Put the launch storyboard's view over `window`, the first time it shows.
static void coverWithLaunchScreen(UIWindow *window) {
    if (shown || launchCover != nil) {
        return;
    }
    UIStoryboard *board = [UIStoryboard storyboardWithName:@"LaunchScreen" bundle:nil];
    UIView *view = [board instantiateInitialViewController].view;
    if (view == nil) {
        return;
    }
    view.frame = window.bounds;
    view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    view.userInteractionEnabled = NO;
    [window addSubview:view];
    launchCover = view;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(launchCoverLimit * NSEC_PER_SEC)),
                   dispatch_get_main_queue(), ^{
                     hp48_shown();
                   });
}

static void hp48MakeKeyAndVisible(UIWindow *self, SEL _cmd) {
    if (self.windowScene == nil) {
        if (appScene == nil) {
            if (![waitingWindows containsObject:self]) {
                [waitingWindows addObject:self];
            }
            return;
        }
        self.windowScene = appScene;
        self.frame = appScene.coordinateSpace.bounds;
    }
    ((void (*)(id, SEL))originalMakeKeyAndVisible)(self, _cmd);
    coverWithLaunchScreen(self);
}

@interface HP48SceneDelegate : UIResponder <UIWindowSceneDelegate>
@end

@implementation HP48SceneDelegate

- (void)scene:(UIScene *)scene
    willConnectToSession:(UISceneSession *)session
                 options:(UISceneConnectionOptions *)connectionOptions {
    if (![scene isKindOfClass:[UIWindowScene class]] || appScene != nil) {
        return;
    }
    appScene = (UIWindowScene *)scene;
    NSArray<UIWindow *> *windows = [waitingWindows copy];
    [waitingWindows removeAllObjects];
    for (UIWindow *window in windows) {
        [window makeKeyAndVisible];
    }
}

// iOS stops a background app without telling it, and may end it, so
// continuous memory is saved whenever the app leaves the screen.
- (void)sceneDidEnterBackground:(UIScene *)scene {
    hp48_suspend();
}

- (void)sceneWillEnterForeground:(UIScene *)scene {
    hp48_resume();
}

- (void)sceneDidDisconnect:(UIScene *)scene {
    hp48_suspend();
}

@end

int main(int argc, char *argv[]) {
    @autoreleasepool {
        // The calculator's beeps are interface sounds: they mix with other
        // apps' audio, and the Ring/Silent switch silences them.
        [AVAudioSession.sharedInstance setCategory:AVAudioSessionCategoryAmbient error:nil];
        waitingWindows = [NSMutableArray array];
        Method method = class_getInstanceMethod([UIWindow class], @selector(makeKeyAndVisible));
        originalMakeKeyAndVisible = method_setImplementation(method, (IMP)hp48MakeKeyAndVisible);
        [NSNotificationCenter.defaultCenter addObserverForName:UIApplicationWillTerminateNotification
                                                        object:nil
                                                         queue:nil
                                                    usingBlock:^(NSNotification *note) { hp48_suspend(); }];
        hp48_main();
    }
    return 0;
}
