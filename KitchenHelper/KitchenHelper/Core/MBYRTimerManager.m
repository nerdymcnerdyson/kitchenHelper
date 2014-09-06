//
//  MBYRTimerManager.m
//  KitchenHelper
//
//  Created by Michael Byrd on 9/6/14.
//  Copyright (c) 2014 MBYR Inc. All rights reserved.
//

#import "MBYRTimerManager.h"

#import "MBYRTimerClass.h"

/**
 *  manages timers, will launch alerts related to timer events.
 *  add timer, timer expired, 
 */

@interface MBYRTimerManager ()
@property (nonatomic, strong) NSArray* timers;
@end


@implementation MBYRTimerManager

+(instancetype)sharedInstance
{
    static MBYRTimerManager *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
    });
    return sharedMyManager;
}

-(void) updateTimers: (NSTimer*) timer
{
    
}

-(NSArray *)timers
{
    if (_timers == nil)
    {
        NSDate* now = [NSDate date];
        
        MBYRTimerClass* timer1 = [[MBYRTimerClass alloc] init];
        timer1.name = @"granola";
        timer1.expiresEpoch = @([now timeIntervalSince1970] + 120);
        timer1.earlyWarning = NO;
        
        MBYRTimerClass* timer2 = [[MBYRTimerClass alloc] init];
        timer2.name = @"eggs";
        timer2.expiresEpoch = @([now timeIntervalSince1970] + 180);
        timer2.earlyWarning = NO;
        
        MBYRTimerClass* timer3 = [[MBYRTimerClass alloc] init];
        timer3.name = @"biscuits";
        timer3.expiresEpoch = @([now timeIntervalSince1970] + 30);
        timer3.earlyWarning = NO;
        
        MBYRTimerClass* timer4 = [[MBYRTimerClass alloc] init];
        timer4.name = @"butter";
        timer4.expiresEpoch = @([now timeIntervalSince1970] + 5);
        timer4.earlyWarning = NO;
        
        _timers = @[timer1, timer2, timer3, timer4];
    }
    
    return _timers;
}

@end
