//
//  VisualizeDataView.h
//  VisualizeData
//
//  Created by ibokan on 16/3/25.
//  Copyright © 2016年 aishuo. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol PointArray <NSObject>

-(NSArray *)pointArrayLenght:(CGFloat)lenght;

@end

@interface VisualizeDataView : UIView

-(instancetype)initWithFrame:(CGRect)frame
            AndArrayQuadrant:(NSArray *)arrayQuadrant
                AndLabelName:(NSArray *)arrayNameLabel
                    AndArray:(NSArray *)array
                     AndSize:(double)sizeLength;

@property(nonatomic,strong)id<PointArray> deleght;

//文字大小
-(CGRect)bounsWithSize:(NSString *)stringText
               AndSize:(CGFloat )size;

@end
