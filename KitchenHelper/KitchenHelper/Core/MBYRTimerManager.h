//
//  MBYRTimerManager.h
//  KitchenHelper
//
//  Created by Michael Byrd on 9/6/14.
//  Copyright (c) 2014 MBYR Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MBYRTimerManager : NSObject

//a collection of timers
@property (nonatomic, strong, readonly) NSArray* timers;

+(instancetype) sharedInstance;

@end
