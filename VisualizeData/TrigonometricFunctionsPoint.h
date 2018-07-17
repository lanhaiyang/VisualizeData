//
//  TrigonometricFunctionsPoint.h
//  VisualizeData
//
//  Created by ibokan on 16/3/25.
//  Copyright © 2016年 aishuo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TrigonometricFunctionsPoint : NSObject

//角度转坐标
-(CGPoint)trigonometricFunctionPointWithPointAndRadian:(CGFloat)radian
                                          AndRoundRadius:(CGFloat)radius;

-(NSMutableArray *)tringonometricFunctionPointWithPintAndRadian:(int)countNumber
                                          AndCenterHeartPoint:(CGPoint)centerHeart
                                               AndRoundRadius:(CGFloat)radius;

//返回一个象限坐标数组
-(NSArray *)pointWithRadian:(int)countNumber AndRoundRadius:(CGFloat)radius;

-(CGPoint)numberQuadrant:(CGPoint)centerHeart
                AndPoint:(CGPoint)point;

@end
