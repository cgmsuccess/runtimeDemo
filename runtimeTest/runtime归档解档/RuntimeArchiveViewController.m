//
//  RuntimeArchiveViewController.m
//  runtimeTest
//
//  Created by apple on 17/8/2.
//  Copyright © 2017年 apple. All rights reserved.
//
//

/*
 //获取Caches路径
 NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
 
 
 //获取Library路径
 NSArray *paths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
 
 
 //获取Documents路径
 NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
 
 */

typedef void (^myblock)(void);

#import "RuntimeArchiveViewController.h"

#import "Person.h"

@interface RuntimeArchiveViewController ()



@end

@implementation RuntimeArchiveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];

#if 0
    //eg :这是字典的存储沙河的方式   NSCoding 要存入沙河必须遵循这个协议。所以要存储对象的时候我们也需要遵循这个协议   NSCopying 这个是复制的协议，例如 nsarry 和 nsdictionary 都遵循了这2个协议所以可以归档和复制，同理我们的对象要想复制和归档我们也应该遵循这2个协议
    [self dicArchivie];
#endif
    
#if 1
    [self customObject];
#endif

    
}



/**
    自定义对象的沙盒存取  NSKeyedArchiver 必须用这个
 */
-(void)customObject
{
    Person *p = [Person new];
    p.name = @"小明";
    p.age = @"14";
    p.weight = 55;
    
    NSString *chahe = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
    NSString *path = [chahe stringByAppendingString:@"accton.archive"];
    NSLog(@"path = %@",path) ;
    //自定义对象的存储必须用 NSKeyedArchiver  不能用 writeToFile
    //writeToFile适用 NSArray 和 NSDictionary
    [NSKeyedArchiver archiveRootObject:p toFile:path]; //自定义对象   沙盒 存
    Person *person =  [NSKeyedUnarchiver unarchiveObjectWithFile:path];// 自定义对象   沙盒 取
    NSLog(@"%@ %@ %f" ,person.name,person.age,person.weight);
    
    
    //这里copy Person 必须实现NSCoying
//    Person *p1 = [Person mutableCopy];
//    NSLog(@"p1.name = %@" ,p1.name);
    
}

/**
   字典的存取 沙盒路径
 */
-(void)dicArchivie
{
    NSString *chahe = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
    NSString *path = [chahe stringByAppendingString:@"accont.plist"];
    NSDictionary *dic = @{@"name":@"xiaoming",@"age":@"18"};
    //存
    [dic writeToFile:path atomically:YES];
    NSLog(@"paths = %@",path);
    //取
    NSDictionary *dicM = [NSDictionary dictionaryWithContentsOfFile:path];
    NSLog(@"dicM = %@",dicM);
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
