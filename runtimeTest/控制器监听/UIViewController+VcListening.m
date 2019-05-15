//
//  UIViewController+VcListening.m
//  runtimeTest
//
//  Created by 周杰泉 on 2019/5/15.
//  Copyright © 2019 apple. All rights reserved.
//

#import "UIViewController+VcListening.h"

const void *const kHasBeenPoppedKey = &kHasBeenPoppedKey;


@implementation UIViewController (VcListening)


+ (void)load {

    Method originalMethod = class_getInstanceMethod([self class], NSSelectorFromString(@"viewWillAppear:"));
    //替换方法
    Method exchangeMethod = class_getInstanceMethod([self class], NSSelectorFromString(@"swizzled_viewWillAppear:"));
    
    method_exchangeImplementations(originalMethod, exchangeMethod);
    
}

- (void)swizzled_viewWillAppear:(BOOL)animated {
    [self swizzled_viewWillAppear:animated];
    NSLog(@"当前进入的控制器是🤪 %@🤪" , NSStringFromClass([self class]));
    objc_setAssociatedObject(self, kHasBeenPoppedKey, @(NO), OBJC_ASSOCIATION_RETAIN);
}

@end

