//
//  MBYRTimerClass.h
//  KitchenHelper
//
//  Created by Michael Byrd on 9/5/14.
//  Copyright (c) 2014 MBYR Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MBYRTimerClass : NSObject

@property (nonatomic, strong) NSString* identifier;

@property (nonatomic, strong) NSString* name;
@property (nonatomic, strong) NSString* description;
@property (nonatomic, strong) NSString* location;
@property (nonatomic, strong) NSString* whatToDo;
@property (nonatomic, strong) NSNumber* expiresEpoch;

@property (nonatomic, assign,getter = isEarlyWarning) BOOL  earlyWarning;
@property (nonatomic, assign,getter = isExpired) BOOL expired;
@property (nonatomic, assign,getter = isCleared) BOOL cleared;

@end
