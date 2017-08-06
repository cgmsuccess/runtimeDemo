//
//  Person.m
//  runtimeTest
//
//  Created by apple on 17/8/2.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "Person.h"
#import <objc/runtime.h>
@interface Person ()

@end

@implementation Person

#if 0
//归档  这是普通方法的实现，但是当对象的属性非常多的时候，就会很繁琐，所以我们利用runtime
-(void)encodeWithCoder:(NSCoder *)aCoder
{
        [aCoder encodeObject:self.name forKey:@"name"];
        [aCoder encodeObject:self.age forKey:@"age"];
        [aCoder encodeObject:@(self.weight) forKey:@"weight"];
}

//解档
-(instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self =[super init]) {
        self.name = [aDecoder decodeObjectForKey:@"name"];
        self.age = [aDecoder decodeObjectForKey:@"age"];
        self.weight = [[aDecoder decodeObjectForKey:@"weight"] doubleValue];
    }
    return self;
}

- (id)copyWithZone:(nullable NSZone *)zone{
    
}


#endif

#if 1
//这是runtime 的方法 NSCoding 实现归档的协议
-(void)encodeWithCoder:(NSCoder *)aCoder
{
    unsigned int count = 0;
    Ivar *ivars = class_copyIvarList([self class], &count); //获取所有的属性
    for (int i = 0; i<count; i++) {
        //取出变量
        Ivar ivar = ivars[i];
        //查看变量的名字
        NSString *name = [NSString stringWithUTF8String:ivar_getName(ivar)];
        //查看变量的类型
        //NSString *type = [NSString stringWithUTF8String:ivar_getTypeEncoding(ivar)];
        //  利用KVC取出属性对应的值
        id value = [self valueForKey:name];
        //实现归档
        [aCoder encodeObject:value forKey:name];
    }
    //  记住C语言中copy出来的要进行释放
    free(ivars);

}
//解档
-(instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self =[super init]) {
        unsigned int count = 0;
        Ivar *ivars = class_copyIvarList([self class], &count);
        for (int i = 0; i<count; i++) {
            //取出变量
            Ivar ivar = ivars[i];
            //查看变量的名字
            NSString *name = [NSString stringWithUTF8String:ivar_getName(ivar)];
            //取出变量的值
            id value = [aDecoder decodeObjectForKey:name];
            //KVC 赋值
            [self setValue:value forKeyPath:name];
        }
        free(ivars);
    }
    return self;
}

#endif


@end
