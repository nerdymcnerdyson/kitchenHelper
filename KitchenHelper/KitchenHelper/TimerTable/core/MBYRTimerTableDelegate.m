//
//  MBYRTimerTableDelegate.m
//  KitchenHelper
//
//  Created by Michael Byrd on 9/1/14.
//  Copyright (c) 2014 MBYR Inc. All rights reserved.
//

#import "MBYRTimerTableDelegate.h"

@interface MBYRTimerTableDelegate ()

@end

@implementation MBYRTimerTableDelegate

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return 3;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"timerCell"];
    cell.textLabel.text = @"Timer thinger another";
    cell.detailTextLabel.text = @"55";
    return cell;
}





@end
