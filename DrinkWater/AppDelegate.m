//
//  AppDelegate.m
//  DrinkWater
//
//  Created by huangjinyang on 16/12/20.
//  Copyright © 2016年 huangjinyang. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "DWLocalNotification.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [self firstInit];
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = [[ViewController alloc] init];
    [self.window makeKeyAndVisible];
    return YES;
}

-(void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification{
    
    //在APP内部时不执行下面的步骤
    if(application.applicationState == UIApplicationStateActive){
        return;
    }
    
    DWLog(@"USERINFO:%@",notification.userInfo);
//    [[NSNotificationCenter defaultCenter]postNotificationName:@"RefreshList" object:nil];
    // 更新显示的徽章个数
//    NSInteger badge = [UIApplication sharedApplication].applicationIconBadgeNumber;
//    badge--;
//    badge = badge >= 0 ? badge : 0;
//    [UIApplication sharedApplication].applicationIconBadgeNumber = badge;
//    [DWTools changeIconNumber:-1];
}

-(void)application:(UIApplication *)application handleActionWithIdentifier:(NSString *)identifier forLocalNotification:(UILocalNotification *)notification completionHandler:(void (^)())completionHandler{
    
}

-(void)application:(UIApplication *)application handleActionWithIdentifier:(NSString *)identifier forLocalNotification:(UILocalNotification *)notification withResponseInfo:(NSDictionary *)responseInfo completionHandler:(void (^)())completionHandler{
    
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark - firstInit

-(void)firstInit{
    YYCache* cache=[[YYCache alloc]initWithName:@"dw"];
    
    NSDate *stardardDate = [NSDate date]; // 获得时间对象
    NSTimeZone *zone = [NSTimeZone systemTimeZone]; // 获得系统的时区
    NSTimeInterval time = [zone secondsFromGMTForDate:stardardDate];// 以秒为单位返回当前时间与系统格林尼治时间的差
    NSDate *nowDate = [stardardDate dateByAddingTimeInterval:time];// 然后把差的时间加上,就是当前系统准确的时间
    NSString* timeStr=[nowDate stringWithISOFormat];
    DWLog(@"弱智时间%@",stardardDate);
    DWLog(@"当前时间%@",nowDate);
    if ([nowDate weekday]==5) {
        for(int i=0;i<7;i++){
            NSDate* date=[stardardDate dateByAddingDays:i];
            NSDate* eightOClick=[NSDate dateWithString:[[date stringWithISOFormat] stringByReplacingCharactersInRange:NSMakeRange(11, 8) withString:@"08:00:00"] format: @"yyyy-MM-dd'T'HH:mm:ssZ"];
            NSString* kMonAndDay=[[date stringWithISOFormat] substringWithRange:NSMakeRange(5, 5)];
            DWLog(@"闹钟时间%@",eightOClick);
            
            
            [DWLocalNotification registerDailyLocalNotification:eightOClick key:kMonAndDay];
        }
    }
    
    if ([cache containsObjectForKey:@"firstOpen"]) {
        return;
    }
    else{
        [cache setObject:@"1" forKey:@"firstOpen"];
        
        
    }
}

@end
