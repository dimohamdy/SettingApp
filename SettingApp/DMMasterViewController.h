//
//  DMMasterViewController.h
//  SettingApp
//
//  Created by AhmedHamdy on 5/23/14.
//  Copyright (c) 2014 AhmedHamdy. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DMDetailViewController;

@interface DMMasterViewController : UITableViewController

@property (strong, nonatomic) DMDetailViewController *detailViewController;

@end
