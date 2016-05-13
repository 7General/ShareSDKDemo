//
//  MainViewController.m
//  ShareSDKInfo
//
//  Created by 王会洲 on 16/4/26.
//  Copyright © 2016年 王会洲. All rights reserved.
//

#import "MainViewController.h"
#import "UIImageView+WebCache.h"
#import "SecViewController.h"

@interface MainViewController ()

@property (nonatomic, strong) UIImageView * iconImages;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    UILabel * actionLabel = [[UILabel alloc] init];
    actionLabel.text = @"分享";
    actionLabel.center = CGPointMake(self.view.center.x, 80);
    actionLabel.bounds = CGRectMake(0, 0, 100, 20);
    [self.view addSubview:actionLabel];
    
    UIButton * shareBtn  = [UIButton buttonWithType:UIButtonTypeCustom];
    shareBtn.frame = CGRectMake(100, 150, 50, 50);
    [shareBtn setImage:[UIImage imageNamed:@"wechat_login"] forState:UIControlStateNormal];
    [shareBtn setBackgroundImage:[UIImage imageNamed:@"declare"] forState:UIControlStateHighlighted];
    [shareBtn addTarget:self action:@selector(shareClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:shareBtn];
    
    
    
    
    UIView * lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 210, self.view.frame.size.width, 2)];
    lineView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:lineView];
    
    
    
    
    UIButton * weChat  = [UIButton buttonWithType:UIButtonTypeCustom];
    weChat.frame = CGRectMake(100, 260, 50, 50);
    [weChat setImage:[UIImage imageNamed:@"wechat_login"] forState:UIControlStateNormal];
    [weChat setBackgroundImage:[UIImage imageNamed:@"declare"] forState:UIControlStateHighlighted];
    [weChat addTarget:self action:@selector(weChatClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:weChat];
    
    
    UIButton * tencent  = [UIButton buttonWithType:UIButtonTypeCustom];
    tencent.frame = CGRectMake(100, 320, 50, 50);
    [tencent setImage:[UIImage imageNamed:@"qq_login"] forState:UIControlStateNormal];
    [tencent setBackgroundImage:[UIImage imageNamed:@"declare"] forState:UIControlStateHighlighted];
    [tencent addTarget:self action:@selector(tencentClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:tencent];
    
    
    UIButton * sina  = [UIButton buttonWithType:UIButtonTypeCustom];
    sina.frame = CGRectMake(100, 380, 50, 50);
    [sina setImage:[UIImage imageNamed:@"sina_login"] forState:UIControlStateNormal];
    [sina setBackgroundImage:[UIImage imageNamed:@"declare"] forState:UIControlStateHighlighted];
    [sina addTarget:self action:@selector(sinaClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:sina];
    
    
    
    self.iconImages = [[UIImageView alloc] initWithFrame:CGRectMake(100, 450, 100, 100)];
    self.iconImages.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.iconImages];
    
    NSString * url = @"http://avatar.csdn.net/2/F/0/1_whuizhou.jpg";
    NSURL * urls = [NSURL URLWithString:url];
    
    [self.iconImages sd_setImageWithURL:urls];
    
//    UIImageView * customImage = [[UIImageView alloc] initWithFrame:CGRectMake(100, 450, 71, 71)];
//    [customImage sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:[UIImage imageNamed:@"zh"]];
//    [self.view addSubview:customImage];

    
    
//    UIButton * Push  = [UIButton buttonWithType:UIButtonTypeCustom];
//        Push.frame = CGRectMake(200, 380, 50, 50);
//        [Push setImage:[UIImage imageNamed:@"sina_login"] forState:UIControlStateNormal];
//        [Push setBackgroundImage:[UIImage imageNamed:@"declare"] forState:UIControlStateHighlighted];
//        [Push addTarget:self action:@selector(PushClick:) forControlEvents:UIControlEventTouchUpInside];
//        [self.view addSubview:Push];
    
    
}
-(void)PushClick:(UIButton *)sender {

    SecViewController * sec = [[SecViewController alloc] init];
    [self.navigationController pushViewController:sec animated:YES];
}

-(void)weChatClick:(UIButton *)sender {
    
    [ShareSDK getUserInfo:SSDKPlatformTypeWechat
           onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error)
     {
         if (state == SSDKResponseStateSuccess)
         {
             
             NSLog(@"--->>>>>uid=%@",user.uid);
             NSLog(@"--->>>>>%@",user.credential);
             NSLog(@"--->>>>>token=%@",user.credential.token);
             NSLog(@"--->>>>>nickname=%@",user.nickname);
             NSLog(@"--->>>>>icon=%@",user.icon);
             
             NSURL * url  = [NSURL URLWithString:user.icon];
             [self.iconImages sd_setImageWithURL:url];
             
         }
         
         else
         {
             NSLog(@"%@",error);
         }
         
     }];
}

