# PJStatusBarHUD
简单易用的状态栏指示器小框架。

## 显示成功信息
```objc
[PJStatusBarHUD showSuccessWithStatus:@"加载成功!"];
```
## 显示失败信息
```objc
[PJStatusBarHUD showErrorWithStatus:@"加载失败!"];
```
## 显示警告信息
```objc
[PJStatusBarHUD showWarningWithStatus:@"警告!!!"];
```
## 显示正在加载信息
```objc
[PJStatusBarHUD showLoadingWithStatus:@"正在加载中..."];
```
## 显示普通信息
```objc
[PJStatusBarHUD showMessageWithStatus:@"文本内容!!!"];
[PJStatusBarHUD showMessageWithStatus:@"warning!!!" image:[UIImage imageNamed:图片]];
[PJStatusBarHUD showMessageWithStatus:@"warning!!!" imageName:图片名称];
```

## 隐藏
```objc
[PJStatusBarHUD dismiss];
```