//
//  testView.m
//  UI布局探究
//
//  Created by fengmingxiao on 16/3/2.
//  Copyright © 2016年 fengmingxiao. All rights reserved.
//

#import "TestView.h"

@interface TestView ()

{
    UIView *_view;
}

@end

@implementation TestView

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
        _isMove = YES;
        
        self.backgroundColor = [UIColor whiteColor];
        
        _view = [[UIView alloc] initWithFrame:CGRectZero];
        _view.backgroundColor = [UIColor lightGrayColor];
        [self addSubview:_view];
    }
    
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    if (_isMove)
    {
             
             _view.frame = CGRectMake(CGRectGetMinX(self.bounds), CGRectGetMinY(self.bounds), 50, 50);

    }
    else
    {
       
            
            _view.frame = CGRectMake(CGRectGetMaxX(self.bounds) - 50, CGRectGetMaxY(self.bounds) - 50, 50, 50);
        
     
    }
}

@end
