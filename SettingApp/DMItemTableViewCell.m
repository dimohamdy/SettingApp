//
//  DMItemTableViewCell.m
//  Setting
//
//  Created by Hamdy on 5/22/14.
//  Copyright (c) 2014 Ahmed Hamdy. All rights reserved.
//

#import "DMItemTableViewCell.h"

@implementation DMItemTableViewCell
@synthesize itemControl,itemImage,itemLable;
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code


    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
