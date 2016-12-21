//
//  DWHomeVC.m
//  DrinkWater
//
//  Created by huangjinyang on 16/12/21.
//  Copyright © 2016年 huangjinyang. All rights reserved.
//

#import "DWHomeVC.h"
#import "DWAnimationView.h"
@interface DWHomeVC ()

@end

@implementation DWHomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    DWAnimationView* view=[DWAnimationView new];
    view.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:view];
    view.frame=self.view.frame;
    [view drawRect:self.view.frame];
    // Do any additional setup after loading the view.
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
