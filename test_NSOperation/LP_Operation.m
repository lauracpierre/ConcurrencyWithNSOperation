//
//  LP_Operation.m
//  test_NSOperation
//
//  Created by Pierre Laurac on 24/03/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "LP_Operation.h"

@implementation LP_Operation

@synthesize  nom, entier, isCancel;

- (id) initWithName:(NSString *)n {
    if (self = [super init]) {
        [self setNom:n];
        entier = 0;
        isCancel = NO;
    }
    return self;
}

- (void) main {
    while (entier < 11 && ! isCancel) {
        NSDictionary * dicToSend = [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:nom, [NSNumber numberWithInt:entier], nil] 
                                                               forKeys:[NSArray arrayWithObjects:@"nom", @"entier", nil]
                                    ];
        [self performSelectorOnMainThread:@selector(sendNotificationOnMainThread:) 
                               withObject:dicToSend
                            waitUntilDone:NO];
        sleep(1);
        entier++;
    }
}

-(void) sendNotificationOnMainThread:(NSDictionary*)dictToSend {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"refresh"
                                                        object:dictToSend];
}

- (void) cancel {
    isCancel = YES;
}

@end
