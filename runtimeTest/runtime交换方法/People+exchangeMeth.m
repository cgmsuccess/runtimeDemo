//
//  People+exchangeMeth.m
//  runtimeTest
//
//  Created by apple on 17/7/20.
//  Copyright © 2017年 apple. All rights reserved.


#import "People+exchangeMeth.h"
#import <objc/runtime.h>
@implementation People (exchangeMeth)

/*
//判断类中是否包含某个方法的实现
BOOL class_respondsToSelector(Class cls, SEL sel)
//获取类中的方法列表
Method *class_copyMethodList(Class cls, unsigned int *outCount)
//为类添加新的方法,如果方法该方法已存在则返回NO
BOOL class_addMethod(Class cls, SEL name, IMP imp, const char *types)
//替换类中已有方法的实现,如果该方法不存在添加该方法
IMP class_replaceMethod(Class cls, SEL name, IMP imp, const char *types)
//获取类中的某个实例方法(减号方法)
Method class_getInstanceMethod(Class cls, SEL name)
//获取类中的某个类方法(加号方法)
Method class_getClassMethod(Class cls, SEL name)
//获取类中的方法实现
IMP class_getMethodImplementation(Class cls, SEL name)
//获取类中的方法的实现,该方法的返回值类型为struct
IMP class_getMethodImplementation_stret(Class cls, SEL name)

//获取Method中的SEL
SEL method_getName(Method m)
//获取Method中的IMP
IMP method_getImplementation(Method m)
//获取方法的Type字符串(包含参数类型和返回值类型)
const char *method_getTypeEncoding(Method m)
//获取参数个数
unsigned int method_getNumberOfArguments(Method m)
//获取返回值类型字符串
char *method_copyReturnType(Method m)
//获取方法中第n个参数的Type
char *method_copyArgumentType(Method m, unsigned int index)
//获取Method的描述
struct objc_method_description *method_getDescription(Method m)
//设置Method的IMP
IMP method_setImplementation(Method m, IMP imp)
//替换Method
void method_exchangeImplementations(Method m1, Method m2)

//获取SEL的名称
const char *sel_getName(SEL sel)
//注册一个SEL
SEL sel_registerName(const char *str)
//判断两个SEL对象是否相同
BOOL sel_isEqual(SEL lhs, SEL rhs)

//通过块创建函数指针,block的形式为^ReturnType(id self,参数,...)
IMP imp_implementationWithBlock(id block)
//获取IMP中的block
id imp_getBlock(IMP anImp)
//移出IMP中的block
BOOL imp_removeBlock(IMP anImp)

//调用target对象的sel方法
id objc_msgSend(id target, SEL sel, 参数列表...)

*/
+(void)load
{
    
#if 0
    // Method : 包含了一个方法的  方法名 + 实现 + 参数个数及类型 + 返回值个数及类型 等信息
    // class_getInstanceMethod : 通过类名 + 方法名 获取一个 Method
    // class_getMethodImplementation: 类名 + 方法名
    // class_addMethod: 类名 + 方法名 + 方法实现 + 参数信息
    // class_replaceMethod : 类型 + 替换的方法名 + 替换后的实现 + 参数信息
    
    //class_getInstanceMethod     得到类的实例方法
    
    //class_getClassMethod         得到类的类方法
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        
#warning  object_getClass([self class])  [self class] ; 0x100092220 0x1000921f8 内存地址不同，为什么呢
      //  Class _class = object_getClass([self class]);  //用这个拿class  居然替换失败，不知道为什么。
        
        Class class = [self class];
        
        SEL original = @selector(peopleSpeak); //初始化需要被替换的原始方法      1.
        //得到类的实例方法                                                      2.
        Method original_peopleSpeak = class_getInstanceMethod(class, original);
        //获取方法的Type字符串(包含参数类型和返回值类型 )                           3.
        char *originalString = (char *)method_getTypeEncoding(original_peopleSpeak);
        //获取实现方法                                                          4.
        IMP originalIMP = method_getImplementation(original_peopleSpeak);
        
        //替换的方法
        SEL swap = @selector(eatFood);
        Method swap_eatFood = class_getInstanceMethod(self, swap);
        char *swapString = (char *)method_getTypeEncoding(swap_eatFood);
        IMP swapIMP = method_getImplementation(swap_eatFood);
        
        //为类添加新的方法,如果该方法已存在则返回NO                              5.
        // class_addMethod: 类名 + 方法名 + 方法实现 + 参数信息
        BOOL addSucess = class_addMethod(class, original, swapIMP, swapString);
        
        if (addSucess) {
        // class_replaceMethod : 类型 + 需要替换的方法名 + 替换后的实现 + 参数信息
            class_replaceMethod(class, swap, originalIMP, originalString);
        }else{
            // 添加失败，表明已经有这个方法，直接交换
            method_exchangeImplementations(original_peopleSpeak, swap_eatFood);
        }
        
        
    });
#endif 
    
    //上面写的很繁琐 ,这是想要被替换的方法  
    Method originalMethod = class_getInstanceMethod([self class], NSSelectorFromString(@"peopleSpeak"));
    //替换方法
    Method exchangeMethod = class_getInstanceMethod([self class], NSSelectorFromString(@"eatFood"));
    
    method_exchangeImplementations(originalMethod, exchangeMethod);
    
}

-(void)eatFood
{
    XCLog(@"别玩了。吃饭吧");
}


@end

