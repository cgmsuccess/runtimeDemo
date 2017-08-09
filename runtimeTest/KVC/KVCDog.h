//
//  KVCDog.h
//  runtimeTest
//
//  Created by 陈桂民 on 2017/8/9.
//  Copyright © 2017年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KVCDog : NSObject

/*** 吃  ***/
@property (nonatomic,copy)NSString *eat;

/*** 名字  ***/
@property (nonatomic,copy)NSString *name;

/***   ***/
@property (nonatomic,assign)NSUInteger age;
@end
