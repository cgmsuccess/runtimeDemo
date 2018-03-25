//
//  RunTimeMethodViewController.m
//  runtimeTest
//
//  Created by apple on 17/7/14.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "RunTimeMethodViewController.h"
#import <objc/message.h>


@interface RunTimeMethodViewController ()

@end

@implementation RunTimeMethodViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *NormalButton = [UIButton buttonWithType:UIButtonTypeCustom];
    NormalButton.backgroundColor = [UIColor blackColor];
    NormalButton.frame = CGRectMake(10, 100, 200, 100);
    [NormalButton setTitle:@"普通的button" forState:UIControlStateNormal];
    [self.view addSubview:NormalButton];
    [NormalButton addTarget:self action:@selector(setbackColor) forControlEvents:UIControlEventTouchUpInside];
    NormalButton.customName = @"普通的button" ;  
    
    UIButton *runtimelButton = [UIButton buttonWithType:UIButtonTypeCustom];
    runtimelButton.backgroundColor = [UIColor blackColor];
    runtimelButton.frame = CGRectMake(10, 300, 200, 100);
    [runtimelButton setTitle:@"runtimelButton" forState:UIControlStateNormal];
    [self.view addSubview:runtimelButton];
    runtimelButton.customName = @"runtimelButton" ;
    runtimelButton.isBangding = YES;
    runtimelButton.buttonIndex = 5;
    XCLog(@" runtimelButton.isBangding = %d  runtimelButton.buttonIndex = %ld", runtimelButton.isBangding ,  runtimelButton.buttonIndex );

    //点语法
    runtimelButton.cilckBlock = ^(UIButton *btn){
        XCLog(@"这是给button协议属性定义的block，调用方法 + buttonName = %@" ,btn.customName);
    };
    
#if 0
    //set 语法
    [runtimelButton setCilckBlock:^(UIButton *btn){
        XCLog(@"set 语法 调用");
    }];
#endif
    
    
    
#if 0
    //选中项目 - Project - Build Settings - ENABLE_STRICT_OBJC_MSGSEND 将其设置为 NO 即可 不然报Too many arguments to function call, expected 0, have *，在XCode5.1里能编译通过的，到xcode6就报错
    objc_msgSend(self,@selector(setbackColor));
    
    [self setbackColor];  //他的runtime 发送消息
#endif
    
}

-(void)backcolr:(UIColor *)color{
    
    self.view.backgroundColor = color;

}

/**
 这是调用的方法 我们用 runtime 和 普通的写法 2种方式调用
 */

-(void)setbackColor{


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
