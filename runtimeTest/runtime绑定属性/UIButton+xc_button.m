//
//  UIButton+xc_button.m
//  runtimeTest
//
//  Created by apple on 17/7/14.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "UIButton+xc_button.h"

#import <objc/runtime.h>

static const NSString * namekey = @"buttonName" ;  //绑定的key
static const NSString * listenBlock = @"listenBlock" ;// block 绑定的key
static const NSString * listenBlocktype = @"listenBlocktype" ;// clickBlock属性 绑定的key
static const NSString * Bangding = @"Bangding" ;// bool属性
static const NSString * buttonIntger = @"buttonIntger" ;// int 属性


@implementation UIButton (xc_button)

//@dynamic  不自动生成get set
//@synthesize name ;如果用不不实现set get 系统就会帮他实现

@dynamic customName ;



/**  绑定 int 属性   */
-(void)setButtonIndex:(NSInteger)buttonIndex
{
    objc_setAssociatedObject(self, (__bridge const void *)(buttonIntger), [NSNumber numberWithInteger:buttonIndex], OBJC_ASSOCIATION_ASSIGN);
}

-(NSInteger)buttonIndex
{
    return [objc_getAssociatedObject(self, (__bridge const void *)(buttonIntger)) integerValue];

}

/**   绑定bool属性  */
-(void)setIsBangding:(BOOL)isBangding
{
    objc_setAssociatedObject(self, (__bridge const void *)(Bangding), [NSNumber numberWithBool:isBangding], OBJC_ASSOCIATION_ASSIGN);
}

-(BOOL)isBangding
{
    return [objc_getAssociatedObject(self, (__bridge const void *)(Bangding)) boolValue];
}


//添加customName的属性
-(NSString *)customName
{
   return   objc_getAssociatedObject(self, (__bridge const void *)(namekey));
}

-(void)setCustomName:(NSString *)customName
{
    objc_setAssociatedObject(self, (__bridge const void *)(namekey), customName, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


/**   点击动态绑定block 方式1  */

//添加block 属性
-(void)setCilckBlock:(ListeningBtnBlock)cilckBlock
{
    objc_setAssociatedObject(self, (__bridge const void *)(listenBlocktype), cilckBlock, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self removeTarget:self action:@selector(cilcktype:) forControlEvents:UIControlEventTouchUpInside];
    if (cilckBlock) {
        [self addTarget:self action:@selector(cilcktype:) forControlEvents:UIControlEventTouchUpInside];
    }
}


-(ListeningBtnBlock)cilckBlock
{
    return objc_getAssociatedObject(self, (__bridge const void *)(listenBlocktype));
}

-(void)cilcktype:(UIButton *)btn{
    if (self.cilckBlock) {
        self.cilckBlock(btn);
    }
}


/**   点击动态绑定block 方式2  */
-(void)cilckBtn:(UIControlEvents)Evers AndlistenBlock:(ListeningBtnBlock)block{
    
    objc_setAssociatedObject(self, (__bridge const void *)(listenBlock), block, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self addTarget:self action:@selector(cilckBtn:) forControlEvents:Evers];
    
}

-(void)cilckBtn:(UIButton *)button{
    ListeningBtnBlock block = objc_getAssociatedObject(self, (__bridge const void *)(listenBlock));
    if (block) {
        block(button);
    }
}


@end
