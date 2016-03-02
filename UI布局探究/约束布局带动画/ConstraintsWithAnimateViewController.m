//
//  ConstraintsWithAnimateViewController.m
//  UI布局探究
//
//  Created by fengmingxiao on 16/3/2.
//  Copyright © 2016年 fengmingxiao. All rights reserved.
//

#import "ConstraintsWithAnimateViewController.h"
#import "ConstraintAnimateView.h"

@interface ConstraintsWithAnimateViewController ()

{
    ConstraintAnimateView *_view;
    UIButton *_button;
}

@end

@implementation ConstraintsWithAnimateViewController

- (void)loadView
{
    [super loadView];
    
    _view = [[ConstraintAnimateView alloc] initWithFrame:CGRectZero];
    [self.view addSubview:_view];
    
    _button = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:_button];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = CONSTRAINTSUIWITHANIMATION;
    self.view.backgroundColor = [UIColor yellowColor];
    
    _button.backgroundColor = [UIColor whiteColor];
    [_button setTitle:@"测试" forState:UIControlStateNormal];
    [_button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view setNeedsUpdateConstraints];
}

- (void)updateViewConstraints
{
    WS(weakSelf);
    
    [_view mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.center.mas_equalTo(weakSelf.view);
        make.size.mas_equalTo(CGSizeMake(200, 200));
        
    }];
    
    [_button mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.mas_equalTo(weakSelf.view.mas_centerX);
        make.top.equalTo(_view.mas_bottom).offset(50);
        make.size.mas_equalTo(CGSizeMake(100, 30));
        
    }];
    
    [super updateViewConstraints];
}

- (void)buttonAction:(UIButton *)button
{
    _view.isMove = !_view.isMove;
    [_view setNeedsUpdateConstraints];
    
    [UIView animateWithDuration:0.4 animations:^{
        
        [self.view layoutIfNeeded];
        
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
