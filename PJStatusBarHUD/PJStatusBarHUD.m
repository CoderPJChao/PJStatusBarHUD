//
//  PJStatusBarHUD.m
//  PJStatusBarHUD
//
//  Created by ZhaoPJ on 16/3/16.
//  Copyright © 2016年 ZhaoPJ. All rights reserved.
//

#import "PJStatusBarHUD.h"

#define PJMessageFont [UIFont systemFontOfSize:12]

static CGFloat const PJMessageDuration = 2.0;
static CGFloat const PJAnimationDuration = 0.25;

@implementation PJStatusBarHUD

/** 全局窗口 */
static UIWindow *window_;
static NSTimer *timer_;

/**
 *  显示窗口
 */
+ (void)showWindow
{
    CGFloat windowH = 20;
    CGRect frame = CGRectMake(0, -windowH, [UIScreen mainScreen].bounds.size.width, windowH);
    
    window_.hidden = YES;
    window_ = [[UIWindow alloc] init];
    window_.frame = frame;
    window_.backgroundColor = [UIColor darkGrayColor];
    window_.windowLevel = UIWindowLevelAlert;
    window_.hidden = NO;
    
    frame.origin.y = 0;
    [UIView animateWithDuration:PJAnimationDuration animations:^{
        window_.frame = frame;
    }];
}

/**
 *  显示普通信息（图片）
 *
 *  @param string 显示文字内容
 *  @param image  图片
 */
+ (void)showMessageWithStatus:(NSString*)string image:(UIImage *)image
{
    [timer_ invalidate];
//    timer_ = nil;
    
    [self showWindow];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:string forState:UIControlStateNormal];
    button.titleLabel.font = PJMessageFont;
    if (image) {
        image = [self changeImageSize:image];
        [button setImage:image forState:UIControlStateNormal];
        button.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    }
    button.frame = window_.bounds;
    [window_ addSubview:button];
    
    timer_ = [NSTimer scheduledTimerWithTimeInterval:PJMessageDuration target:self selector:@selector(dismiss) userInfo:nil repeats:NO];
}

/**
 *  显示普通信息（图片名称）
 *
 *  @param string 显示文字内容
 *  @param image  图片名
 */
+ (void)showMessageWithStatus:(NSString*)string imageName:(NSString *)imageName
{
    UIImage *image = imageName ? [UIImage imageNamed:imageName] : nil;
    [self showMessageWithStatus:string image:image];
}

/**
 *  显示普通信息
 */
+ (void)showMessageWithStatus:(NSString*)string
{
    [self showMessageWithStatus:string imageName:nil];
}

/**
 *  显示成功信息
 */
+ (void)showSuccessWithStatus:(NSString*)string
{
    [self showMessageWithStatus:string imageName:@"PJStatusBarHUD.bundle/success"];
}

/**
 *  显示失败信息
 */
+ (void)showErrorWithStatus:(NSString *)string
{
    [self showMessageWithStatus:string imageName:@"PJStatusBarHUD.bundle/error"];
}

/**
 *  显示警告信息
 */
+ (void)showWarningWithStatus:(NSString *)string
{
    [self showMessageWithStatus:string imageName:@"PJStatusBarHUD.bundle/warning"];
}

/**
 *  显示正在处理信息
 */
+ (void)showLoadingWithStatus:(NSString *)string
{
    [timer_ invalidate];
    timer_ = nil;
    [self showWindow];
    
    UILabel *label = [[UILabel alloc] init];
    label.frame = window_.bounds;
    label.font = PJMessageFont;
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor whiteColor];
    label.text = string;
    [window_ addSubview:label];
    
    UIActivityIndicatorView *loadingView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    [loadingView startAnimating];
    CGFloat messageW = [string sizeWithAttributes:@{NSFontAttributeName : PJMessageFont}].width;
    CGFloat centerX = (window_.bounds.size.width - messageW) * 0.5 - 20;
    CGFloat centerY = window_.bounds.size.height * 0.5;
    loadingView.center = CGPointMake(centerX, centerY);
    [window_ addSubview:loadingView];
}

/**
 *  隐藏
 */
+ (void)dismiss
{
    CGRect frame = window_.frame;
    frame.origin.y = -frame.size.height;
    
    [UIView animateWithDuration:PJAnimationDuration animations:^{
        window_.frame = frame;
    } completion:^(BOOL finished) {
//        window_.hidden = YES;
        window_ = nil;
        timer_ = nil;
    }];
}

/**
 *  调整Image图片的大小
 *
 *  @param image 原始图片
 *
 *  @return 修改后的图片
 */
+(UIImage *)changeImageSize:(UIImage *)image
{
    CGSize size = CGSizeMake(16, 16);
    UIGraphicsBeginImageContext(size);
    [image drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage *transformedImg=UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return transformedImg;
}

@end
