//
//  DMSettingItem.m
//  Setting
//
//  Created by Hamdy on 5/22/14.
//  Copyright (c) 2014 Ahmed Hamdy. All rights reserved.
//

#import "DMSettingItem.h"

@implementation DMSettingItem

-(id) initWithImageName:(NSString*)name AndWithlblText:(NSString*)txt AndWithDetailsOrSwitch:(int)control {
    self = [super init];
    if (self) {
        self.imageName=name;
        self.lblText=txt;
        self.isDetails=control ;

    }
    return self;
}

@end
