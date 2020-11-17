//
//  AppDelegate.m
//  Test
//
//  Created by APPLE on 2019/10/28.
//  Copyright © 2019 APPLE. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import <UserNotifications/UNUserNotificationCenter.h>

@interface AppDelegate ()<UNUserNotificationCenterDelegate>
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    NSLog(@"launchOptions -- %@",launchOptions);
//    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:[ViewController new]];
//    self.window.rootViewController = nav;
//    [self.window makeKeyAndVisible];
   NSURL *url = [launchOptions objectForKey:UIApplicationLaunchOptionsURLKey];
    if(url) {}
    NSString *bundleId = [launchOptions objectForKey:UIApplicationLaunchOptionsSourceApplicationKey];
      if(bundleId) {}
//    UILocalNotification * localNotify = [launchOptions objectForKey:UIApplicationLaunchOptionsLocalNotificationKey];
//       if(localNotify) {}
    
    UNUserNotificationCenter *userCenter = [UNUserNotificationCenter currentNotificationCenter];
    userCenter.delegate = self;
    [userCenter requestAuthorizationWithOptions:(UNAuthorizationOptionAlert|UNAuthorizationOptionBadge|UNAuthorizationOptionSound) completionHandler:^(BOOL granted, NSError * _Nullable error) {
        NSLog(@"%@",@"dfdfdf");
    }];
    NSDictionary * userInfo = [launchOptions objectForKey:UIApplicationLaunchOptionsRemoteNotificationKey];
    if(userInfo)  {}//应用
     /**
         * 跳转支付宝app支付时，app被kill，支付完成后，从支付宝app跳转app，return NO 不调用application: openURL:sourceApplication:annotation:(返回app首页)
         */
        if (launchOptions) {
            NSString *appIDF = [launchOptions objectForKey:UIApplicationLaunchOptionsSourceApplicationKey];
            if (appIDF && [appIDF isEqualToString:@"com.alipay.iphoneclient"]) {
                return NO;
            }
        }
    return YES;
}
    #pragma mark--外部应用跳转到app的url处理
//
//    - (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
//
//    {
//
//        NSString *urlStr = [urlabsoluteString];
//
//        // 支付宝app进app
//
//        if(sourceApplication && [sourceApplicationisEqualToString:@"com.alipay.iphoneclient"]){
//
//            [[AlipaySDKdefaultService] processOrderWithPaymentResult:urlstandbyCallback:^(NSDictionary *resultDic) {
//
//                NSDictionary *dict = @{ALIPayDidCompleteURLKey:urlStr};
//
//                [[NSNotificationCenterdefaultCenter ] postNotificationName:ALIPayFromZFBDidCompleteNotificationobject:resultDic userInfo:dict];
//
//            }];
//
//        }
//
//        returnYES;
//
//    }

    //在支付类初始化方法
//            [[NSNotificationCenterdefaultCenter] addObserver:selfselector:@selector(processAliPayResult:)name:ALIPayFromZFBDidCompleteNotificationobject:nil];



#pragma mark - UISceneSession lifecycle


- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options  API_AVAILABLE(ios(13.0)){
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}


- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions  API_AVAILABLE(ios(13.0)){
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
}



-(void)userNotificationCenter:(UNUserNotificationCenter *)center openSettingsForNotification:(UNNotification *)notification{
    
}

- (void)userNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(UNNotificationPresentationOptions))completionHandler{
    
}
- (void)userNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void (^)(void))completionHandler{
    
}




@end
