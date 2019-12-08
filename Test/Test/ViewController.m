//
//  ViewController.m
//  Test
//
//  Created by APPLE on 2019/10/28.
//  Copyright © 2019 APPLE. All rights reserved.
//

#import "ViewController.h"
#import "MainViewController.h"
#import <LocalAuthentication/LocalAuthentication.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    MainViewController *mainVC = [MainViewController new];
//
//    [self presentViewController:mainVC animated:YES completion:^{
//
//    }];
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setFrame:CGRectMake(100, 100, 200, 100)];
    [button setTitle:@"button" forState:UIControlStateNormal];
    [button setBackgroundColor:[UIColor grayColor]];
    [button addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}



- (void)btnClick:(UIButton *)sender{
    if (NSFoundationVersionNumber < NSFoundationVersionNumber_iOS_8_0) {
               NSLog(@"系统版本不支持TouchID");
               return;
           }
           LAContext *context = [[LAContext alloc] init];
           context.localizedFallbackTitle = @"输入密码";
           if (@available(iOS 10.0, *)) {
               context.localizedCancelTitle = @"登陆前请先验证指纹";
           } else {
               // Fallback on earlier versions
           }
           NSError *error = nil;
         
           if ([context canEvaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics error:&error]) {
               
               [context evaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics localizedReason:@"通过Home键验证已有手机指纹" reply:^(BOOL success, NSError * _Nullable error) {
                   
                   if (success) {
                       dispatch_async(dispatch_get_main_queue(), ^{
                           NSLog(@"TouchID 验证成功");
                           UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"验证成功" message:@"验证成功，欢迎使用test" preferredStyle:UIAlertControllerStyleAlert];
                           UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                           }];
                           [alert addAction:okAction];
                           [self presentViewController:alert animated:YES completion:^{
                           }];
                       });
                   }else if(error){
                       
                       switch (error.code) {
                           case LAErrorAuthenticationFailed:{
                               dispatch_async(dispatch_get_main_queue(), ^{
                                   NSLog(@"TouchID 验证失败");
                               });
                               break;
                           }
                           case LAErrorUserCancel:{
                               dispatch_async(dispatch_get_main_queue(), ^{
                                   NSLog(@"TouchID 被用户手动取消");
                               });
                           }
                               break;
                           case LAErrorUserFallback:{
                               dispatch_async(dispatch_get_main_queue(), ^{
                                   NSLog(@"用户不使用TouchID,选择手动输入密码");
                               });
                           }
                               break;
                           case LAErrorSystemCancel:{
                               dispatch_async(dispatch_get_main_queue(), ^{
                                   NSLog(@"TouchID 被系统取消 (如遇到来电,锁屏,按了Home键等)");
                               });
                           }
                               break;
                           case LAErrorPasscodeNotSet:{
                               dispatch_async(dispatch_get_main_queue(), ^{
                                   NSLog(@"TouchID 无法启动,因为用户没有设置密码");
                               });
                           }
                               break;
                           case LAErrorTouchIDNotEnrolled:{
                               dispatch_async(dispatch_get_main_queue(), ^{
                                   NSLog(@"TouchID 无法启动,因为用户没有设置TouchID");
                               });
                           }
                               break;
                           case LAErrorTouchIDNotAvailable:{
                               dispatch_async(dispatch_get_main_queue(), ^{
                                   NSLog(@"TouchID 无效");
                               });
                           }
                               break;
                           case LAErrorTouchIDLockout:{
                               dispatch_async(dispatch_get_main_queue(), ^{
                                   NSLog(@"TouchID 被锁定(连续多次验证TouchID失败,系统需要用户手动输入密码)");
                                   UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"被锁定" message:@"连续多次验证TouchID失败,系统需要用户手动输入密码" preferredStyle:UIAlertControllerStyleAlert];
                                   UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                                   }];
                                   [alert addAction:okAction];
                                   [self presentViewController:alert animated:YES completion:^{
                                   }];
                               });
                           }
                               break;
                           case LAErrorAppCancel:{
                               dispatch_async(dispatch_get_main_queue(), ^{
                                   NSLog(@"当前软件被挂起并取消了授权 (如App进入了后台等)");
                               });
                           }
                               break;
                           case LAErrorInvalidContext:{
                               dispatch_async(dispatch_get_main_queue(), ^{
                                   NSLog(@"当前软件被挂起并取消了授权 (LAContext对象无效)");
                               });
                           }
                               break;
                           default:
                               break;
                       }
                   }
               }];
               
           }else{
               NSLog(@"当前设备不支持TouchID");
           }
}

@end
