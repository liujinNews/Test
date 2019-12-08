//
//  MainViewController.m
//  Test
//
//  Created by APPLE on 2019/10/28.
//  Copyright © 2019 APPLE. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSArray *arr = @[@"0",@"1",@"2",@"3"];
    NSDictionary *dic = [NSObject getObjectData:arr];
    NSLog(@"dic = %@",dic);
    NSString *deviceName = CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (CFStringRef)[[UIDevice currentDevice] name], NULL, (CFStringRef)@"!*'();:@&=+$,/?%#[]", kCFStringEncodingUTF8));
    NSLog(@"%@",deviceName);
    
    
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
