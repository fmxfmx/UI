//
//  NormalViewController.m
//  UI布局探究
//
//  Created by fengmingxiao on 16/3/2.
//  Copyright © 2016年 fengmingxiao. All rights reserved.
//

#import "NormalViewController.h"
#import "DemoView.h"

@interface NormalViewController ()

{
    DemoView *_demoView;
}

@end

@implementation NormalViewController

- (void)loadView
{
    [super loadView];
    
    _demoView = [[DemoView alloc] initWithFrame:CGRectZero];
    [self.view addSubview:_demoView];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = NORMALUI;
    self.view.backgroundColor = [UIColor redColor];
}

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    
    _demoView.center = self.view.center;
    _demoView.bounds = CGRectMake(0, 0, 200, 200);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
