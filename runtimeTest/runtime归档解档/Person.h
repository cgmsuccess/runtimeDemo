//
//  Person.h
//  runtimeTest
//
//  Created by apple on 17/8/2.
//  Copyright © 2017年 apple. All rights reserved.
/*
 
 归档字符串 和 int 类型

*/

#import <Foundation/Foundation.h>

@interface Person : NSObject<NSCoding,NSCopying>

/****这个属性是：姓名****/
@property (nonatomic,copy)NSString *name ;

/****这个属性是：****/
@property (nonatomic,copy)NSString *age;

/****这个属性是： int 类型 ****/
@property (nonatomic,assign)CGFloat weight;

@end

