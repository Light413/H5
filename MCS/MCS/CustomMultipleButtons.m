//
//  CustomMultipleButtons.m
//  MCS
//
//  Created by gener on 17/1/13.
//  Copyright © 2017年 Light. All rights reserved.
//

#import "CustomMultipleButtons.h"

@implementation CustomMultipleButtons
{
    NSArray * _buttonTitles;
}

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initSubviews];
    }
    
    return self;
}

-(void)initSubviews
{
    UIView *bgview = [[UIView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame))];
    bgview.backgroundColor = [UIColor colorWithRed:0.961 green:0.973 blue:0.980 alpha:1];
    bgview.tag = 1001;
    [self addSubview:bgview];
    
    NSArray * btnTitle = @[@"告警条目",@"其他告警",@"超限告警"];
    for (int i =0; i < 3; i++) {
        UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(10 + i * 150, 10, 150, CGRectGetHeight(bgview.frame)-10);
        [btn setTitle:btnTitle[i] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateSelected];
        [btn setTitleColor:[UIColor colorWithRed:0.173 green:0.545 blue:0.757 alpha:1] forState:UIControlStateNormal];
        [btn setBackgroundImage:[UIImage imageNamed:@"btn_bg"] forState:UIControlStateSelected];
        btn.tag = 20 + i;
        [btn addTarget:self action:@selector(btnChangeListAction:) forControlEvents:UIControlEventTouchUpInside];
        btn.titleLabel.font = [UIFont systemFontOfSize:15];
        btn.selected = i == 0 ?YES : NO;
        [bgview addSubview:btn];
    }
    
}

-(instancetype)initWithFrame:(CGRect)frame buttonTitles:(NSArray*)titles selectedHandler: (MultipleButtonsSelectedBlock)handler
{
    NSAssert(titles.count < 1, @"button's number can't be nil");
    _buttonTitles = titles;
    
    return [self initWithFrame:frame];
}

-(void)btnChangeListAction:(UIButton*)btn
{
    if (btn.selected) {
        return;
    }
    
    NSArray * views = [self viewWithTag:1001].subviews;
    for (UIView * _b in views) {
        if ([_b isKindOfClass:[UIButton class]]) {
            ((UIButton*)_b).selected = NO;
            ((UIButton*)_b).backgroundColor = [UIColor clearColor];
        }
    }
    btn.selected = YES;
    btn.backgroundColor = [UIColor whiteColor];
    
    //...
    
    
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
