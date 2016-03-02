//
//  ConstraintAnimateView.m
//  UI布局探究
//
//  Created by fengmingxiao on 16/3/2.
//  Copyright © 2016年 fengmingxiao. All rights reserved.
//

#import "ConstraintAnimateView.h"

@interface ConstraintAnimateView ()

{
    UIView *_testView;
}

@end

@implementation ConstraintAnimateView

- (void)setIsMove:(BOOL)isMove
{
    if (_isMove == isMove)
    {
        return;
    }
    
    _isMove = isMove;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self)
    {
        self.backgroundColor = [UIColor redColor];
        self.translatesAutoresizingMaskIntoConstraints = NO;
        
        _isMove = YES;
        
        _testView = [[UIView alloc] initWithFrame:CGRectZero];
        _testView.backgroundColor = [UIColor greenColor];
        [self addSubview:_testView];
        
        [self setNeedsUpdateConstraints];
    }
    
    return self;
}

- (void)updateConstraints
{
    WS(weakSelf);
    
    [_testView mas_remakeConstraints:^(MASConstraintMaker *make) {
        
        make.size.mas_equalTo(CGSizeMake(50, 50));
        
        if (_isMove)
        {

            make.left.mas_equalTo(weakSelf.mas_left);
            make.top.mas_equalTo(weakSelf.mas_top);
            
        }
        else
        {
          
            make.right.mas_equalTo(weakSelf.mas_right);
            make.bottom.mas_equalTo(weakSelf.mas_bottom);
            
        }
        
    }];
    
    [super updateConstraints];
}

@end
