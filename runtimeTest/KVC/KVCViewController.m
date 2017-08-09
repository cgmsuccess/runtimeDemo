//
//  KVCViewController.m
//  runtimeTest
//
//  Created by 陈桂民 on 2017/8/9.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "KVCViewController.h"
#import <objc/runtime.h>
#import "KVCDog.h"
#import "KVCPerson.h"

@interface KVCViewController ()

@end

@implementation KVCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
#if 0
    //kvc修改类的属性
    [self  fixproperty];
#endif
  
    
    
#if 1
    //runtime 取出类的所有属性，kvc 修改私有属性
    [self fixPrivateIver];
#endif
 
    
    
    
#if 1
    //forKey  和 forKeyPath 区别
    [self kvcDistinction];
#endif
  
    
    
    
#if 1
    //KVC 一些有趣的方法
    [self kvcMethod];
#endif
    
    
}

-(void)kvcMethod
{
    KVCPerson * p = [[KVCPerson alloc] init];
    
    //取出人 的dataSource 每一个元素的name的值，再把这些值放到一个新的数组里面
    NSArray *dogNames = [p valueForKeyPath:@"dataSource.name"];
    
    NSLog(@"dogNames = %@" ,dogNames);
    
    double ages = [[p valueForKeyPath:@"dataSource.@sum.age"] doubleValue];
    NSLog(@"ages = %f",ages);
}

/**
forKey  和 forKeyPath 区别
 */
-(void)kvcDistinction
{
    KVCPerson *p = [KVCPerson new];
    p.name = @"小明";
    p.dog = [[KVCDog alloc] init];
    
    //3种给狗命名的方式
//1，    p.dog.name = @"小白";
//2，   [p.dog setValue:@"小黑" forKey:@"name"];
    
    [p setValue:@"小花" forKeyPath:@"dog.name"];
    //区别在这里
    // *****  [p setValue:@"小花" forKey:@"dog.name"];  ******/
    //报错 this class is not key value coding-compliant for the key dog.name.'  ，也是就是说他在person类里面去找 dog.name 。所有找不到报错 可以forKeyPath更为强大
    
    NSLog(@"p.dog.name = %@" ,p.dog.name);
    
}

/**
 修改类的属性
 */
-(void)fixproperty
{
    KVCPerson *p = [KVCPerson new];
    p.speak = @"老铁双击 66";
    NSLog(@"p.speak %@ ",p.speak);
    [p setValue:@"没毛病。老铁" forKey:@"_speak"];
//    [p setValue:@"没毛病。老铁" forKey:@"speak"];  和上面等效,为什么_speak 和 speak没区别，因为kvc会先去找speak属性，找不到他就回去找_speak

    NSLog(@"%@",p.speak);
}

/**
 runtime 读取类属性，并修改
 */
-(void)fixPrivateIver
{
    KVCPerson *p = [KVCPerson new];
    //runtime 获取所有的变量
    [self getClassAllIvar:[KVCPerson class]];
    [p setValue:@"茅草屋" forKey:@"house"]; //赋值，修改等。 所有object-c 没有真正的私有
    NSLog(@"%@",[p valueForKey:@"house"]); //取值。
}


#pragma mark - 获取当前类所有属性 包括私有的
- (void)getClassAllIvar:(Class )class
{
    unsigned int count = 0 ;
    Ivar *ivers = class_copyIvarList(class, &count);
    for (int i = 0; i < count; i++) {
        Ivar ivar = ivers[i];
        NSString *name = [NSString stringWithUTF8String:ivar_getName(ivar)];
        NSString *type = [NSString stringWithUTF8String:ivar_getTypeEncoding(ivar)];
        NSLog(@"属性 --> %@ 和 %@",name,type);
    }
    free(ivers);
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
