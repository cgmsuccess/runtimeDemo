//
//  UIButton+xc_button.h
//  runtimeTest
//
//  Created by apple on 17/7/14.
//  Copyright © 2017年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 监听button 点击事件 的block  回调 
 */
typedef void(^ListeningBtnBlock)(UIButton *btn);

@interface UIButton (xc_button)

/**
 我们动态给 BUtton 添加一个属性
 */
@property (nonatomic,copy)NSString *customName ;



/**
 给他添加 一个 点击的block 属性  点击回调 事件  方式 1
 */
@property (nonatomic,copy)ListeningBtnBlock cilckBlock;


/**
 监听button 点击事件，动态添加block 属性  方式2
 @param Evers button 的状态
 @param block 点击回调
 */
-(void)cilckBtn:(UIControlEvents )Evers AndlistenBlock:(ListeningBtnBlock)block;


@end
