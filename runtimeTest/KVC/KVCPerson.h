//
//  KVCPerson.h
//  runtimeTest
//
//  Created by 陈桂民 on 2017/8/9.
//  Copyright © 2017年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KVCDog.h"
@interface KVCPerson : NSObject
/***  说话 ***/
@property (nonatomic,copy)NSString *speak;
/***  吃东西 ***/
@property (nonatomic,copy)NSString *eat;
/***  钱 ***/
@property (nonatomic,copy)NSString *money;
/***   车 ***/
@property (nonatomic,copy)NSString *name;

/*** 狗  ***/
@property (nonatomic,strong)KVCDog *dog;

/*** 这个人有许多条狗 ***/
@property (nonatomic,strong)NSMutableArray  *dataSource;


@end
