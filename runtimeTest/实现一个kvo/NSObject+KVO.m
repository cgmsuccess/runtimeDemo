//
//  NSObject+KVO.m
//  runtimeTest
//
//  Created by XMTX on 2019/5/15.
//  Copyright © 2019 apple. All rights reserved.
//

#import "NSObject+KVO.h"
#import <objc/message.h>
#import <objc/runtime.h>
@implementation NSObject (KVO)

- (void)xmtx_addObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath options:(NSKeyValueObservingOptions)options context:(nullable void *)context{
    
    /*
     1. runtime 动态生成 CustomKVOPerson 派生类，我们通过断点可以看到  NSKVONotifying_CustomKVOPerson
     2. 重新 KVO_CustomKVOPerson 属性的set方法， 监听属性是否有改变
     3. 修改对象的isa指针,指向自定义的派生类子类
     */
    
    /// 绑定类 ，好在派生类里面 调取 observeValueForKeyPath 方法。
    objc_setAssociatedObject(self, @"observer", observer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    ///修改isa 指向了。派生类
    object_setClass(self, NSClassFromString(@"NSKVONotifying_CustomKVOPerson"));
    
}

@end
