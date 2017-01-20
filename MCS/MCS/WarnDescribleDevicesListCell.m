//
//  WarnDescribleDevicesListCell.m
//  MCS
//
//  Created by gener on 17/1/20.
//  Copyright © 2017年 Light. All rights reserved.
//

#import "WarnDescribleDevicesListCell.h"

@implementation WarnDescribleDevicesListCell
{
    UILabel * _textLable;
    BOOL _iskey;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    _textLable = [[UILabel alloc]init];
    _textLable.numberOfLines = 2;
    [_textLable sizeToFit];
    [self addSubview:_textLable];
    
    return self;
}

-(void)layoutSubviews
{
    _textLable.frame = CGRectMake(0, 0, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame));
}

-(void)setCellWithData:(NSDictionary*)dic
{
    NSString * str= nil;
    NSMutableParagraphStyle * style = [[NSMutableParagraphStyle alloc]init];
    style.firstLineHeadIndent = 10;
    
    if (dic[@"taskCodeKey"]) {
        str = [NSString stringWithFormat:@"%@: %@",dic[@"taskCode"],dic[@"taskName"]];
        _textLable.textColor = [UIColor blueColor];
        _textLable.font = [UIFont systemFontOfSize:15];
    }

    NSMutableAttributedString * attributeStr = [[NSMutableAttributedString alloc]initWithString:str attributes:[NSDictionary dictionaryWithObjectsAndKeys:style,NSParagraphStyleAttributeName, nil]];
    
    _textLable.attributedText = attributeStr;
}




- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
