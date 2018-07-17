//
//  rectargularView.h
//  VisualizeData
//
//  Created by hepeng on 16/3/27.
//  Copyright © 2016年 aishuo. All rights reserved.
//

#import <UIKit/UIKit.h>
@class VisualizeDataView;

@interface rectargularView : UIView

-(instancetype)initWithFrame:(CGRect)frame
                 AndTopTitle:(NSString *)TopText
                        AndY:(NSArray *)arrayY
                        AndX:(NSArray *)arrayX
                 AndYDataMax:(CGFloat)dataMaxY
                AndDataArray:(NSArray *)arrayData;



//创建Label
-(void)layoutLabelArray:(NSString *)string
               AndObjec:(UIView *)viewObjc
           AndObjecView:(VisualizeDataView *)viewObjec
  AndXAndYIntervalWidth:(CGPoint)intervalPoint;

//返回最最长的
-(CGFloat )widthWithArray:(NSArray *)array
             AndObjecView:(VisualizeDataView *)viewObjec;

//获得label高度
-(CGFloat )heightWithArray:(NSArray *)array
              AndObjecView:(VisualizeDataView *)viewObjec;

//创建表格
-(NSDictionary *)rectargularViewWithTable:(NSString *)topLabel
                                     AndY:(NSArray *)arrayY
                                     AndX:(NSArray *)arrayX
                             AndDataArray:(NSArray *)arrayData
                             AndMaxHeight:(CGFloat)maxHeight
                              AndMaxWidth:(CGFloat)maxWidth
                   AndRectargularViewWith:(CGFloat)rectargularViewWith;

@end
