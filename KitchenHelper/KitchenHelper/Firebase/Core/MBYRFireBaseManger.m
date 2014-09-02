//
//  MBYRFireBaseManger.m
//  KitchenHelper
//
//  Created by Michael Byrd on 9/1/14.
//  Copyright (c) 2014 MBYR Inc. All rights reserved.
//

#import "MBYRFireBaseManger.h"

#import <Firebase/Firebase.h>

@interface MBYRFireBaseManger ()

@property (nonatomic, strong) Firebase* firebaseRef;


@end


@implementation MBYRFireBaseManger

+(instancetype) sharedInstance
{
    static MBYRFireBaseManger *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
    });
    return sharedMyManager;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.firebaseRef = [[Firebase alloc] initWithUrl:@"https://glaring-fire-8787.firebaseio.com/"];
        __weak MBYRFireBaseManger* weakself = self;
        [self.firebaseRef observeEventType:FEventTypeValue withBlock:^(FDataSnapshot *snapshot) {
            MBYRFireBaseManger* strongSelf = weakself;
            [strongSelf processFirebaseSnapshot:snapshot];
        }];
    }
    return self;
}

-(void) processFirebaseSnapshot: (FDataSnapshot*) snapshot
{
    NSLog(@"%@ -> %@", snapshot.name, snapshot.value);
}


@end
