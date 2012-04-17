//
//  LPViewController.m
//  test_NSOperation
//
//  Created by Pierre Laurac on 24/03/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "LPViewController.h"
#import "LP_Operation.h"

@interface LPViewController ()

- (void) RefreshUI:(NSNotification*) notification;

@end

@implementation LPViewController
@synthesize Atext;
@synthesize BText;
@synthesize CText;
@synthesize startButton;
@synthesize label;
@synthesize queue;


- (id) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil andNumberOfMaxConcurrencyOperations:(int)number {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        NSOperationQueue * q = [[NSOperationQueue alloc] init];
        [q setMaxConcurrentOperationCount:number];
        [self setQueue:q];
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    if ([queue maxConcurrentOperationCount] == NSOperationQueueDefaultMaxConcurrentOperationCount) {
        [label setText:@"We'll have all NSOperation running at the same time here. A, B and C will count to 10 at the same time."];
    } else {
        [label setText:@"Only one operation will run at the same time. A will go from 0 to 10, and then B, and then C."];
    }
}

- (void) viewWillAppear:(BOOL)animated {
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(RefreshUI:) 
                                                 name:@"refresh"
                                               object:nil
     ];

}

- (void) viewWillDisappear:(BOOL)animated {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [queue cancelAllOperations];
}

- (void)viewDidUnload
{
    [self setAtext:nil];
    [self setBText:nil];
    [self setCText:nil];
    [self setQueue:nil];
    [self setStartButton:nil];
    [self setLabel:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (void) RefreshUI:(NSNotification*) notification {
    NSDictionary * dictReceived = [notification object];
    NSString * nom = [dictReceived objectForKey:@"nom"];
    NSNumber * num = [dictReceived objectForKey:@"entier"];
    if ([nom isEqualToString:@"A"]) {
        [Atext setText:[NSString stringWithFormat:@"%@", num]];
    } else if ([nom isEqualToString:@"B"]) {
        [BText setText:[NSString stringWithFormat:@"%@", num]];
    } else if ([nom isEqualToString:@"C"]) {
        [CText setText:[NSString stringWithFormat:@"%@", num]];
    }
    
}

- (IBAction)buttonWasPressed:(id)sender {
    // we want a nice fresh start
    [queue cancelAllOperations];
    
    // Adding the operations
    // no need to release them as we use ARC
    LP_Operation * A = [[LP_Operation alloc] initWithName:@"A"];
    LP_Operation * B = [[LP_Operation alloc] initWithName:@"B"];
    LP_Operation * C = [[LP_Operation alloc] initWithName:@"C"];
    [queue addOperation:A];
    [queue addOperation:B];
    [queue addOperation:C];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
