//
//  DataArea.m
//  VisualizeData
//
//  Created by hepeng on 16/3/26.
//  Copyright © 2016年 aishuo. All rights reserved.
//

#import "DataArea.h"
#import "TrigonometricFunctionsPoint.h"

@interface DataArea ()
{
    TrigonometricFunctionsPoint *_funtions;
}
@end

@implementation DataArea

-(instancetype)init
{
    if (self=[super init])
    {
        _funtions=[[TrigonometricFunctionsPoint alloc] init];
    }
    return self;
}

-(NSMutableArray *)dataAreaWithArray:(NSArray *)dataArray
                 AndCenterHeartPoint:(CGPoint)centerHeart
                    AndLenghtSegment:(CGFloat)lenghtSegment
                        AndMaxLenght:(CGFloat)maxLenght
{
    NSMutableArray *mArray=[NSMutableArray array];
    CGFloat max_num=(2*M_PI)/(dataArray.count);
    CGFloat lenght;
    lenght=lenghtSegment/maxLenght;
    for (int i=0; i<dataArray.count; i++)
    {
       CGPoint point= [_funtions trigonometricFunctionPointWithPointAndRadian:i*max_num+(M_PI/2-max_num)
                                                              AndRoundRadius:[dataArray[i] doubleValue]*lenght];
        
        point=[_funtions numberQuadrant:centerHeart AndPoint:point];
        
        [mArray addObject:[NSValue valueWithCGPoint:point]];
    }
    return mArray;

}


@end
