//
//  DWTools.h
//  DrinkWater
//
//  Created by huangjinyang on 16/12/20.
//  Copyright © 2016年 huangjinyang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DWTools : NSObject

//获取当前红标
+(NSInteger)iconNumber;

//修改当前红标
+(void)changeIconNumber:(NSInteger)changed;

//清零
+(void)clear;

+(NSInteger)userWater;

+(void)changeUserWater:(NSInteger)water;

+(void)setAndShowIconNumber:(NSInteger)changed;
@end
