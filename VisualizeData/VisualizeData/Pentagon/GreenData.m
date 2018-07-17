//
//  GreenData.m
//  VisualizeData
//
//  Created by hepeng on 16/3/26.
//  Copyright © 2016年 aishuo. All rights reserved.
//

#import "GreenData.h"


@interface GreenData ()
{
    NSArray *_arrayData;
    UIColor *_color;
}
@end

@implementation GreenData


-(instancetype)initWithFrame:(CGRect)frame
                    AndArray:(NSArray *)array
                    AndColor:(UIColor *)color
{
    if (self=[super initWithFrame:frame])
    {
        _arrayData=array;
        _color=color;
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    
    
    //1.获得图形上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    //绘制三角形
    CGContextMoveToPoint(context, [_arrayData[0] CGPointValue].x, [_arrayData[0] CGPointValue].y);
    for (int i=1; i<_arrayData.count; i++)
    {
        CGContextAddLineToPoint(context, [_arrayData[i] CGPointValue].x, [_arrayData[i] CGPointValue].y);
    }

    //关闭路径，闭环，（连接起点和最后一个点）
    CGContextSetLineWidth(context, 2);
    CGContextClosePath(context);
    [_color set];
    CGContextDrawPath(context, kCGPathFill);
    //显示在view上
    
    
    CGContextStrokePath(context);
    
    
}
@end