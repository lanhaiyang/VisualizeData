//
//  TrigonometricFunctionsPoint.m
//  VisualizeData
//
//  Created by ibokan on 16/3/25.
//  Copyright © 2016年 aishuo. All rights reserved.
//

#import "TrigonometricFunctionsPoint.h"

@implementation TrigonometricFunctionsPoint

/*
 正弦函数 sinθ=y/r
 余弦函数 cosθ=x/r
 正切函数 tanθ=y/x
 余切函数 cotθ=x/y
 正割函数 secθ=r/x
 余割函数 cscθ=r/y
 */
-(CGPoint)trigonometricFunctionPointWithPointAndRadian:(CGFloat)radian
                                          AndRoundRadius:(CGFloat)radius
{
    
    double y=radius*sin(radian);
    double x=radius*cos(radian);
    
    return CGPointMake(x, y);
}


-(NSArray *)pointWithRadian:(int)countNumber AndRoundRadius:(CGFloat)radius
{
    NSMutableArray *marry=[NSMutableArray array];
    CGFloat radian_num=(2*M_PI)/countNumber;
    NSLog(@"radian=%f,%f",radian_num,2*M_PI);
    for (int i=0; i<countNumber; i++)
    {
        CGPoint point=[self trigonometricFunctionPointWithPointAndRadian:i*radian_num+(M_PI/2-radian_num)
                                                          AndRoundRadius:radius];
        NSValue *pointValue=[NSValue valueWithCGPoint:point];
        [marry addObject:pointValue];
    }
    return marry;
}



-(NSMutableArray *)tringonometricFunctionPointWithPintAndRadian:(int)countNumber
                                          AndCenterHeartPoint:(CGPoint)centerHeart
                                               AndRoundRadius:(CGFloat)radius
{
   
    NSArray *marry=[self pointWithRadian:countNumber AndRoundRadius:radius];
    NSLog(@"array=%@",marry);
    //第几像线
    NSMutableArray *marray_num=[NSMutableArray array];
    for (int i=0; i<marry.count; i++)
    {
        CGPoint point =[marry[i] CGPointValue];
        point=[self numberQuadrant:centerHeart
                          AndPoint:point];
        [marray_num addObject:[NSValue valueWithCGPoint:point]];
    }
    return marray_num;
}

#pragma mark---通过象限返回对应的坐标
-(CGPoint)numberQuadrant:(CGPoint)centerHeart
                AndPoint:(CGPoint)point
{
    if(point.x>=0 && point.y>=0)
    {
        point.x=centerHeart.x+point.x;
        point.y=centerHeart.y-point.y;
    }
    else if(point.x<=0 && point.y>=0)//(-,+)
    {
        point.x=centerHeart.x+point.x;
        point.y=centerHeart.y-point.y;
    }
    else if(point.x<=0 && point.y<=0)//(-,-)
    {
        point.x=centerHeart.x+point.x;
        point.y=centerHeart.y-point.y;
    }
    else if(point.x>=0 && point.y<=0)//(+,-)
    {
        point.x=centerHeart.x+point.x;
        point.y=centerHeart.y-point.y;
    }
    return point;
}

@end
