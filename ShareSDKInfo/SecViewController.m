//
//  SecViewController.m
//  ShareSDKInfo
//
//  Created by 王会洲 on 16/5/12.
//  Copyright © 2016年 王会洲. All rights reserved.
//

#import "SecViewController.h"
#import "UIImageView+WebCache.h"

@interface SecViewController ()

@end

@implementation SecViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    UIImageView * iconImages = [[UIImageView alloc] initWithFrame:CGRectMake(100, 450, 100, 100)];
    iconImages.backgroundColor = [UIColor redColor];
    [self.view addSubview:iconImages];
    
    NSString * url = @"http://avatar.csdn.net/2/F/0/1_whuizhou.jpg";
    
    [iconImages sd_setImageWithURL:[NSURL URLWithString:url]];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
