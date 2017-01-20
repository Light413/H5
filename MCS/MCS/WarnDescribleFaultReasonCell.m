//
//  WarnDescribleFaultReasonCell.m
//  MCS
//
//  Created by gener on 17/1/19.
//  Copyright © 2017年 Light. All rights reserved.
//

#import "WarnDescribleFaultReasonCell.h"

@implementation WarnDescribleFaultReasonCell
{
    YYLabel * _textLable;
    BOOL _iskey;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
//    _textLable = [[UILabel alloc]init];
//    _textLable.numberOfLines = 2;
//    [_textLable sizeToFit];
//    [self addSubview:_textLable];
    
    _textLable = [YYLabel new];
    _textLable.numberOfLines = 0;
    [self addSubview:_textLable];
    
    return self;
}

-(void)layoutSubviews
{
    _textLable.frame = CGRectMake(0, 0, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame));
    
}

-(void)setCellWithData:(NSDictionary*)dic isManula:(BOOL)ismannual
{
    NSString * str= nil;
    NSMutableParagraphStyle * style = [[NSMutableParagraphStyle alloc]init];
    style.firstLineHeadIndent = 10;
    
    YYTextHighlight * hightLight = [[YYTextHighlight alloc]init];
    
    _textLable.backgroundColor = [UIColor whiteColor];
    if (ismannual) {
        _textLable.textColor = [UIColor blueColor];
        _textLable.font = [UIFont systemFontOfSize:13];
        str = dic[@"docName"];
        
        YYTextBorder * border = [YYTextBorder new];
        border.fillColor = [UIColor lightGrayColor];
        [hightLight setBackgroundBorder:border];
        hightLight.tapAction = ^(UIView *containerView, NSAttributedString *text, NSRange range, CGRect rect){
            NSLog(@"tap....");
            if (self.tapActionBlock && dic[@"docUrl"]) {
                self.tapActionBlock(dic[@"docUrl"]);
            }
        };
    }
    else
    {
        if (dic[@"taskCodeKey"]) {
            str = [NSString stringWithFormat:@"%@: %@",dic[@"taskCode"],dic[@"taskName"]];
            _textLable.textColor = [UIColor blackColor];
            _textLable.font = [UIFont boldSystemFontOfSize:15];
            _textLable.backgroundColor = kTableViewCellBgColorDeep;
        }
        else
        {
            str = dic[@"docName"];
            _textLable.textColor = [UIColor blackColor];
            _textLable.font = [UIFont systemFontOfSize:15];
            style.firstLineHeadIndent = 30;
        }
    }
    
    NSMutableAttributedString *attributeStrings = [[NSMutableAttributedString alloc] initWithString:str];
    attributeStrings.yy_firstLineHeadIndent = style.firstLineHeadIndent;
    attributeStrings.yy_font = _textLable.font;
    attributeStrings.yy_color = _textLable.textColor;
    
    [attributeStrings yy_setTextHighlight:hightLight range:attributeStrings.yy_rangeOfAll];
    _textLable.attributedText = attributeStrings;
}



/*
-(void)setCellWithData:(NSDictionary*)dic isManula:(BOOL)ismannual
{
    NSString * str= nil;
    NSMutableParagraphStyle * style = [[NSMutableParagraphStyle alloc]init];
    style.firstLineHeadIndent = 10;
    
    _textLable.backgroundColor = [UIColor whiteColor];
    if (ismannual) {
        _textLable.textColor = [UIColor blueColor];
        _textLable.font = [UIFont systemFontOfSize:13];
        str = dic[@"docName"];
    }
    else
    {
        if (dic[@"taskCodeKey"]) {
            str = [NSString stringWithFormat:@"%@: %@",dic[@"taskCode"],dic[@"taskName"]];
            _textLable.textColor = [UIColor blackColor];
            _textLable.font = [UIFont boldSystemFontOfSize:15];
            _textLable.backgroundColor = kTableViewCellBgColorDeep;
        }
        else
        {
            str = dic[@"docName"];
            _textLable.textColor = [UIColor blackColor];
            _textLable.font = [UIFont systemFontOfSize:15];
            style.firstLineHeadIndent = 30;
        }
    }

    NSMutableAttributedString * attributeStr = [[NSMutableAttributedString alloc]initWithString:str attributes:[NSDictionary dictionaryWithObjectsAndKeys:style,NSParagraphStyleAttributeName, nil]];
    _textLable.attributedText = attributeStr;
}
*/


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
