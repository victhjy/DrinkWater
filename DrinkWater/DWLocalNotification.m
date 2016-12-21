//
//  DWLocalNotification.m
//  DrinkWater
//
//  Created by huangjinyang on 16/12/20.
//  Copyright © 2016年 huangjinyang. All rights reserved.
//

#import "DWLocalNotification.h"

@implementation DWLocalNotification
+ (void)registerLocalNotification:(NSInteger)alertTime string:(NSString *)string key:(NSString *)key daily:(BOOL)isDaily{
    UILocalNotification *notification = [[UILocalNotification alloc] init];
    // 设置触发通知的时间
    //需要使用时间戳
    NSDate *fireDate = [NSDate dateWithTimeIntervalSince1970:alertTime];
    NSLog(@"fireDate=%@",fireDate);
    notification.fireDate = fireDate;
    // 时区
    notification.timeZone = [NSTimeZone defaultTimeZone];
    // 设置重复的间隔
    notification.repeatInterval = 0;//0表示不重复
    // 通知内容
    notification.alertBody =  string;
    [DWTools changeIconNumber:1];
//    int x = arc4random() % 100;
    
    if (isDaily) {
        notification.applicationIconBadgeNumber = [DWTools userWater];
    }
    else{
        notification.applicationIconBadgeNumber =[DWTools iconNumber];
    }
    
//    [DWTools iconNumber];
    // 通知被触发时播放的声音
    notification.soundName = UILocalNotificationDefaultSoundName;
    // 通知参数
    
    NSDictionary *userDict =@{
                              string:key,
                              @"changed":@1
                              };
//    [NSDictionary dictionaryWithObject:string forKey:key];
    notification.userInfo = userDict;
    
    // ios8后，需要添加这个注册，才能得到授权
    if ([[UIApplication sharedApplication] respondsToSelector:@selector(registerUserNotificationSettings:)]) {
        UIUserNotificationType type =  UIUserNotificationTypeAlert | UIUserNotificationTypeBadge | UIUserNotificationTypeSound;
        UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:type
                                                                                 categories:nil];
        [[UIApplication sharedApplication] registerUserNotificationSettings:settings];
        // 通知重复提示的单位，可以是天、周、月
        //        notification.repeatInterval = NSCalendarUnitDay;
    } else {
        // 通知重复提示的单位，可以是天、周、月
        //        notification.repeatInterval = NSDayCalendarUnit; //ios7使用
    }
    
    // 执行通知注册
    [[UIApplication sharedApplication] scheduleLocalNotification:notification];
    
}

+ (void)cancelLocalNotificationWithKey:(NSString *)key {
    // 获取所有本地通知数组
    NSArray *localNotifications = [UIApplication sharedApplication].scheduledLocalNotifications;
    
    for (UILocalNotification *notification in localNotifications) {
        NSDictionary *userInfo = notification.userInfo;
        if (userInfo) {
            // 根据设置通知参数时指定的key来获取通知参数
            NSString *info = userInfo[key];
            
            // 如果找到需要取消的通知，则取消
            if (info != nil) {
                [[UIApplication sharedApplication] cancelLocalNotification:notification];
                break;
            }
        }
    }
}

+(void)registerDailyLocalNotification:(NSDate*)alertTime key:(NSString *)key{
    UILocalNotification *notification = [[UILocalNotification alloc] init];
    // 设置触发通知的时间
    notification.fireDate = alertTime;
    // 时区
    notification.timeZone = [NSTimeZone defaultTimeZone];
    // 设置重复的间隔
    notification.repeatInterval = 0;//0表示不重复
//    // 通知内容
    notification.alertBody =  @"那个谁，新的一天你该起床啦";
//    [DWTools setAndShowIconNumber:250];
    [DWTools changeUserWater:5];
    //    int x = arc4random() % 100;
    
//    if (isDaily) {
        notification.applicationIconBadgeNumber = [DWTools userWater];
//    }
//    else{
//        notification.applicationIconBadgeNumber =[DWTools iconNumber];
//    }
    
    //    [DWTools iconNumber];
    // 通知被触发时播放的声音
//    notification.soundName = UILocalNotificationDefaultSoundName;
    // 通知参数
    
    NSDictionary *userDict =@{
                              @"daily":@"1"
                              };
    //    [NSDictionary dictionaryWithObject:string forKey:key];
    notification.userInfo = userDict;
    
    // ios8后，需要添加这个注册，才能得到授权
    if ([[UIApplication sharedApplication] respondsToSelector:@selector(registerUserNotificationSettings:)]) {
        UIUserNotificationType type =  UIUserNotificationTypeAlert | UIUserNotificationTypeBadge | UIUserNotificationTypeSound;
        UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:type
                                                                                 categories:nil];
        [[UIApplication sharedApplication] registerUserNotificationSettings:settings];
        // 通知重复提示的单位，可以是天、周、月
        //        notification.repeatInterval = NSCalendarUnitDay;
    } else {
        // 通知重复提示的单位，可以是天、周、月
        //        notification.repeatInterval = NSDayCalendarUnit; //ios7使用
    }
    
    // 执行通知注册
    [[UIApplication sharedApplication] scheduleLocalNotification:notification];
}
@end
