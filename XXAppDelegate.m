#import "XXAppDelegate.h"
#import "XXRootViewController.h"
#import <UIKit/UIKit.h>

@implementation XXAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    _window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    _rootViewController = [[UINavigationController alloc] initWithRootViewController:[[XXRootViewController alloc] init]];
    _window.rootViewController = _rootViewController;
    [_window makeKeyAndVisible];
    
    // アプリ起動時にポップアップを表示
    [self showTestPopup];
    
    return YES;
}

// ポップアップを表示するメソッド
- (void)showTestPopup {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Message"
                                                    message:@"Do you want to respring it?"
                                                   delegate:self
                                          cancelButtonTitle:nil // キャンセルボタンなし
                                          otherButtonTitles:@"Yes", nil];
    [alert show];
}

// UIAlertViewのボタンがタップされた時の処理
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 0) { // "Yes"を選択した場合 (インデックス0)
        // リスプリングを実行する
        int result = system("killall -9 SpringBoard backboardd");
        if (result == 0) {
            NSLog(@"Respring successful");
        } else {
            NSLog(@"Error respringing: %d", result);
        }
    }
}

@end
