//
//  ConstraintView.m
//  UI布局探究
//
//  Created by fengmingxiao on 16/3/2.
//  Copyright © 2016年 fengmingxiao. All rights reserved.
//

#import "ConstraintView.h"

@interface ConstraintView ()

{
    UIView *_testView;
}

@end

@implementation ConstraintView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.backgroundColor = [UIColor whiteColor];
        self.translatesAutoresizingMaskIntoConstraints = NO;
        
        
        _testView = [[UIView alloc] initWithFrame:CGRectZero];
        _testView.backgroundColor = [UIColor blackColor];
        [self addSubview:_testView];
        
        [self setNeedsUpdateConstraints];
    }
    return self;
}

- (void)updateConstraints
{
    CGPoint center = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds));
    
    [_testView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.center.mas_equalTo(center);
        make.edges.mas_equalTo(UIEdgeInsetsMake(10, 10, 10, 10));
        
    }];
    
    [super updateConstraints];
}

@end
