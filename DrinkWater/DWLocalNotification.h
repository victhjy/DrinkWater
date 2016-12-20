//
//  DWLocalNotification.h
//  DrinkWater
//
//  Created by huangjinyang on 16/12/20.
//  Copyright © 2016年 huangjinyang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DWLocalNotification : NSObject
+ (void)registerLocalNotification:(NSInteger)alertTime string:(NSString *)string key:(NSString *)key;
+ (void)cancelLocalNotificationWithKey:(NSString *)key;
@end
