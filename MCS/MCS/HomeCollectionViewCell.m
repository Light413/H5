//
//  HomeCollectionViewCell.m
//  MCS
//
//  Created by gener on 16/11/2.
//  Copyright © 2016年 Light. All rights reserved.
//

#import "HomeCollectionViewCell.h"

@implementation HomeCollectionViewCell
{
    __weak IBOutlet UILabel *title;
    
    __weak IBOutlet UIImageView *imgview;
    
}

-(void)setMenuTitle:(NSString *)menuTitle
{
    title.text = menuTitle;
}

-(void)setIcon:(NSString *)icon
{
    imgview.image = [UIImage imageNamed:icon];
}

-(void)setIcon:(NSString *)icon limit:(BOOL)_b title:(NSString*)str
{
    [self setIcon:icon];//362E6F
    title.text = str;
    title.textColor =_b?[UIColor colorWithRed:0.278 green:0.325 blue:0.498 alpha:1]:[UIColor lightGrayColor];
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    title.font = [UIFont systemFontOfSize:22];
}

@end
