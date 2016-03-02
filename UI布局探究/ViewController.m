//
//  ViewController.m
//  UI布局探究
//
//  Created by fengmingxiao on 16/3/2.
//  Copyright © 2016年 fengmingxiao. All rights reserved.
//

#import "ViewController.h"
#import "NormalViewController.h"
#import "ConstraintViewController.h"
#import "NormalWIthAnimateViewController.h"
#import "ConstraintsWithAnimateViewController.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

{
    UITableView *_tableView;
    NSArray *_titleArray;
}

@end

@implementation ViewController

- (void)loadView
{
    [super loadView];
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    [self.view addSubview:_tableView];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _tableView.backgroundColor = [UIColor clearColor];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    _titleArray = @[NORMALUI, NORMALUIWITHANIMATIONT, CONSTRAINTSUI, CONSTRAINTSUIWITHANIMATION];
}

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    
    _tableView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
}

#pragma mark - UITableViewDelegate, UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _titleArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identitfier = @"demoCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identitfier];
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identitfier];
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    cell.textLabel.text = _titleArray[indexPath.row];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row)
    {
        case 0:
        {
            NormalViewController *normalVC = [[NormalViewController alloc] init];
            [self.navigationController pushViewController:normalVC animated:YES];
        }
            break;
            
        case 1:
        {
            NormalWIthAnimateViewController *noralAnimateVC = [[NormalWIthAnimateViewController alloc] init];
            [self.navigationController pushViewController:noralAnimateVC animated:YES];
        }
            break;
            
        case 2:
        {
            ConstraintViewController *constraintVC = [[ConstraintViewController alloc] init];
            [self.navigationController pushViewController:constraintVC animated:YES];
        }
            break;
            
        case 3:
        {
            ConstraintsWithAnimateViewController *constraintAnimateVC = [[ConstraintsWithAnimateViewController alloc] init];
            [self.navigationController pushViewController:constraintAnimateVC animated:YES];
        }
            break;
        default:
            break;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
