//
//  CustomMultipleButtons.h
//  MCS
//
//  Created by gener on 17/1/13.
//  Copyright © 2017年 Light. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^MultipleButtonsSelectedBlock)(NSInteger);

@interface CustomMultipleButtons : UIView

@property(nonatomic,copy)MultipleButtonsSelectedBlock selectedBlock;

//索引从1开始
-(instancetype)initWithFrame:(CGRect)frame buttonTitles:(NSArray*)titles selectedHandler: (MultipleButtonsSelectedBlock)handler;

@end
