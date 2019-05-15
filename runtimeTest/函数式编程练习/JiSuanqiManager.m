//
//  JiSuanqiManager.m
//  runtimeTest
//
//  Created by 周杰泉 on 2019/5/15.
//  Copyright © 2019 apple. All rights reserved.
//

#import "JiSuanqiManager.h"

@implementation JiSuanqiManager


#pragma mark 视图

-(JiSuanqiManager *)configerView:(UILabel * (^)(UILabel *label))block{
    _customeLabel = block(_customeLabel);
    return self;
}

-(JiSuanqiManager *)addViewAndFrame:(UILabel * _Nonnull (^)(UILabel * _Nonnull))block{
    block(_customeLabel);
    return self;
}


#pragma mark 计算器
-(JiSuanqiManager *)add:(NSInteger (^)(NSInteger result))block{
    
    _result = block(_result);
    
    return self;
}

-(JiSuanqiManager *)logResult{
    NSLog(@"logResult = %ld" , (long)_result);
    return self;
}

@end
