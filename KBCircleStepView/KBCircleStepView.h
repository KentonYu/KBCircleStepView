//
//  KBCircleStepView.h
//  KBCircleStepView
//
//  Created by KentonYu on 16/1/30.
//  Copyright © 2016年 KentonYu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KBCircleStepViewModel : NSObject
NS_ASSUME_NONNULL_BEGIN

/**
 *  圈里面的文字内容
 */
@property (nonatomic, strong) NSArray *circleContentArray;

/**
 *  激活圆圈坐标（0，1，2……）
 *  Defalut: 0
 */
@property (nonatomic, assign) NSInteger activeCircleIndex;

/**
 *  激活状态颜色 
 *  Defalut: Green
 */
@property (nonatomic, strong, nullable) UIColor *activeColor;

/**
 *  非激活状态颜色
 *  Defalut: Gray
 */
@property (nonatomic, strong, nullable) UIColor *unActiveColor;

/**
 *  激活状态的内容字体大小
 *  Defalut: 30.0f
 */
@property (nonatomic, strong, nullable) UIFont *activeContentFont;

/**
 *  非激活状态的内容字体大小
 *  Defalut: 15.0f
 */
@property (nonatomic, strong, nullable) UIFont *unActiveContentFont;

/**
 *  激活状态圆圈的半径
 *  Defalut: 30.0f
 */
@property (nonatomic, assign) CGFloat activeCircleRadius;

/**
 *  非激活状态圆圈的半径
 *  Defalut: 15.0f
 */
@property (nonatomic, assign) CGFloat unActiveCircleRadius;

/**
 *  圈的粗细
 *  Defalut: 1.0f
 */
@property (nonatomic, assign) CGFloat circleLineWidth;

/**
 *  连接线的宽度
 *  Defalut: 1.0f
 */
@property (nonatomic, assign) CGFloat connectLineWidth;

NS_ASSUME_NONNULL_END
@end


@interface KBCircleStepView : UIView
NS_ASSUME_NONNULL_BEGIN

/**
 *  视图配置信息
 */
@property (nonatomic, strong) KBCircleStepViewModel *viewModel;

/**
 *  创建方法
 *
 *  @param model 视图的配置模型
 *  @param frame 视图位置信息
 *
 *  @return KBCircleStepView
 */
+ (instancetype)kbCircleStepViewWithCircleStepViewModel:(KBCircleStepViewModel *)model Frame:(CGRect)frame;

NS_ASSUME_NONNULL_END
@end
