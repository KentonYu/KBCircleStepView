//
//  KBCircleStepView.m
//  KBCircleStepView
//
//  Created by KentonYu on 16/1/30.
//  Copyright © 2016年 KentonYu. All rights reserved.
//

#import "KBCircleStepView.h"

#define KB_DEFALUT_ACTIVE_COLOR [UIColor greenColor]
#define KB_DEFALUT_UNACTIVE_COLOR [UIColor grayColor]

static const CGFloat kbDefalutConnectLineWidth        = 1.0f;
static const CGFloat kbDefalutCircleLineWidth         = 1.0f;
static const CGFloat kbDefalutActiveCircleRadius      = 30.0f;
static const CGFloat kbDefalutUnActiveCircleRadius    = 15.0f;
static const CGFloat kbDefalutActiveContentFontSize   = 30.0f;
static const CGFloat kbDefalutUnActiveContentFontSize = 15.0f;

@implementation KBCircleStepViewModel

@end

@implementation KBCircleStepView

+ (instancetype)kbCircleStepViewWithCircleStepViewModel:(KBCircleStepViewModel *)model Frame:(CGRect)frame{
    KBCircleStepView *view = [[self alloc] initWithFrame:frame];
    view.backgroundColor   = [UIColor whiteColor];
    view.viewModel         = model;
    return view;
}

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (!self) {
        return nil;
    }
    return self;
}

- (void)drawRect:(CGRect)rect{
    NSInteger circleCount = [_viewModel.circleContentArray count];
    CGFloat xOrigin       = rect.size.width/circleCount;
    
    //画线
    for (int i = 0; i < circleCount-1; i++) {
        UIBezierPath *linePath = [UIBezierPath bezierPath];
        linePath.lineWidth     =  _viewModel.connectLineWidth?:kbDefalutConnectLineWidth;
        [linePath moveToPoint:CGPointMake(xOrigin/2+i*xOrigin, rect.size.height/2)];
        [linePath addLineToPoint:CGPointMake(xOrigin/2+(i+1)*xOrigin, rect.size.height/2)];
        if (i >= _viewModel.activeCircleIndex) {
            [_viewModel.unActiveColor?:KB_DEFALUT_UNACTIVE_COLOR set];
        } else{
            [_viewModel.activeColor?:KB_DEFALUT_ACTIVE_COLOR set];
        }
        [linePath stroke];
    }
    
    //画圆圈
    for (int i = 0; i < circleCount; i++) {
        CGRect circleRect;
        UIColor *circleLineColor;
        CGFloat circleRadius;
        if (i == _viewModel.activeCircleIndex) {  //激活状态的圆圈
            circleRadius = _viewModel.activeCircleRadius?:kbDefalutActiveCircleRadius;
            circleRect = CGRectMake(xOrigin*i + xOrigin/2 - circleRadius, (rect.size.height - 2*circleRadius)/2.0f, circleRadius*2, circleRadius*2);
        } else{
            circleRadius = _viewModel.unActiveCircleRadius?:kbDefalutUnActiveCircleRadius;
            circleRect = CGRectMake(xOrigin*i + xOrigin/2 - circleRadius, (rect.size.height - 2*circleRadius)/2.0f, circleRadius*2, circleRadius*2);
        }
        if (i > _viewModel.activeCircleIndex) {
            circleLineColor = _viewModel.unActiveColor?:KB_DEFALUT_UNACTIVE_COLOR;
        } else{
            circleLineColor = _viewModel.activeColor?:KB_DEFALUT_ACTIVE_COLOR;
        }
        UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:circleRect];
        path.lineWidth = _viewModel.circleLineWidth?:kbDefalutCircleLineWidth;
        
        [self.backgroundColor set];
        [path fill];
        
        [circleLineColor set];
        [path stroke];
    }
    
    //圆圈里面的内容
    for (int i = 0; i < circleCount; i++) {
        UILabel *label   = [[UILabel alloc] init];
        [self addSubview:label];
        label.text       = _viewModel.circleContentArray[i];
        if (i == _viewModel.activeCircleIndex) {  //激活状态的圆圈
            label.font       = _viewModel.activeContentFont?:[UIFont systemFontOfSize:kbDefalutActiveContentFontSize];
        } else{
            label.font       = _viewModel.unActiveContentFont?:[UIFont systemFontOfSize:kbDefalutUnActiveContentFontSize];
        }
        if (i <= _viewModel.activeCircleIndex) {  //激活状态之前的圆圈
            label.textColor  = _viewModel.activeColor?:KB_DEFALUT_ACTIVE_COLOR;
        } else{
            label.textColor  = _viewModel.unActiveColor?:KB_DEFALUT_UNACTIVE_COLOR;
        }
        [label sizeToFit];
        CGSize labelSize = label.frame.size;
        label.frame      = CGRectMake((xOrigin-labelSize.width)/2.0f+xOrigin*i, (rect.size.height-labelSize.height)/2.0f, labelSize.width, labelSize.height);
    }
}

@end
