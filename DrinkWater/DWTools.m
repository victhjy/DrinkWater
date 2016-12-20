//
//  DWTools.m
//  DrinkWater
//
//  Created by huangjinyang on 16/12/20.
//  Copyright © 2016年 huangjinyang. All rights reserved.
//

#import "DWTools.h"

@implementation DWTools
+(NSInteger)iconNumber{
    NSInteger number;
    YYCache* cache=[[YYCache alloc ]initWithName:@"dw"];;
    NSNumber* n=(NSNumber*)[cache objectForKey:@"iconNumber"];
    number=[n integerValue];
    return number;
}

+(void)changeIconNumber:(NSInteger)changed{
    NSInteger number;
    YYCache* cache=[[YYCache alloc ]initWithName:@"dw"];
    if ([cache containsObjectForKey:@"iconNumber"]) {
        NSNumber* n=(NSNumber*)[cache objectForKey:@"iconNumber"];
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
    
    [cache setObject:[NSNumber numberWithInteger:number] forKey:@"iconNumber"];
//    [UIApplication sharedApplication].applicationIconBadgeNumber = number;
    
}
@end
