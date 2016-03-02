//
//  ConstraintViewController.m
//  UI布局探究
//
//  Created by fengmingxiao on 16/3/2.
//  Copyright © 2016年 fengmingxiao. All rights reserved.
//

#import "ConstraintViewController.h"
#import "ConstraintView.h"

@interface ConstraintViewController ()

{
    ConstraintView *_view;
}

@end

@implementation ConstraintViewController

- (void)loadView
{
    [super loadView];
    
    _view = [[ConstraintView alloc] initWithFrame:CGRectZero];
    [self.view addSubview:_view];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = CONSTRAINTSUI;
    self.view.backgroundColor = [UIColor blueColor];
    
    [self.view setNeedsUpdateConstraints];
}

- (void)updateViewConstraints
{
    WS(weakSelf);
    
    [_view mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.center.mas_equalTo(weakSelf.view);
        make.size.mas_equalTo(CGSizeMake(200, 200));
        
    }];
    
    [super updateViewConstraints];
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
