//
//  rectargularView.m
//  VisualizeData
//
//  Created by hepeng on 16/3/27.
//  Copyright © 2016年 aishuo. All rights reserved.
//

#import "rectargularView.h"
#import "VisualizeDataView.h"

@interface rectargularView ()
{
    CGFloat _maxWidth;
    CGFloat _maxHeight;
    NSArray *_arrayY;
    NSArray *_arrayX;
    VisualizeDataView *_visualize;
    CGFloat _rectargularViewWith;
    NSArray *_dataArray;
    CGFloat _maxY;
    NSString *_topLabel;
}
@end

@implementation rectargularView

-(instancetype)initWithFrame:(CGRect)frame
                 AndTopTitle:(NSString *)TopText
                        AndY:(NSArray *)arrayY
                        AndX:(NSArray *)arrayX
                 AndYDataMax:(CGFloat)dataMaxY
                AndDataArray:(NSArray *)arrayData
{
    if (self=[super initWithFrame:frame])
    {
        self.backgroundColor=[UIColor clearColor];
        _arrayX=arrayX;
        _arrayY=arrayY;
        _maxWidth=frame.size.width-20;
        _maxHeight=frame.size.height-35-30;
        _visualize=[[VisualizeDataView alloc] init];
        _dataArray=arrayData;
        _maxY=dataMaxY;
        _topLabel=TopText;
    }
    return self;
}



