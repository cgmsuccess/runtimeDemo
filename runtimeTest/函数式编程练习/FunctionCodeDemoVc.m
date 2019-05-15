//
//  FunctionCodeDemoVc.m
//  runtimeTest
//
//  Created by 周杰泉 on 2019/5/15.
//  Copyright © 2019 apple. All rights reserved.
//

#import "FunctionCodeDemoVc.h"
#import "JiSuanqiManager.h"

@interface FunctionCodeDemoVc ()

@end

@implementation FunctionCodeDemoVc

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    JiSuanqiManager *jsqManager = [[JiSuanqiManager alloc] init];
    [[jsqManager configerView:^UILabel *(UILabel * _Nonnull label) {
        label = [[UILabel alloc] init];
        label.font = [UIFont systemFontOfSize:15];
        label.text = @"函数式编程的简单练习";
        label.textColor = [UIColor redColor];
        return label;
    }] addViewAndFrame:^UILabel * _Nonnull(UILabel * _Nonnull label) {
        label.frame = CGRectMake(100, 100, 300, 300);
        [self.view addSubview:label];
        return label;
    }];
    
    
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    JiSuanqiManager *jsqManager = [[JiSuanqiManager alloc] init];
    [[jsqManager add:^NSInteger(NSInteger result) {
        result -= 5;
        result += 15;
        return result;
    }] logResult];
    
    NSLog(@"jsqManager.result = %ld" , (long)jsqManager.result);
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
