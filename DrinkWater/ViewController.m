//
//  ViewController.m
//  DrinkWater
//
//  Created by huangjinyang on 16/12/20.
//  Copyright © 2016年 huangjinyang. All rights reserved.
//

#import "ViewController.h"
#import "DWLocalNotification.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createUI];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)createUI{
    UIButton* button=[UIButton new];
    button.backgroundColor=[UIColor blueColor];
    [button addTarget:self action:@selector(beginNoti) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(50, 50));
    }];
    
    UIButton* button2=[UIButton new];
    button2.backgroundColor=[UIColor blueColor];
    [button2 addTarget:self action:@selector(changeNumber) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button2];
    [button2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.centerY.equalTo(self.view).offset(50);
        make.size.mas_equalTo(CGSizeMake(50, 50));
    }];

}

-(void)changeNumber{
    [DWTools changeIconNumber:-1];
}

-(void)beginNoti{
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
    
    NSDate* dateNow=[NSDate date];
    NSString *nowtimeStr = [formatter stringFromDate:dateNow];//----------将nsdate按formatter格式转成nsstring时间转时间戳的方法:
    NSString *timeSp = [NSString stringWithFormat:@"%ld", (long)[dateNow timeIntervalSince1970]];
    DWLog(@"time%@",nowtimeStr);
    DWLog(@"timeSp:%@",timeSp); //时间戳的值
    [DWLocalNotification registerLocalNotification:[dateNow timeIntervalSince1970]+10 string:[NSString stringWithFormat:@"点击时间 %f",[dateNow timeIntervalSince1970]] key:@"first"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
