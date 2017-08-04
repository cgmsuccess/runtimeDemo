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

#import "RuntimeArchiveViewController.h"

#import "Person.h"

@interface RuntimeArchiveViewController ()

@end

@implementation RuntimeArchiveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    Person *p = [Person new];
    p.name = @"小明";
    p.age = @"14";
    p.weight = 55;
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);

    

    
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
