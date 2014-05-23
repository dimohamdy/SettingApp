//
//  DMDetailViewController.h
//  SettingApp
//
//  Created by AhmedHamdy on 5/23/14.
//  Copyright (c) 2014 AhmedHamdy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DMDetailViewController : UIViewController <UISplitViewControllerDelegate>

@property (strong, nonatomic) id detailItem;

@property(nonatomic, retain)  IBOutlet UILabel *detailDescriptionLabel;
@end
