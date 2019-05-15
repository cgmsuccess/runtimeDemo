//
//  NSObject+KVO.h
//  runtimeTest
//
//  Created by XMTX on 2019/5/15.
//  Copyright © 2019 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (KVO)

- (void)xmtx_addObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath options:(NSKeyValueObservingOptions)options context:(nullable void *)context;


@end

NS_ASSUME_NONNULL_END
