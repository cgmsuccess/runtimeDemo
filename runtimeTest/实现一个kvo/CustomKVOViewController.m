//
//  CustomKVOViewController.m
//  runtimeTest
//
//  Created by XMTX on 2019/5/15.
//  Copyright © 2019 apple. All rights reserved.
/*
    kvo 内部实现
 1. runtime 动态生成 CustomKVOPerson 派生类，我们通过断点可以看到  NSKVONotifying_CustomKVOPerson
 2. 重新 KVO_CustomKVOPerson 属性的set方法， 监听属性是否有改变
 3. 修改对象的isa指针
 
 https://www.jianshu.com/p/0bbc0c15add9  这个写的很好
 */

#import "CustomKVOViewController.h"
#import "CustomKVOPerson.h"
#import "NSObject+KVO.h"  ///自定义的 kvo
@interface CustomKVOViewController ()

@property (nonatomic,strong) CustomKVOPerson  *person;


@end

@implementation CustomKVOViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    CustomKVOPerson *p = [[CustomKVOPerson alloc] init];
    _person = p;
    [p xmtx_addObserver:self forKeyPath:@"age" options:NSKeyValueObservingOptionNew context:nil];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    NSLog(@"x-x--xx--x-x-x-x--x");
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    _person.age += 1;
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    
    NSLog(@"%@",[object valueForKey:@"age"]);

}

-(void)dealloc{
    [self removeObserver:self forKeyPath:@"age"];
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
