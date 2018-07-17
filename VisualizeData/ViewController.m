//
//  ViewController.m
//  VisualizeData
//
//  Created by ibokan on 16/3/25.
//  Copyright © 2016年 aishuo. All rights reserved.
//

#import "ViewController.h"
#import "DataView.h"
#import "TrigonometricFunctionsPoint.h"
#import "VisualizeDataView.h"
#import "GreenData.h"
#import "DataArea.h"
#import "rectargularView.h"
#import "BrokenLineView.h"

@interface ViewController ()<PointArray>
{
    TrigonometricFunctionsPoint *_x;
    CGPoint _point;
    VisualizeDataView *_x2;
    NSArray *_array_Label;
    NSArray *_arrayData;
    NSArray *_arrayData2;
    GreenData *_dataView;
    GreenData *_dataView2;
    rectargularView *_rect_View;
    BrokenLineView *_brokenLineView;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
#pragma mark---定义按钮--
    [self layout];//按钮布局
#pragma mark---五边形---
    _array_Label=@[@"1",@"2",@"3",@"4",@"5"];//标题
    
    _arrayData=[NSArray array];
    
    _arrayData=@[@15,@52,@70,@80,@62];
    
   _arrayData2=[NSArray array];
    
    _arrayData2=@[@67,@80,@50,@40,@22];
    
//    DataView *view=[[DataView alloc] initWithFrame:CGRectMake(40, 40, 200, 200)];
//    view.backgroundColor=[UIColor clearColor];
//    [self.view addSubview:view];
    
    _x=[[TrigonometricFunctionsPoint alloc] init];
    
    CGFloat centerHeartMax=230;
    CGFloat width=[UIScreen mainScreen].bounds.size.width;
    CGFloat height=[UIScreen mainScreen].bounds.size.height;
    
    CGPoint centerHeart=CGPointMake(width/2-centerHeartMax/2, height/2-centerHeartMax/2);
    _point=CGPointMake(centerHeartMax/2, centerHeartMax/2);
    
    //角度转坐标
//    [x trigonometricFunctionPointWithPointAndRadian:M_PI
//                                AndCenterHeartPoint:point
//                                     AndRoundRadius:3];
    
    //获得原始数据来确定象限
    NSArray *array_q=[_x pointWithRadian:5 AndRoundRadius:20];//第二个参数随便
    
    
    NSArray *array=[_x tringonometricFunctionPointWithPintAndRadian:5
                                                AndCenterHeartPoint:_point
                                                     AndRoundRadius:100];
    
    NSLog(@"=%@",array);
    
    _x2=[[VisualizeDataView alloc] initWithFrame:CGRectMake(centerHeart.x, centerHeart.y, centerHeartMax, centerHeartMax)
                                AndArrayQuadrant:array_q
                                    AndLabelName:_array_Label
                                        AndArray:array
                                         AndSize:100];
    _x2.deleght=self;
    
    DataArea *area=[[DataArea alloc] init];
    NSMutableArray *marray=[area dataAreaWithArray:_arrayData
                               AndCenterHeartPoint:_point
                                  AndLenghtSegment:centerHeartMax/2
                                      AndMaxLenght:100];
    
    
    NSMutableArray *marray2=[area dataAreaWithArray:_arrayData2
                                AndCenterHeartPoint:_point
                                   AndLenghtSegment:centerHeartMax/2
                                       AndMaxLenght:100];
    
    //NSLog(@"area=%@",marray);
    
    _dataView=[[GreenData alloc] initWithFrame:CGRectMake(0, 0, centerHeartMax, centerHeartMax) AndArray:marray AndColor:[UIColor greenColor]];
    _dataView.backgroundColor=[UIColor clearColor];
    
    _dataView2=[[GreenData alloc] initWithFrame:CGRectMake(0, 0, centerHeartMax, centerHeartMax) AndArray:marray2 AndColor:[UIColor purpleColor]];
    _dataView2.backgroundColor=[UIColor clearColor];
    _dataView.alpha=0.7;
    _dataView2.alpha=0.7;
    
