//
//  NSKVONotifying_CustomKVOPerson.m
//  runtimeTest
//
//  Created by XMTX on 2019/5/15.
//  Copyright © 2019 apple. All rights reserved.
// CustomKVOPerson  kvo的派生类。子类

#import "NSKVONotifying_CustomKVOPerson.h"
#import <objc/runtime.h>

@implementation NSKVONotifying_CustomKVOPerson

-(void)setAge:(NSInteger)age{
    
    NSLog(@"_age = %ld" , age);
    
    [self willChangeValueForKey:@"age"];

    [super setAge:age];
    
    NSLog(@"进入了派生类");
    
    [self didChangeValueForKey:@"age"];

    [objc_getAssociatedObject(self, @"observer") observeValueForKeyPath:@"age" ofObject:self change:nil context:nil];
    
    NSLog(@"_age = %ld" , age);

    
}

@end
