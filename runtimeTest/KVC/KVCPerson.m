//
//  KVCPerson.m
//  runtimeTest
//
//  Created by 陈桂民 on 2017/8/9.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "KVCPerson.h"

@interface KVCPerson()
{
    @private
    NSString  *_house;
    NSString  *car;
}

@end

@implementation KVCPerson

-(NSMutableArray *)dataSource
{
    if (!_dataSource) {
        _dataSource = [NSMutableArray new];
      
        KVCDog *dog1 = [[KVCDog alloc] init];
        dog1.name = @"xiaohuang";
        dog1.age = 5;
        dog1.eat = @"gutou";
        [_dataSource addObject:dog1];
        
        KVCDog *dog2 = [[KVCDog alloc] init];
        dog2.name = @"xiaohei";
        dog2.age = 5;
        dog2.eat = @"gutou";
        [_dataSource addObject:dog2];
        
        KVCDog *dog3 = [[KVCDog alloc] init];
        dog3.name = @"xiaobai";
        dog3.age = 5;
        dog3.eat = @"gutou";
        [_dataSource addObject:dog3];
        
    }
    return _dataSource;
}


@end
