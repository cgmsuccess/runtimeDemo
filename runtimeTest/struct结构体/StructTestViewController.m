//
//  StructTestViewController.m
//  runtimeTest
//
//  Created by apple on 17/8/24.
//  Copyright © 2017年 apple. All rights reserved.
/* http://blog.csdn.net/sdzh2012/article/details/47802955 参考 结构体
 http://www.cnblogs.com/li-baibo/archive/2013/07/12/3185629.html  NSValue
2.结构体
 构造类型：由已有的数据类型构成类型
 1、数组：多个同种类型的数据构成的那么一种类型
 特点：只能存放一种数类型
 2、结构体：从来存放表示某种特定含义的一组数据
 它是对数据封装
 函数对功能封装
 好处：提高代码的可读性
 提高数据易用性
 提高代码可维护性
 */

/*
 4.结构体作用域
 在函数内部，结构类型作用域就如同局部变量一样
 在外边定义的结构体类型像全局变量的作用域
 作用域：从定义的那一行开始直到文件的结束
 注意点：结构类型不能声明
 结构体类型的作用，除了不能声明以外，其他与普通变量一样
 */

#import "StructTestViewController.h"

#warning  在ARC环境下，在结构体中使用objc对象，必须使用_unsafe_unretained，这个是苹果的规定。

/**
 结构体定义方式 1
 */
struct Dog{
   __unsafe_unretained NSString *name;
    NSInteger age;
};


// Date 可省略，结构体类型名为 Date
typedef struct Date {
    
    int year;
    int month;
    int day;
} testDate;



@interface StructTestViewController ()

@end

@implementation StructTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
  
    
    [self test1];
    
    [self test2];
    
    [self test3];
    
    
    
    
    //结构体存放数组，----！！！ 不能存入数组
    [self test4];

}

/**
 全局的结构体
 */
-(void)test1
{
    struct Dog dog = {@"小花",5};
    dog.name = @"小白";
    dog.age = 6;
    XCLog(@"dog.name = %@ dog.age = %ld,",dog.name ,(long)dog.age);
    
    //NSValue 存
    NSValue *valueData2 = [NSValue valueWithBytes:&dog objCType:@encode(struct Dog)];
    //NSValue 取
    struct Dog dog2;
    [valueData2 getValue:&dog2];
    XCLog(@"dog2.name = %@ dog2.age = %ld,",dog2.name ,(long)dog2.age);

}

/**
 局部的结构体
 */
-(void)test2
{
    struct Person{
        NSInteger number;
        char *name;
        NSInteger age;
    };
    struct Person p = {10086,"韩梅梅",20};
    XCLog(@"p.name = %s,p.age = %ld ,p.number = %ld" ,p.name,(long)p.age,(long)p.number);
    //p.name = Èü©Ê¢ÖÊ¢Ö,p.age = 20 ,p.number = 10086
#warning  Èü©Ê¢ÖÊ¢Ö 字符打印结果是这样 ，why？ 。
}

-(void)test3
{
    testDate date = {2008,8,8};
    XCLog(@"year %d month %d day %d",date.year,date.month,date.day);
}

-(void)test4
{
    testDate date1 = {2008,8,8};

    testDate date2 = {2009,8,8};

    testDate date3 = {2010,8,8};
    
    NSMutableArray *dataSource = [NSMutableArray new];
    
    //数组只能存放对象。 结构体不是对象，而是对数据的封装， 那么我们想把他放到数组怎么办。
  //  [dataSource addObject:date1];
//    NSValue *customValue = [NSValue valueWithBytes:&date1 objCType:@encode(struct Dog)];
    
    //存
    NSValue *valueData1 = [NSValue valueWithBytes:&date1 objCType:@encode(testDate)];
    NSValue *valueData2 = [NSValue valueWithBytes:&date2 objCType:@encode(testDate)];
    NSValue *valueData3 = [NSValue valueWithBytes:&date3 objCType:@encode(testDate)];

    [dataSource addObject:valueData1];
    [dataSource addObject:valueData2];
    [dataSource addObject:valueData3];

    //    取出数据 
    testDate tmpeData1;
    //取
    NSValue *customValue1 = dataSource.firstObject;
    [customValue1 getValue:&tmpeData1];
    XCLog(@"year %d month %d day %d",tmpeData1.year,tmpeData1.month,tmpeData1.day);
}


-(void)dealloc
{
    XCLog(@"dealloc ,%@" ,[self class]);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