-(void)tencentClick:(UIButton *)sender {
    //例如QQ的登录
    [ShareSDK getUserInfo:SSDKPlatformTypeQQ
           onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error)
     {
         if (state == SSDKResponseStateSuccess)
         {
             
             NSLog(@"--->>>>>uid=%@",user.uid);
             NSLog(@"--->>>>>%@",user.credential);
             NSLog(@"--->>>>>token=%@",user.credential.token);
             NSLog(@"--->>>>>nickname=%@",user.nickname);
             NSLog(@"--->>>>>icon=%@",user.icon);
             
             NSURL * url  = [NSURL URLWithString:user.icon];
             [self.iconImages sd_setImageWithURL:url];
         }
         
         else
         {
             NSLog(@"%@",error);
         }
         
     }];
}

-(void)sinaClick:(UIButton *)sender {
    //例如QQ的登录
    [ShareSDK getUserInfo:SSDKPlatformTypeSinaWeibo
           onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error)
     {
         if (state == SSDKResponseStateSuccess)
         {
             
             NSLog(@"--->>>>>uid=%@",user.uid);
             NSLog(@"--->>>>>%@",user.credential);
             NSLog(@"--->>>>>token=%@",user.credential.token);
             NSLog(@"--->>>>>nickname=%@",user.nickname);
             NSLog(@"--->>>>>icon=%@",user.icon);
             
             NSURL * url  = [NSURL URLWithString:user.icon];
             [self.iconImages sd_setImageWithURL:url];
         }
         
         else
         {
             NSLog(@"%@",error);
         }
         
     }];
}





-(void)shareClick:(UIButton *)sender {
    NSLog(@"-----");
    
    
//    //1、创建分享参数
    NSArray* imageArray = @[[UIImage imageNamed:@"zh"]];
    if (imageArray) {
        NSMutableDictionary *shareParams = [NSMutableDictionary dictionary];
        [shareParams SSDKSetupShareParamsByText:@"分享内容"
                                         images:imageArray
                                            url:[NSURL URLWithString:@"http://mob.com"]
                                          title:@"分享标题"
                                           type:SSDKContentTypeAuto];
        //2、分享（可以弹出我们的分享菜单和编辑界面）
        [ShareSDK showShareActionSheet:nil //要显示菜单的视图, iPad版中此参数作为弹出菜单的参照视图，只有传这个才可以弹出我们的分享菜单，可以传分享的按钮对象或者自己创建小的view 对象，iPhone可以传nil不会影响
                                 items:nil
                           shareParams:shareParams
                   onShareStateChanged:^(SSDKResponseState state, SSDKPlatformType platformType, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error, BOOL end) {
                       
                       switch (state) {
                           case SSDKResponseStateSuccess:
                           {
                               UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"分享成功"
                                                                                   message:nil
                                                                                  delegate:nil
                                                                         cancelButtonTitle:@"确定"
                                                                         otherButtonTitles:nil];
                               [alertView show];
                               break;
                           }
                           case SSDKResponseStateFail:
                           {
                               UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"分享失败"
                                                                               message:[NSString stringWithFormat:@"%@",error]
                                                                              delegate:nil
                                                                     cancelButtonTitle:@"OK"
                                                                     otherButtonTitles:nil, nil];
                               [alert show];
                               break;
                           }
                           default:
                               break;
                       }
                   }
         ];}
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
