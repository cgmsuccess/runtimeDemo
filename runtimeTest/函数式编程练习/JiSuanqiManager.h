//
//  JiSuanqiManager.h
//  runtimeTest
//
//  Created by 周杰泉 on 2019/5/15.
//  Copyright © 2019 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface JiSuanqiManager : NSObject

@property (nonatomic,assign) NSInteger  result;

@property (nonatomic,strong) UILabel  *customeLabel;

#pragma mark 视图  这2个方法，没卵用，
-(JiSuanqiManager *)configerView:(UILabel *(^)(UILabel *label))block;
-(JiSuanqiManager *)addViewAndFrame:(UILabel *(^)(UILabel *label))block;



#pragma mark 计算器
-(JiSuanqiManager *)add:(NSInteger (^)(NSInteger result))block;

-(JiSuanqiManager *)logResult;

@end

NS_ASSUME_NONNULL_END
