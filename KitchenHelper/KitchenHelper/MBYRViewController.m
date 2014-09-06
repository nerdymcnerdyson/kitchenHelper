//
//  MBYRViewController.m
//  KitchenHelper
//
//  Created by Michael Byrd on 9/1/14.
//  Copyright (c) 2014 MBYR Inc. All rights reserved.
//

#import "MBYRViewController.h"
#import "MBYRTimerTableDelegate.h"

@interface MBYRViewController ()

@property (nonatomic, weak) IBOutlet UITableView* timerTableView;
@property (nonatomic, strong) MBYRTimerTableDelegate* tableDelegate;
@property (nonatomic, strong) NSTimer* updateTimer;

@end

@implementation MBYRViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.tableDelegate = [[MBYRTimerTableDelegate alloc] init];
    
    self.timerTableView.delegate = self.tableDelegate;
    self.timerTableView.dataSource = self.tableDelegate;
    self.updateTimer = [NSTimer scheduledTimerWithTimeInterval:0.3f
                                     target:self
                                   selector:@selector(refresh:)
                                   userInfo:nil
                                    repeats:YES];
    self.updateTimer.tolerance = 0.2f;
}

-(void) refresh: (NSTimer*) timer
{
    [self.timerTableView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
