//
//  ViewController.m
//  runtimeTest
//
//  Created by apple on 17/7/14.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "ViewController.h"

#import "RunTimeMethodViewController.h"

//http://www.cocoachina.com/ios/20160523/16386.html
#import "RuntimeExchangeMathViewCtrl.h"


@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.navigationController.automaticallyAdjustsScrollViewInsets = NO ;
    // 处理cell间距,默认tableView分组样式,有额外头部和尾部间距
    self.tableView.sectionHeaderHeight = 30;
    self.tableView.sectionFooterHeight = 0;


}


-(void)cilck:(NSInteger)index
{
    switch (index) {
        case 0:{
            RunTimeMethodViewController *rtMethodCtrl = [[RunTimeMethodViewController alloc] init];
            [self.navigationController pushViewController:rtMethodCtrl animated:YES];
            break;
        }
        case 1:{
            RuntimeExchangeMathViewCtrl *exchangeCtrl = [[RuntimeExchangeMathViewCtrl alloc] init];
            [self.navigationController pushViewController:exchangeCtrl animated:YES];
            break ;
        }
        default:
            break;
    }
}

#pragma mark UItableViewDelegate  UItableViewDataSorce

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"indexPath.secton = %ld , indexPath.row = %ld" ,indexPath.section ,indexPath.row);
    [self cilck:indexPath.row];
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.01;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 30 ;
}



@end
