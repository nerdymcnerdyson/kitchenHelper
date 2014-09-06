//
//  MBYRTimerTableDelegate.m
//  KitchenHelper
//
//  Created by Michael Byrd on 9/1/14.
//  Copyright (c) 2014 MBYR Inc. All rights reserved.
//

#import "MBYRTimerTableDelegate.h"
#import "MBYRTimerClass.h"
#import "MBYRTimerManager.h"

@interface MBYRTimerTableDelegate ()
@property (nonatomic, readonly) NSArray* timers;
@end

@implementation MBYRTimerTableDelegate




-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return [self.timers count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MBYRTimerClass* timer = [self.timers objectAtIndex:indexPath.item];
    
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"timerCell"];
    cell.textLabel.text = timer.name;
    NSDate* now = [NSDate date];
    NSTimeInterval delay = [timer.expiresEpoch longValue] - [now timeIntervalSince1970];
    NSString* formatString = @"%.0f";
    if (delay < 0 || timer.isExpired)
    {
        if (cell.backgroundColor == [UIColor redColor])
        {
            cell.backgroundColor = [UIColor whiteColor];
            cell.detailTextLabel.textColor = [UIColor redColor];
        }
        else
        {
            cell.detailTextLabel.textColor = [UIColor whiteColor];
            cell.backgroundColor = [UIColor redColor];
        }
        formatString = @"+%.1f";
    }
    else if (delay < 10)
    {
        cell.detailTextLabel.textColor = [UIColor redColor];

    }
    else
    {
        cell.detailTextLabel.textColor = [UIColor blackColor];

    }
    cell.detailTextLabel.text = [NSString stringWithFormat:formatString, fabs(delay)];
    return cell;
    
}


-(NSArray *)timers
{
    return [[MBYRTimerManager sharedInstance] timers];
}


@end
