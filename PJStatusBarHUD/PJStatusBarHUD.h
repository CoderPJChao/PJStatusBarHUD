//
//  PJStatusBarHUD.h
//  PJStatusBarHUD
//
//  Created by ZhaoPJ on 16/3/16.
//  Copyright © 2016年 ZhaoPJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PJStatusBarHUD : UIView

/**
 *  显示普通信息（图片名称）
 *
 *  @param string 显示文字内容
 *  @param image  图片文件名
 */
+ (void)showMessageWithStatus:(NSString*)string imageName:(NSString *)imageName;
/**
 *  显示普通信息（图片）
 *
 *  @param string 显示文字内容
 *  @param image  图片
 */
+ (void)showMessageWithStatus:(NSString*)string image:(UIImage *)image;
/**
 *  显示普通信息
 */
+ (void)showMessageWithStatus:(NSString*)string;
/**
 *  显示成功信息
 */
+ (void)showSuccessWithStatus:(NSString*)string;
/**
 *  显示失败信息
 */
+ (void)showErrorWithStatus:(NSString *)string;
/**
 *  显示警告信息
 */
+ (void)showWarningWithStatus:(NSString *)string;
/**
 *  显示正在处理信息
 */
+ (void)showLoadingWithStatus:(NSString *)string;
/**
 *  隐藏
 */
+ (void)dismiss;

@end
