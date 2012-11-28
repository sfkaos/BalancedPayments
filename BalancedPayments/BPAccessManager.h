//
//  BPAccessManager.h
//  BalancedPayments
//
//  Created by Winfred Raguini on 11/25/12.
//  Copyright (c) 2012 Art250. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ASIHTTPRequest.h"

@interface BPAccessManager : NSObject

+ (id)sharedManager;
- (ASIHTTPRequest*)baseRequest;

@end
