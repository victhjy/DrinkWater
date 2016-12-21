//
//  DWAnimationView.m
//  DrinkWater
//
//  Created by huangjinyang on 16/12/21.
//  Copyright © 2016年 huangjinyang. All rights reserved.
//

#import "DWAnimationView.h"

@implementation DWAnimationView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
     Drawing code
}
*/

-(void)drawRect:(CGRect)rect{
    [[UIColor redColor] set];
    
    UIBezierPath* path = [UIBezierPath bezierPath];
    
    path.lineWidth     = 5.f;
    path.lineCapStyle  = kCGLineCapRound;
    path.lineJoinStyle = kCGLineCapRound;
    
    [path moveToPoint:CGPointMake(20, 100)];
    // 给定终点和控制点绘制贝塞尔曲线
    [path addQuadCurveToPoint:CGPointMake(150, 100) controlPoint:CGPointMake(20, 0)];
    [path addQuadCurveToPoint:CGPointMake(150,300) controlPoint:CGPointMake(300, 300)];
    [path stroke];
}

@end
