// The iOS app's entry point. The calculator is Rust (crates/hp48-ios):
// hp48_main starts UIKit and never returns.

#import <UIKit/UIKit.h>

extern void hp48_main(void);
extern void hp48_suspend(void);
extern void hp48_resume(void);

int main(int argc, char *argv[]) {
    @autoreleasepool {
        // iOS stops a background app without telling it, and may end it, so
        // continuous memory is saved whenever the app leaves the screen.
        NSNotificationCenter *center = NSNotificationCenter.defaultCenter;
        [center addObserverForName:UIApplicationDidEnterBackgroundNotification object:nil queue:nil
                        usingBlock:^(NSNotification *note) { hp48_suspend(); }];
        [center addObserverForName:UIApplicationWillTerminateNotification object:nil queue:nil
                        usingBlock:^(NSNotification *note) { hp48_suspend(); }];
        [center addObserverForName:UIApplicationWillEnterForegroundNotification object:nil queue:nil
                        usingBlock:^(NSNotification *note) { hp48_resume(); }];
        hp48_main();
    }
    return 0;
}
