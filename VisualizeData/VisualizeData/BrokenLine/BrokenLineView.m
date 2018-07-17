//
//  BrokenLineView.m
//  VisualizeData
//
//  Created by hepeng on 16/3/27.
//  Copyright © 2016年 aishuo. All rights reserved.
//

#import "BrokenLineView.h"
#import "rectargularView.h"
#import "VisualizeDataView.h"

@interface BrokenLineView ()
{
    NSString *_topTitle;
    CGFloat _dataMax;
    NSArray *_dataArray;
    rectargularView *_rectar;
    VisualizeDataView *_visualize;
    NSArray *_arrayX;
    NSArray *_arrayY;
    CGFloat _maxWidth;
    CGFloat _maxHeight;
    CGFloat _rectargularViewWith;
}
@end

@implementation BrokenLineView

-(instancetype)initWithFrame:(CGRect)frame
                        AndY:(NSArray *)arrayY
                        AndX:(NSArray *)arrayX
                 AndTopTitle:(NSString *)textTitle
                 AndYDataMax:(CGFloat)maxData
             AndMaxDataArray:(NSArray *)maxArray
{
    if (self=[super initWithFrame:frame])
    {
        self.backgroundColor=[UIColor clearColor];
        
        _topTitle=textTitle;
        _dataMax=maxData;
        _dataArray=maxArray;
        _rectar=[[rectargularView alloc] init];
        _visualize=[[VisualizeDataView alloc] init];
        _maxWidth=frame.size.width-20;
        _maxHeight=frame.size.height-35-30;
        _arrayX=arrayX;
        _arrayY=arrayY;
        
    }
    return self;
}



// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    UILabel *labelTop=[[UILabel alloc] init];
    labelTop.text=_topTitle;
    labelTop.font=[UIFont systemFontOfSize:15];
    labelTop.textAlignment=NSTextAlignmentCenter;
    CGRect rect_labelTop=[_visualize bounsWithSize:_topTitle AndSize:15];
    labelTop.frame=CGRectMake(self.bounds.size.width/2-(rect_labelTop.size.width/2), 0, rect_labelTop.size.width, rect_labelTop.size.height);
    [self addSubview:labelTop];
    
    
    
    
    CGFloat widthLabel=[_rectar widthWithArray:_arrayY AndObjecView:_visualize];
    CGFloat heightLabel=[_rectar heightWithArray:_arrayX AndObjecView:_visualize];
    widthLabel=10+5;
    heightLabel=10+5;
    
    CGContextRef conteLine2=UIGraphicsGetCurrentContext();
    CGContextMoveToPoint(conteLine2, widthLabel, _maxHeight+35);
    CGContextAddLineToPoint(conteLine2, widthLabel, 35);
    CGContextAddLineToPoint(conteLine2, _maxWidth+widthLabel,35);
    CGContextAddLineToPoint(conteLine2, _maxWidth+widthLabel, _maxHeight+35);
    CGContextAddLineToPoint(conteLine2, widthLabel, _maxHeight+35);
    CGContextSaveGState(conteLine2);
    CGContextSetLineWidth(conteLine2, 2);
    CGContextClosePath(conteLine2);
    [[UIColor blackColor] set];
    CGContextStrokePath(conteLine2);
    
    
    for (int i=0; i<_arrayX.count; i++)
    {
        [_rectar layoutLabelArray:_arrayX[i]
                         AndObjec:self
                     AndObjecView:_visualize 
         AndXAndYIntervalWidth:CGPointMake(0, ((_arrayX.count-1)-i)*(_maxHeight/(_arrayX.count-1))+(35-heightLabel/2))];
        if (i!=0 && i!=_arrayX.count-1 )
        {
            CGContextRef conteLine=UIGraphicsGetCurrentContext();
            CGContextMoveToPoint(conteLine, widthLabel, ((_arrayX.count-1)-i)*(_maxHeight/(_arrayX.count-1))+(35));
            CGContextAddLineToPoint(conteLine, widthLabel+_maxWidth, ((_arrayX.count-1)-i)*(_maxHeight/(_arrayX.count-1))+(35));
            CGContextSaveGState(conteLine);
            CGContextSetLineWidth(conteLine, 1);
            CGContextClosePath(conteLine);
            [[UIColor blackColor] set];
            CGContextStrokePath(conteLine);
        }
    }

    //Y矩形间隔+矩形一半 width/array.count
    _rectargularViewWith=_maxWidth/_arrayY.count+2;//除去第一个和最后一个
    
    //创建Y上的Label
    for (int i=0; i<_arrayY.count; i++)
    {
        [_rectar layoutLabelArray:_arrayY[i]
                        AndObjec:self
                     AndObjecView:_visualize
         AndXAndYIntervalWidth:CGPointMake(widthLabel+(i*_rectargularViewWith), 35+_maxHeight+2)];
        
        
    }
    
    NSArray *array1=_dataArray[1];
    NSArray *array2=_dataArray[1][0];
    
    CGFloat maxheight=_maxHeight/_dataMax;
    
    CGContextRef conteLine3=UIGraphicsGetCurrentContext();

    
    for (int j=0; j<array1.count; j++)
    {
        CGFloat height=[_dataArray[1][j][0] floatValue];
        
        height=maxheight*height;
        
        CGContextMoveToPoint(conteLine3, widthLabel, _maxHeight-height+35);

        for (int i=1; i<array2.count; i++)
        {
            
            
            height=[_dataArray[1][j][i] floatValue];
            
            height=maxheight*height;
            
            CGContextAddLineToPoint(conteLine3,widthLabel+ _rectargularViewWith*i, _maxHeight-height+35);
            
        }
        UIColor *color=_dataArray[0][j];
        [color set];
        
        CGContextSaveGState(conteLine3);
        CGContextSetLineWidth(conteLine3, 2);
        
        CGContextStrokePath(conteLine3);
    }
    
    
    
}


@end
