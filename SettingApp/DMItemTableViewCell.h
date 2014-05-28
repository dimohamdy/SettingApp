//
//  DMItemTableViewCell.h
//  Setting
//
//  Created by Hamdy on 5/22/14.
//  Copyright (c) 2014 Ahmed Hamdy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DMItemTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *itemImage;
@property (strong, nonatomic) IBOutlet UILabel *itemLable;
@property (strong, nonatomic) IBOutlet UIView *itemControl;
@property (strong, nonatomic) IBOutlet UILabel *itemDetailsLable;
@property (strong, nonatomic) IBOutlet UISwitch *itemSwitch;

@end
