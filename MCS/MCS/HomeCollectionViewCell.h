//
//  HomeCollectionViewCell.h
//  MCS
//
//  Created by gener on 16/11/2.
//  Copyright © 2016年 Light. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeCollectionViewCell : UICollectionViewCell

@property(nonatomic,copy)NSString * menuTitle;

@property(nonatomic,copy)NSString * icon;

//
-(void)setIcon:(NSString *)icon limit:(BOOL)_b title:(NSString*)str;

@end
