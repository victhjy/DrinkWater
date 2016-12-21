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
{
    UIDatePicker* datePicker;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createUI];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)createUI{
    self.view.backgroundColor=[UIColor whiteColor];
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
    
    datePicker=[[UIDatePicker alloc]init];
    datePicker.timeZone=[NSTimeZone timeZoneWithName:@"GTM+8"];
    datePicker.minimumDate=[NSDate dateWithTimeIntervalSinceNow:72 * 60 * 60 * -1]; // 设置最小时间
    datePicker.maximumDate = [NSDate dateWithTimeIntervalSinceNow:72 * 60 * 60]; // 设置最大时间
    datePicker.datePickerMode=UIDatePickerModeDateAndTime;
    [datePicker addTarget:self action:@selector(datePickerChanged:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:datePicker];
    [datePicker mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.view);
        make.height.mas_equalTo(0);
    }];
    datePicker.hidden=YES;
}

#pragma mark - DatePicker选中的时间

-(void)datePickerChanged:(UIDatePicker* )sender{
    NSDate* selectDate=[sender date];
    DWLog(@"%@",selectDate);
}

#pragma mark - 选择时间视图的出现和隐藏

-(void)showDatePicker{
    datePicker.hidden=NO;
    [datePicker mas_updateConstraints:^(MASConstraintMaker *make) {
//        make.left.right.bottom.equalTo(self.view);
        make.height.mas_equalTo(180);
    }];
    [self.view setNeedsUpdateConstraints];
    [self.view updateConstraintsIfNeeded];
    [UIView animateWithDuration:0.3 animations:^{
        [self.view layoutSubviews];
    }];
}

-(void)hideDatePicker{
    [datePicker mas_updateConstraints:^(MASConstraintMaker *make) {
//        make.left.right.bottom.equalTo(self.view);
        make.height.mas_equalTo(1);
    }];
//    [self.view setNeedsUpdateConstraints];
//    [self.view updateConstraintsIfNeeded];
    [UIView animateWithDuration:0.3 animations:^{
//        [datePicker mas_remakeConstraints:^(MASConstraintMaker *make) {
//            make.left.right.bottom.equalTo(self.view);
//            make.height.mas_equalTo(1);
//        }];
        [self.view layoutIfNeeded];
//        [self.view layoutSubviews];
    } completion:^(BOOL finished) {
        datePicker.hidden=YES;
    }];
}

-(void)changeNumber{
//    [DWTools changeIconNumber:-1];
//    [DWTools clear];
    [self showDatePicker];
}

-(void)beginNoti{
    [self hideDatePicker];
    return;
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
    
    NSDate* dateNow=[NSDate date];
    NSString *nowtimeStr = [formatter stringFromDate:dateNow];//----------将nsdate按formatter格式转成nsstring时间转时间戳的方法:
    NSString *timeSp = [NSString stringWithFormat:@"%ld", (long)[dateNow timeIntervalSince1970]];
    DWLog(@"time%@",nowtimeStr);
    DWLog(@"timeSp:%@",timeSp); //时间戳的值
    [DWLocalNotification registerLocalNotification:[dateNow timeIntervalSince1970]+10 string:[NSString stringWithFormat:@"点击时间 %f",[dateNow timeIntervalSince1970]] key:@"first"daily:NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
