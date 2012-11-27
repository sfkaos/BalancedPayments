//
//  BPAccessManager.m
//  BalancedPayments
//
//  Created by Winfred Raguini on 11/25/12.
//  Copyright (c) 2012 Art250. All rights reserved.
//

#import "BPAccessManager.h"

#define API_KEY @"d45f8494376011e282fb026ba7d31e6f"

@implementation BPAccessManager

+ (id)sharedManager
{
    static dispatch_once_t pred;
    static BPAccessManager *sharedManager_ = nil;
    dispatch_once(&pred, ^{
        sharedManager_ = [[BPAccessManager alloc] init];
    });
    return sharedManager_;
}

- (id)init
{
    if (self = [super init]) {
        
    }
    return self;
}


@end