    //[dataView addSubview:x2];
    [_dataView2 addSubview:_dataView];
    [_x2 addSubview:_dataView2];
    [self.view addSubview:_x2];
#pragma mark---矩形---
    
    //数据信息与存储数量一样  我并没做判断
    
    NSArray *arrayX=@[@"1",@"2",@"3",@"4"];
    NSArray *arrayY=@[@"1",@"2",@"3",@"4"];
    NSArray *arrayData=@[@50,@60,@20,@30];
    _rect_View=[[rectargularView alloc] initWithFrame:CGRectMake(0, height/2-85, width, 270)
                                          AndTopTitle:@"你好"
                                                 AndY:arrayY
                                                 AndX:arrayX
                                          AndYDataMax:100
                                         AndDataArray:arrayData];
    
#pragma mark--折线---
    //数据通过大数据嵌套小数据完成
    
    NSArray *arrayX_title=@[@"1",@"2",@"3",@"4",@"1",@"2",@"3",@"4",@"1",@"2",@"3",@"4"];
    NSArray *array_Y=@[@"0",@"34",@"67",@"100"];
    NSArray *arrayDataColor=@[[UIColor blueColor],
                              [UIColor redColor],
                              [UIColor greenColor]];
    NSArray *array_Data=@[@[@50,@60,@20,@30,@50,@60,@20,@30,@50,@60,@20,@30],
                         @[@30,@80,@10,@40,@60,@10,@30,@30,@20,@26,@35,@60],
                         @[@80,@20,@20,@10,@40,@42,@62,@32,@53,@10,@23,@10]];
    
    NSMutableArray *MarrayData=[NSMutableArray array];
    [MarrayData addObject:arrayDataColor];
    [MarrayData addObject:array_Data];
    
    _brokenLineView=[[BrokenLineView alloc] initWithFrame:CGRectMake(0, height/2-85, width, 270)
                                                     AndY:arrayX_title
                                                     AndX:array_Y
                                              AndTopTitle:@"你好"
                                              AndYDataMax:100
                                          AndMaxDataArray:MarrayData];
    
    
    
}

#pragma mark---按钮---
-(void)layout
{
    NSArray *array_buttonName=@[@"五边形",@"矩形",@"折线"];
    CGFloat width=[UIScreen mainScreen].bounds.size.width;
    CGFloat height=[UIScreen mainScreen].bounds.size.height;
    for (int i=0; i<array_buttonName.count; i++)
    {
        UIButton *button=[[UIButton alloc] init];
        [button setTitle:array_buttonName[i] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        button.frame=CGRectMake(width/3*i, height-40, width/3, 30);
        button.tag=i;
        [button addTarget:self action:@selector(Action:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button];
    }
}

-(void)Action:(UIButton *)sender
{
    
    switch (sender.tag)
    {
        case 0:
        {
            _x2.alpha=1;
            _dataView.alpha=0.7;
            _dataView2.alpha=0.7;
            _rect_View.alpha=0;
            
            _brokenLineView.alpha=0;
            
            NSLog(@"A");
        }
            break;
        case 1:
        {
            _x2.alpha=0;
            _dataView.alpha=0;
            _dataView2.alpha=0;
            
            _rect_View.alpha=1;
            _brokenLineView.alpha=0;
            
             [self.view addSubview:_rect_View];
            
            
            NSLog(@"B");
        }
            break;
        case 2:
        {
            _x2.alpha=0;
            _dataView.alpha=0;
            _dataView2.alpha=0;
            _rect_View.alpha=0;
            
            _brokenLineView.alpha=1;
            
            [self.view addSubview:_brokenLineView];
            
            NSLog(@"C");
        }
            break;
        default:
            break;
    }
}


-(NSArray *)pointArrayLenght:(CGFloat)lenght
{
    NSArray *array=[_x tringonometricFunctionPointWithPintAndRadian:5
                                               AndCenterHeartPoint:_point
                                                    AndRoundRadius:lenght];
    return array;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
