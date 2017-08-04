//
//  Person.m
//  runtimeTest
//
//  Created by apple on 17/8/2.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "Person.h"

@interface Person ()

@end

@implementation Person

//归档
-(void)encodeWithCoder:(NSCoder *)aCoder
{
        [aCoder encodeObject:self.name forKey:@"name"];
        [aCoder encodeObject:self.age forKey:@"age"];
        [aCoder encodeObject:@(self.weight) forKey:@"weight"];
}

//解档
-(instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self =[super init]) {
        self.name = [aDecoder decodeObjectForKey:@"name"];
        self.age = [aDecoder decodeObjectForKey:@"age"];
        self.weight = [[aDecoder decodeObjectForKey:@"weight"] doubleValue];

    }
    return self;
}


@end
