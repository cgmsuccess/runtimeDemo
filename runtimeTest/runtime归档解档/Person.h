//
//  Person.h
//  runtimeTest
//
//  Created by apple on 17/8/2.
//  Copyright © 2017年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject<NSCoding>

/****这个属性是：姓名****/
@property (nonatomic,copy)NSString *name ;

/****这个属性是：****/
@property (nonatomic,copy)NSString *age;

/****这个属性是：****/
@property (nonatomic,assign)CGFloat weight;

@end