- (void)drawRect:(CGRect)rect
{
    
    UILabel *labelTop=[[UILabel alloc] init];
    labelTop.text=_topLabel;
    labelTop.font=[UIFont systemFontOfSize:15];
    labelTop.textAlignment=NSTextAlignmentCenter;
    CGRect rect_labelTop=[_visualize bounsWithSize:_topLabel AndSize:15];
    labelTop.frame=CGRectMake(self.bounds.size.width/2-(rect_labelTop.size.width/2), 0, rect_labelTop.size.width, rect_labelTop.size.height);
    [self addSubview:labelTop];

    
    
    
    CGFloat widthLabel=[self widthWithArray:_arrayY AndObjecView:_visualize];
    CGFloat heightLabel=[self heightWithArray:_arrayX AndObjecView:_visualize];
    widthLabel=widthLabel+5;
    heightLabel=heightLabel+5;
    
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
        [self layoutLabelArray:_arrayX[i]
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
    _rectargularViewWith=(_maxWidth-(_maxWidth/_arrayY.count))/_arrayY.count;
    CGFloat labelWidth=(_maxWidth/_arrayY.count);//间隔数
    labelWidth=labelWidth/(_arrayY.count+1);
    
    //创建Y上的Label
    for (int i=0; i<_arrayY.count; i++)
    {
        [self layoutLabelArray:_arrayY[i]
                      AndObjec:self
                  AndObjecView:_visualize
         AndXAndYIntervalWidth:CGPointMake(widthLabel+(labelWidth*(i+1)+(((i+1)*(_rectargularViewWith/2)))+(i*(_rectargularViewWith/2))), 35+_maxHeight+2)];
        
        
    }
    
//    NSDictionary *dic=@{@"widthLabel":widthLabel,
//                        @"heightLabel":heightLabel,
//                        @"labelWidth":labelWidth,
//                        @"rectargularViewWith":rectargularViewWith};
//    
//    NSDictionary *dic=[self rectargularViewWithTable:_topLabel
//                                                AndY:_arrayY
//                                                AndX:_arrayX
//                                        AndDataArray:_dataArray
//                                        AndMaxHeight:_maxHeight
//                                         AndMaxWidth:_maxWidth
//                              AndRectargularViewWith:_rectargularViewWith];
//    
//    
//    CGFloat widthLabel=[dic[@"widthLabel" ] floatValue];
//    CGFloat labelWidth=[dic[@"heightLabel" ] floatValue];
//    CGFloat rectargularViewWith=[dic[@"rectargularViewWith"] floatValue];
    
    //显示矩形
    CGFloat dataHeigt=_maxHeight/_maxY;
    for (int i=0; i<_dataArray.count; i++)
    {

        CGFloat height=dataHeigt*[_dataArray[i] doubleValue];
        
        CGContextRef conteLine3=UIGraphicsGetCurrentContext();
        CGContextMoveToPoint(conteLine3, widthLabel+2+(labelWidth*(i+1))+(i*_rectargularViewWith), _maxHeight+35);
        CGContextAddLineToPoint(conteLine3, widthLabel+2+(labelWidth*(i+1))+(i*_rectargularViewWith), (_maxHeight-height)+35);
        CGContextAddLineToPoint(conteLine3, widthLabel+2+(labelWidth*(i+1))+_rectargularViewWith+(i*_rectargularViewWith),(_maxHeight-height)+35);
        CGContextAddLineToPoint(conteLine3, widthLabel+2+(labelWidth*(i+1))+_rectargularViewWith+(i*_rectargularViewWith), _maxHeight+35);
        CGContextAddLineToPoint(conteLine3,  widthLabel+2+(labelWidth*(i+1))+(i*_rectargularViewWith), _maxHeight+35);
        CGContextSaveGState(conteLine3);
        CGContextSetLineWidth(conteLine3, 2);
        CGContextClosePath(conteLine3);
        [[UIColor blackColor] set];
        CGContextDrawPath(conteLine3, kCGPathFillStroke);
    }
    
}

//-(NSDictionary *)rectargularViewWithTable:(NSString *)topLabel
//                                     AndY:(NSArray *)arrayY
//                                     AndX:(NSArray *)arrayX
//                             AndDataArray:(NSArray *)arrayData
//                            AndMaxHeight:(CGFloat)maxHeight
//                              AndMaxWidth:(CGFloat)maxWidth
//                   AndRectargularViewWith:(CGFloat)rectargularViewWith
//{
//        UILabel *labelTop=[[UILabel alloc] init];
//        labelTop.text=_topLabel;
//        labelTop.font=[UIFont systemFontOfSize:15];
//        labelTop.textAlignment=NSTextAlignmentCenter;
//        CGRect rect_labelTop=[_visualize bounsWithSize:_topLabel AndSize:15];
//        labelTop.frame=CGRectMake(self.bounds.size.width/2-(rect_labelTop.size.width/2), 0, rect_labelTop.size.width, rect_labelTop.size.height);
//        [self addSubview:labelTop];
//    
//    
//    
//    
//        CGFloat widthLabel=[self widthWithArray:_arrayY];
//        CGFloat heightLabel=[self heightWithArray:_arrayX];
//        widthLabel=widthLabel+5;
//        heightLabel=heightLabel+5;
//    
//        CGContextRef conteLine2=UIGraphicsGetCurrentContext();
//        CGContextMoveToPoint(conteLine2, widthLabel, _maxHeight+35);
//        CGContextAddLineToPoint(conteLine2, widthLabel, 35);
//        CGContextAddLineToPoint(conteLine2, _maxWidth+widthLabel,35);
//        CGContextAddLineToPoint(conteLine2, _maxWidth+widthLabel, _maxHeight+35);
//        CGContextAddLineToPoint(conteLine2, widthLabel, _maxHeight+35);
//        CGContextSaveGState(conteLine2);
//        CGContextSetLineWidth(conteLine2, 2);
//        CGContextClosePath(conteLine2);
//        [[UIColor blackColor] set];
//        CGContextStrokePath(conteLine2);
//    
//    
//        for (int i=0; i<_arrayX.count; i++)
//        {
//            [self layoutLabelArray:_arrayX[i]
//             AndXAndYIntervalWidth:CGPointMake(0, ((_arrayX.count-1)-i)*(_maxHeight/(_arrayX.count-1))+(35-heightLabel/2))];
//            if (i!=0 && i!=_arrayX.count-1 )
//            {
//                CGContextRef conteLine=UIGraphicsGetCurrentContext();
//                CGContextMoveToPoint(conteLine, widthLabel, ((_arrayX.count-1)-i)*(_maxHeight/(_arrayX.count-1))+(35));
//                CGContextAddLineToPoint(conteLine, widthLabel+_maxWidth, ((_arrayX.count-1)-i)*(_maxHeight/(_arrayX.count-1))+(35));
//                CGContextSaveGState(conteLine);
//                CGContextSetLineWidth(conteLine, 1);
//                CGContextClosePath(conteLine);
//                [[UIColor blackColor] set];
//                CGContextStrokePath(conteLine);
//            }
//        }
//    
//        //Y矩形间隔+矩形一半 width/array.count
//        _rectargularViewWith=(_maxWidth-(_maxWidth/_arrayY.count))/_arrayY.count;
//        CGFloat labelWidth=(_maxWidth/_arrayY.count);//间隔数
//        labelWidth=labelWidth/(_arrayY.count+1);
//    
//        //创建Y上的Label
//        for (int i=0; i<_arrayY.count; i++)
//        {
//            [self layoutLabelArray:_arrayY[i]
//             AndXAndYIntervalWidth:CGPointMake(widthLabel+(labelWidth*(i+1)+(((i+1)*(_rectargularViewWith/2)))+(i*(_rectargularViewWith/2))), 35+_maxHeight+2)];
//            
//            
//        }
//    
//    
//    NSDictionary *dic=@{@"widthLabel":[NSNumber numberWithDouble:widthLabel],
//                        @"heightLabel":[NSNumber numberWithDouble:heightLabel],
//                        @"labelWidth":[NSNumber numberWithDouble:labelWidth],
//                        @"rectargularViewWith":[NSNumber numberWithDouble:rectargularViewWith]};
//    
//    return dic;
//
//
//}
//创建Label
-(void)layoutLabelArray:(NSString *)string
               AndObjec:(UIView *)viewObjc
           AndObjecView:(VisualizeDataView *)viewObjec
          AndXAndYIntervalWidth:(CGPoint)intervalPoint
{
    UILabel *label=[[UILabel alloc] init];
    label.text=string;
    label.font=[UIFont systemFontOfSize:13];
    label.frame=CGRectMake(intervalPoint.x, intervalPoint.y, [viewObjec bounsWithSize:string AndSize:13].size.width, [viewObjec bounsWithSize:string AndSize:13].size.height);
    [viewObjc addSubview:label];
}

//返回最最长的
-(CGFloat )widthWithArray:(NSArray *)array
             AndObjecView:(VisualizeDataView *)viewObjec
{
    CGFloat max=0;
    for (int i=0; i<array.count; i++)
    {
        CGRect rect=[viewObjec bounsWithSize:array[i] AndSize:13];
        if (rect.size.width>max)
        {
            max=rect.size.width;
        }
    }
    return max;
}

//获得label高度
-(CGFloat )heightWithArray:(NSArray *)array
              AndObjecView:(VisualizeDataView *)viewObjec
{
    CGRect rect=[_visualize bounsWithSize:array[0] AndSize:13];
    return rect.size.height;
}

@end
