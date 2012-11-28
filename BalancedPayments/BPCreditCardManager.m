//
//  BPCreditCardManager.m
//  BalancedPayments
//
//  Created by Winfred Raguini on 11/27/12.
//  Copyright (c) 2012 Art250. All rights reserved.
//

#import "BPCreditCardManager.h"

@implementation BPCreditCardManager
+ (id)sharedManager
{
    static dispatch_once_t pred;
    static BPAccessManager *sharedManager_ = nil;
    dispatch_once(&pred, ^{
        sharedManager_ = [[BPAccessManager alloc] init];
    });
    return sharedManager_;
}
@end
