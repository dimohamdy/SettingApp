//
//  DMSettingItem.h
//  Setting
//
//  Created by Hamdy on 5/22/14.
//  Copyright (c) 2014 Ahmed Hamdy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DMSettingItem : NSObject
@property (nonatomic, strong) NSString *imageName;
@property (nonatomic, strong) NSString *lblText;
@property (nonatomic) BOOL isDetails ;
@property (nonatomic) Class className ;




-(id) initWithImageName:(NSString*)name AndWithlblText:(NSString*)txt AndWithDetailsOrSwitch:(int)control AndWithClassName:(Class)className ;
@end
