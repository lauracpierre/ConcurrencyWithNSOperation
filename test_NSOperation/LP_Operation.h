//
//  LP_Operation.h
//  test_NSOperation
//
//  Created by Pierre Laurac on 24/03/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LP_Operation : NSOperation

@property (assign, nonatomic) NSInteger entier;
@property (retain, nonatomic) NSString * nom;
@property (assign, nonatomic) BOOL isCancel;

- (id) initWithName:(NSString *) nom;

@end
