//
//  DataView.m
//  VisualizeData
//
//  Created by ibokan on 16/3/25.
//  Copyright © 2016年 aishuo. All rights reserved.
//

#import "DataView.h"

@implementation DataView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{

    
    //1.获得图形上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    //绘制三角形
    CGContextMoveToPoint(context, self.bounds.size.width/2, 0);
    CGContextAddLineToPoint(context, self.bounds.size.width/2+100, 100);
    CGContextAddLineToPoint(context, 0, 150);
    CGContextAddLineToPoint(context, self.bounds.size.width/2, 100);
    //关闭路径，闭环，（连接起点和最后一个点）
    CGContextSetLineWidth(context, 2);
    CGContextClosePath(context);
    [[UIColor redColor] set];
    
    //显示在view上
    CGContextStrokePath(context);
    
    //划线
    CGContextRef conteLine=UIGraphicsGetCurrentContext();
    CGContextMoveToPoint(conteLine,self.bounds.size.width/2 , 0);
    CGContextAddLineToPoint(conteLine, 0, 150);
    CGContextSaveGState(conteLine);
    CGContextSetLineWidth(conteLine, 2);
    CGContextClosePath(conteLine);
    [[UIColor redColor] set];
    
    CGContextStrokePath(conteLine);
    
    //划线
    CGContextRef conteLine2=UIGraphicsGetCurrentContext();
    CGContextMoveToPoint(conteLine2,self.bounds.size.width/2 , 100);
    CGContextAddLineToPoint(conteLine2, self.bounds.size.width/2+100, 100);
    CGContextSaveGState(conteLine2);
    CGContextSetLineWidth(conteLine2, 2);
    CGContextClosePath(conteLine2);
    [[UIColor redColor] set];
    
    CGContextStrokePath(conteLine2);
    
}


@end
