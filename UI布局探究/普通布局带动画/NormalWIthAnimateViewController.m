//
//  NormalWIthAnimateViewController.m
//  UI布局探究
//
//  Created by fengmingxiao on 16/3/2.
//  Copyright © 2016年 fengmingxiao. All rights reserved.
//

#import "NormalWIthAnimateViewController.h"
#import "TestView.h"

@interface NormalWIthAnimateViewController ()

{
    TestView *_testView;
    UIButton *_button;
}

@end

@implementation NormalWIthAnimateViewController

-(void)loadView
{
    [super loadView];
    
    _button = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:_button];
    
    _testView = [[TestView alloc] initWithFrame:CGRectZero];
    [self.view addSubview:_testView];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = NORMALUIWITHANIMATIONT;
    self.view.backgroundColor = [UIColor blackColor];
    
    _button.backgroundColor = [UIColor whiteColor];
    [_button setTitle:@"测试" forState:UIControlStateNormal];
    [_button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    
    _testView.center = self.view.center;
    _testView.bounds = CGRectMake(0, 0, 200, 200);
    
    _button.frame = CGRectMake(CGRectGetMidX(self.view.bounds) - 50, CGRectGetHeight(self.view.bounds) - 100, 100, 30);
}

- (void)buttonAction:(UIButton *)sender
{
    _testView.isMove =! _testView.isMove;
    [_testView setNeedsLayout];
    
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
