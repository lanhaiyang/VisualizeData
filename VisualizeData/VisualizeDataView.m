//
//  VisualizeDataView.m
//  VisualizeData
//
//  Created by ibokan on 16/3/25.
//  Copyright © 2016年 aishuo. All rights reserved.
//

#import "VisualizeDataView.h"

@interface VisualizeDataView ()
{
    NSArray *_dataArray;
    NSArray *_arrayQuadrant;
    NSArray *_labelNameArray;
    double _sizeLength;
}
@end

@implementation VisualizeDataView


-(instancetype)initWithFrame:(CGRect)frame
            AndArrayQuadrant:(NSArray *)arrayQuadrant
                AndLabelName:(NSArray *)arrayNameLabel
                    AndArray:(NSArray *)array
                     AndSize:(double)sizeLength
{
    if (self=[super initWithFrame:frame])
    {
        self.backgroundColor=[UIColor clearColor];
        _dataArray=array;
        _arrayQuadrant=arrayQuadrant;
        _labelNameArray=arrayNameLabel;
        _sizeLength=sizeLength;
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    CGPoint point;
    NSLog(@"data=%lu",_dataArray.count);
    for (int i=0; i<_dataArray.count; i++)
    {
        point =[_dataArray[i] CGPointValue];
        //划线
        CGContextRef conteLine2=UIGraphicsGetCurrentContext();
        CGContextMoveToPoint(conteLine2,self.bounds.size.width/2 , self.bounds.size.height/2);
        CGContextAddLineToPoint(conteLine2, point.x, point.y);
        CGContextSaveGState(conteLine2);
        CGContextSetLineWidth(conteLine2, 2);
        CGContextClosePath(conteLine2);
        [[UIColor blackColor] set];
        CGContextStrokePath(conteLine2);
    
    }
    
    //线
    for (int i=0; i<(int)_sizeLength/10; i++)
    {
        //划线
        
        NSArray *array=[self.deleght pointArrayLenght:((i+1)*10)];
        
        for (int j=0; j<array.count; j++)
        {
            
            CGContextRef conteLine=UIGraphicsGetCurrentContext();
            if (j<4)
            {
                CGContextMoveToPoint(conteLine,[array[j] CGPointValue].x , [array[j] CGPointValue].y);
                CGContextAddLineToPoint(conteLine, [array[j+1] CGPointValue].x, [array[j+1] CGPointValue].y);
            }
            else
            {
                CGContextMoveToPoint(conteLine,[array[j] CGPointValue].x , [array[j] CGPointValue].y);
                CGContextAddLineToPoint(conteLine, [array[0] CGPointValue].x, [array[0] CGPointValue].y);
            }
            CGContextSaveGState(conteLine);
            CGContextSetLineWidth(conteLine, 1);
            CGContextClosePath(conteLine);
            [[UIColor blackColor] set];
            CGContextStrokePath(conteLine);
        }
    
    }
    
    [self quadrantWithAndArray];
//    [UIColor colorWithWhite:0.847 alpha:1.000]
}


#pragma mark---第几象限---
-(void)quadrantWithAndArray
{
    for (int i=0; i<_arrayQuadrant.count; i++)
    {
        CGPoint point =[_arrayQuadrant[i] CGPointValue];
        CGPoint dataViewPoint =[_dataArray[i] CGPointValue];
        UILabel *label=[[UILabel alloc] init];
        label.textColor=[UIColor blackColor];
        label.font=[UIFont systemFontOfSize:13];
        label.text=_labelNameArray[i];
        CGRect rect=[self bounsWithSize:_labelNameArray[i] AndSize:13];
        
        CGFloat textWitdt=rect.size.width;
        CGFloat textHeight=rect.size.height;
        /*
         把中情况
         */
        if (point.x>0 && point.y==0)//(+,0)在X+
        {
            label.frame=CGRectMake(dataViewPoint.x, dataViewPoint.y-(textHeight/2), textWitdt, textHeight);
        }
        else if(point.x>0 && point.y>0)//(+,+)第一上
        {
            label.frame=CGRectMake(dataViewPoint.x-(textWitdt/2), dataViewPoint.y-textHeight, textWitdt, textHeight);
        }
        else if(point.x==0 && point.y>0)//(0,+)//在Y+
        {
            label.frame=CGRectMake(dataViewPoint.x-(textWitdt/2), dataViewPoint.y-textHeight, textWitdt, textHeight);
        }
        else if(point.x<0 && point.y>0)//在二上
        {
            label.frame=CGRectMake(dataViewPoint.x-textWitdt, dataViewPoint.y-textHeight, textWitdt, textHeight);
        }
        else if(point.x<0 && point.y==0)//(-,0)//在X-
        {
            label.frame=CGRectMake(dataViewPoint.x-textWitdt, dataViewPoint.y-(textHeight/2), textWitdt, textHeight);
        }
        else if(point.x<0 && point.y<0)//(-,-)在三上
        {
            label.frame=CGRectMake(dataViewPoint.x-textWitdt, dataViewPoint.y, textWitdt, textHeight);
        }
        else if(point.x==0 && point.y<0)//(0,-)//在Y-
        {
            label.frame=CGRectMake(dataViewPoint.x-(textWitdt/2), dataViewPoint.y, textWitdt, textHeight);
        }
        else if(point.x>0 && point.y<0)//(+,-)//在四上
        {
            label.frame=CGRectMake(dataViewPoint.x, dataViewPoint.y, textWitdt, textHeight);
        }
        [self addSubview:label];
    }
}

-(CGRect)bounsWithSize:(NSString *)stringText
               AndSize:(CGFloat )size
{
    CGRect rect=[stringText boundingRectWithSize:CGSizeMake(self.bounds.size.width/3, CGFLOAT_MAX)
                             options:NSStringDrawingUsesLineFragmentOrigin
                          attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:size]}
                             context:nil];
    return rect;
}

@end
