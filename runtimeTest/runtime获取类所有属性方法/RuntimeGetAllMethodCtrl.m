//
//  RuntimeGetAllMethodCtrl.m
//  runtimeTest
//
//  Created by apple on 17/7/28.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "RuntimeGetAllMethodCtrl.h"
#import <objc/runtime.h>
#import "Dog.h"

@interface RuntimeGetAllMethodCtrl ()
{
    @private NSString *test4 ;
    @private NSString *test5 ;
    @private NSString *test6 ;
}
/****这个属性是：测runtime是否读取到了属性****/
@property (nonatomic,copy)NSString *test ;

/****这个属性是：****/
@property (nonatomic,copy)NSString *test1 ;

/****这个属性是：****/
@property (nonatomic,copy)NSString *test2 ;

/****这个属性是：****/
@property (nonatomic,copy)NSString *test3 ;

@end
@implementation RuntimeGetAllMethodCtrl

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor yellowColor];
    
#if 0
    [self getPrivateAllMethod];
    
    [self getPrivateAllIvar];
#endif
    
#if 0
    
    [self getClassAllIvar:[self class]];
    [self getClassAllMethod:[self class]];
#endif
//    
    Dog *dog = [Dog new];
    XCLog(@"%@",object_getClass([dog class]));
    [self getClassAllMethod:[dog class]];
    [self getClassAllMethod:[dog class]];
}







-(void)demo1
{

}

-(void)demo2
{
    
}
-(void)demo3
{
    
}


/*       
    class_copyPropertyList返回的仅仅是对象类的属性(@property申明的属性)，
    而class_copyIvarList返回类的所有属性和变量(包括在@interface大括号中声明的变量)，
    下面做个简单的测试。
    首先，定义一个WFrequencyManager类
*/

#pragma mark - 获取当前类所有的方法
-(void)getClassAllMethod:(Class )class
{
    unsigned int count = 0;
    Method *methods = class_copyMethodList(class, &count);
    for (int i =0; i<count; i++) {
        SEL method = method_getName(methods[i]);
        NSString *methodName = [NSString stringWithCString:sel_getName(method) encoding:NSUTF8StringEncoding];
        XCLog(@"方法 : %@",methodName);
    }
    free(methods);  //这个一定要手动释放，不然会造成内存泄漏
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
        XCLog(@"属性 --> %@ 和 %@",name,type);
    }
    free(ivers);
}

#pragma mark - 获取所有的方法(包括私有的)
-(void)getPrivateAllMethod
{
    unsigned int count = 0;
    Method *methods = class_copyMethodList([UIPageControl class], &count);
    for (int i =0; i<count; i++) {
        SEL method = method_getName(methods[i]);
        NSString *methodName = [NSString stringWithCString:sel_getName(method) encoding:NSUTF8StringEncoding];
        XCLog(@"方法 : %@",methodName);
    }
    free(methods);
}

#pragma mark - 获取所以得属性（包括私有的）
- (void)getPrivateAllIvar
{
    unsigned int count = 0 ;
    Ivar *ivers = class_copyIvarList([UIPageControl class], &count);
    for (int i = 0; i < count; i++) {
        Ivar ivar = ivers[i];
    
        NSString *name = [NSString stringWithUTF8String:ivar_getName(ivar)];
        NSString *type = [NSString stringWithUTF8String:ivar_getTypeEncoding(ivar)];
        XCLog(@"属性 --> %@ 和 %@",name,type);
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
