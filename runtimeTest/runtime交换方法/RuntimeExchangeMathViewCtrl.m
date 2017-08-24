//
//  RuntimeExchangeMathViewCtrl.m
//  runtimeTest
//
//  Created by apple on 17/7/20.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "RuntimeExchangeMathViewCtrl.h"
#import "People+exchangeMeth.h"
#import <objc/runtime.h>

#import "People.h"


@interface RuntimeExchangeMathViewCtrl ()

@property (nonatomic,strong)People *people ;

@end

@implementation RuntimeExchangeMathViewCtrl

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.people = [People new];
    
    
    [self.people peopleSpeak]; //别玩了。吃饭吧
    [self.people eatFood];  // 听说你是铁头娃
    
    
#if 0
    [self.people peopleSpeak];
    
    [self exchangePeopleMethod];
    
    [self.people peopleSpeak];
    
#endif
    
}


- (void)run {
    XCLog(@"别说话了，跑路吧");
}


// Method : 包含了一个方法的  方法名 + 实现 + 参数个数及类型 + 返回值个数及类型 等信息
// class_getInstanceMethod : 通过类名 + 方法名 获取一个 Method
// class_getMethodImplementation: 类名 + 方法名
// class_addMethod: 类名 + 方法名 + 方法实现 + 参数信息
-(void)exchangePeopleMethod{
    Class peopleClass = NSClassFromString(@"People"); //获取类
    SEL  peopleSpeak = @selector(peopleSpeak);
    Method methodRun =class_getInstanceMethod(peopleClass, peopleSpeak); //获取方法

    // 获取 peopleSpeak 方法的参数 （包括了 parameter and return types）
    char *typeDescription = (char *)method_getTypeEncoding(methodRun);
    
    //获取run 的实现
    IMP run = class_getMethodImplementation([self class], @selector(run));

    // 给 People 新增 run 方法，并指向的当前类中 run 的实现
    class_addMethod(peopleClass, @selector(run), run, typeDescription);
    
    // 替换 peopleSpeak 方法为 run 方法
    // class_replaceMethod : 类型 + 替换的方法名 + 替换后的实现 + 参数信息
    class_replaceMethod(peopleClass, peopleSpeak, run, typeDescription);
    

    
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
