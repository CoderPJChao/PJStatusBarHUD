//
//  ViewController.m
//  PJStatusBarHUDExample
//
//  Created by ZhaoPJ on 16/3/16.
//  Copyright © 2016年 ZhaoPJ. All rights reserved.
//

#import "ViewController.h"
#import "PJStatusBarHUD.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)success:(id)sender {
    [PJStatusBarHUD showSuccessWithStatus:@"加载成功!"];
}

- (IBAction)warning:(id)sender {
    [PJStatusBarHUD showWarningWithStatus:@"警告!!!"];
}

- (IBAction)error:(id)sender {
    [PJStatusBarHUD showErrorWithStatus:@"加载失败!"];
}

- (IBAction)loading:(id)sender {
    [PJStatusBarHUD showLoadingWithStatus:@"正在加载中..."];
}

- (IBAction)message:(id)sender {
    [PJStatusBarHUD showMessageWithStatus:@"哈哈，什么事儿也没有!!!"];
}


- (IBAction)dismiss:(id)sender {
    [PJStatusBarHUD dismiss];
}

- (IBAction)other:(id)sender {
    
    //    [PJStatusBarHUD showMessageWithStatus:@"warning!!!" image:[UIImage imageNamed:图片]];
    
    //    [PJStatusBarHUD showMessageWithStatus:@"warning!!!" imageName:图片名称];
}


@end
