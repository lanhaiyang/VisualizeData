//
//  BrokenLineView.h
//  VisualizeData
//
//  Created by hepeng on 16/3/27.
//  Copyright © 2016年 aishuo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BrokenLineView : UIView

-(instancetype)initWithFrame:(CGRect)frame
                        AndY:(NSArray *)arrayY
                        AndX:(NSArray *)arrayX
                 AndTopTitle:(NSString *)textTitle
                 AndYDataMax:(CGFloat)maxData
             AndMaxDataArray:(NSArray *)maxArray;

@end
