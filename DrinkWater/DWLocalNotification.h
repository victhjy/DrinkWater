//
//  DWLocalNotification.h
//  DrinkWater
//
//  Created by huangjinyang on 16/12/20.
//  Copyright © 2016年 huangjinyang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DWLocalNotification : NSObject
+ (void)registerLocalNotification:(NSInteger)alertTime string:(NSString *)string key:(NSString *)key daily:(BOOL)is;
+ (void)cancelLocalNotificationWithKey:(NSString *)key;

+(void)registerDailyLocalNotification:(NSDate*)alertTime key:(NSString *)key;
@end
