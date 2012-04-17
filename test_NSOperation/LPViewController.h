//
//  LPViewController.h
//  test_NSOperation
//
//  Created by Pierre Laurac on 24/03/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LPViewController : UIViewController {
    
}
@property (retain, nonatomic) NSOperationQueue * queue;
@property (weak, nonatomic) IBOutlet UITextField *Atext;
@property (weak, nonatomic) IBOutlet UITextField *BText;
@property (weak, nonatomic) IBOutlet UITextField *CText;
@property (weak, nonatomic) IBOutlet UIButton *startButton;
@property (strong, nonatomic) IBOutlet UILabel *label;
- (IBAction)buttonWasPressed:(id)sender;

- (id) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil andNumberOfMaxConcurrencyOperations:(int)number;


@end
