//
//  ViewController.m
//  KBCircleStepViewDemo
//
//  Created by KentonYu on 16/1/31.
//  Copyright © 2016年 KentonYu. All rights reserved.
//

#import "ViewController.h"
#import "KBCircleStepView.h"

@interface ViewController ()

@property (nonatomic, strong) KBCircleStepView *stepView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    KBCircleStepViewModel *model = ({
        KBCircleStepViewModel *model = [KBCircleStepViewModel new];
        model.circleContentArray     = @[@"1",@"2",@"3"];
        model.activeCircleIndex      = 0;
        model.activeColor            = [UIColor colorWithRed:41.0f/255.0f green:170.0f/255.0f blue:110.0f/255.0f alpha:1.0f];
        model.unActiveColor          = [UIColor colorWithRed:187.0f/255.0f green:187.0f/255.0f blue:187.0f/255.0f alpha:1];
        model.activeContentFont      = [UIFont systemFontOfSize:42];
        model.unActiveContentFont    = [UIFont systemFontOfSize:21.0f];
        model.activeCircleRadius     = 28.0f;
        model.unActiveCircleRadius   = 20.0f;
        model.circleLineWidth        = 5.0f;
        model.connectLineWidth       = 5.0f;
        model;
    });
    
    self.stepView = [KBCircleStepView kbCircleStepViewWithCircleStepViewModel:model Frame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, 200)];
    self.stepView.backgroundColor = [UIColor colorWithRed:239.0f/255.0f green:238.0f/255.0f blue:238.0f/255.0f alpha:1];
    [self.view addSubview:self.stepView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
