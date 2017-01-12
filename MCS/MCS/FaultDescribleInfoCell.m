//
//  FaultDescribleInfoCell.m
//  MCS
//
//  Created by gener on 17/1/11.
//  Copyright © 2017年 Light. All rights reserved.
//

#import "FaultDescribleInfoCell.h"

@implementation FaultDescribleInfoCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.bgview.layer.cornerRadius = 5;
    self.bgview.layer.masksToBounds = YES;
    self.bgview.layer.borderWidth = 0.3;
    self.bgview.layer.borderColor = [UIColor darkGrayColor].CGColor;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}



-(void)setCellWith:(NSDictionary *)dic
{

}






@end
