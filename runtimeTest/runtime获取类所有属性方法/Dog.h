//
//  Dog.h
//  runtimeTest
//
//  Created by apple on 17/7/29.
//  Copyright © 2017年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Dog : NSObject

/****这个属性是：****/
@property (nonatomic,copy)NSString *run ;

/****这个属性是：****/
@property (nonatomic,copy)NSString *eat ;

/****这个属性是：****/
@property (nonatomic,copy)NSString *age ;

-(void)eatFood;

-(void)speak;


@end
