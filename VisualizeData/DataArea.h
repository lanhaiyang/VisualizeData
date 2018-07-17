//
//  DataArea.h
//  VisualizeData
//
//  Created by hepeng on 16/3/26.
//  Copyright © 2016年 aishuo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DataArea : NSObject

-(NSMutableArray *)dataAreaWithArray:(NSArray *)dataArray
                 AndCenterHeartPoint:(CGPoint)centerHeart
                    AndLenghtSegment:(CGFloat)lenghtSegment
                        AndMaxLenght:(CGFloat)maxLenght;

@end
