//
//  DWTools.m
//  DrinkWater
//
//  Created by huangjinyang on 16/12/20.
//  Copyright © 2016年 huangjinyang. All rights reserved.
//

#import "DWTools.h"
#import "Defines.h"
@implementation DWTools
+(NSInteger)iconNumber{
    NSInteger number;
    YYCache* cache=[[YYCache alloc ]initWithName:TABLENAME];;
    NSNumber* n=(NSNumber*)[cache objectForKey:ICONNUMBER];
    number=[n integerValue];
    return number;
}

+(void)changeIconNumber:(NSInteger)changed{
    NSInteger number;
    YYCache* cache=[[YYCache alloc ]initWithName:TABLENAME];
    if ([cache containsObjectForKey:ICONNUMBER]) {
        NSNumber* n=(NSNumber*)[cache objectForKey:ICONNUMBER];
        number=[n integerValue];
        number+=changed;
    }
    else{
        if (changed>0) {
            number=changed;
        }
        else{
            DWLog(@"0&&<0");
        }
    }
    
    [cache setObject:[NSNumber numberWithInteger:number] forKey:ICONNUMBER];
//    [UIApplication sharedApplication].applicationIconBadgeNumber = number;
    
}

+(void)setAndShowIconNumber:(NSInteger)changed{
    YYCache* cache=[[YYCache alloc ]initWithName:TABLENAME];
    [cache setObject:[NSNumber numberWithInteger:changed] forKey:ICONNUMBER];
    [UIApplication sharedApplication].applicationIconBadgeNumber = changed;
}

+(void)clear{
    YYCache* cache=[[YYCache alloc ]initWithName:TABLENAME];
    if ([cache containsObjectForKey:ICONNUMBER]) {
        [cache setObject:@0 forKey:ICONNUMBER];
        [UIApplication sharedApplication].applicationIconBadgeNumber = 0;
        DWLog(@"clear");
    }
}

+(NSInteger)userWater{
    NSInteger water=0;
    YYCache* cache=[[YYCache alloc ]initWithName:TABLENAME];
    if ([cache containsObjectForKey:USERWATER]) {
        NSNumber* n=(NSNumber* )[cache objectForKey:USERWATER];
        water=[n integerValue];
    }
    
    return water;
}

+(void)changeUserWater:(NSInteger)water{
    NSNumber* n=[NSNumber numberWithInteger:water];
    YYCache* cache=[[YYCache alloc ]initWithName:TABLENAME];
    [cache setObject:n forKey:USERWATER];

}
@end
