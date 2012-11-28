//
//  BPAccessManager.m
//  BalancedPayments
//
//  Created by Winfred Raguini on 11/25/12.
//  Copyright (c) 2012 Art250. All rights reserved.
//

#import "BPAccessManager.h"

#define API_KEY @"d45f8494376011e282fb026ba7d31e6f"
#define BASE_URL @"https://api.balancedpayments.com/v1"
#define MARKETPLACE_ID @"TEST-MP6sRUvdhCsKDGb3LycqNCDK"


//Bank accounts
//https://api.balancedpayments.com/v1/bank_accounts/:bank_account_id
//https://api.balancedpayments.com/v1/bank_accounts/:bank_account_id
//https://api.balancedpayments.com/v1/bank_accounts/:bank_account_id/credits
//https://api.balancedpayments.com/v1/bank_accounts/:bank_account_id/credits

//
//https://api.balancedpayments.com/v1/bank_accounts
//https://api.balancedpayments.com/v1/bank_accounts
//https://api.balancedpayments.com/v1/bank_accounts

//https://api.balancedpayments.com/v1/credits
//https://api.balancedpayments.com/v1/credits/:credit_id
//https://api.balancedpayments.com/v1/credits
//https://api.balancedpayments.com/v1/credits

//https://api.balancedpayments.com/v1/marketplaces/:marketplace_id/cards
//https://api.balancedpayments.com/v1/marketplaces/:marketplace_id/cards/:card_id
//https://api.balancedpayments.com/v1/marketplaces/:marketplace_id/cards
//https://api.balancedpayments.com/v1/marketplaces/:marketplace_id/cards/:card_id

//https://api.balancedpayments.com/v1/marketplaces/:marketplace_id/accounts
//https://api.balancedpayments.com/v1/marketplaces/:marketplace_id/accounts
//https://api.balancedpayments.com/v1/marketplaces/:marketplace_id/accounts

//https://api.balancedpayments.com/v1/marketplaces/:marketplace_id/accounts/:account_id/holds
//https://api.balancedpayments.com/v1/marketplaces/:marketplace_id/accounts/:account_id/debits

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


- (ASIHTTPRequest*)baseRequest
{
    NSURL *url = [NSURL URLWithString:BASE_URL];
    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
    [request addRequestHeader:@"username" value:API_KEY];
    return request;
}

- (ASIHTTPRequest*)requestForBankAccount
{
    NSString *bankAccountURLString = [NSString stringWithFormat:@"%@/%@", [[[self baseRequest] url] absoluteString], @"bank_accounts"];
    return [ASIHTTPRequest requestWithURL:[NSURL URLWithString:bankAccountURLString]];
}

- (ASIHTTPRequest*)requestForBankAccountWithID:(NSString*)accountId
{
    NSString *bankAccountURLString = [NSString stringWithFormat:@"%@/%@/%@", [[[self baseRequest] url] absoluteString], @"bank_accounts", accountId];
    return [ASIHTTPRequest requestWithURL:[NSURL URLWithString:bankAccountURLString]];
}

- (ASIHTTPRequest*)requestForCredits
{
    NSString *bankAccountURLString = [NSString stringWithFormat:@"%@/%@", [[[self baseRequest] url] absoluteString], @"credits"];
    return [ASIHTTPRequest requestWithURL:[NSURL URLWithString:bankAccountURLString]];
}

- (ASIHTTPRequest*)requestForCreditsWithID:(NSString*)creditId
{
    NSString *bankAccountURLString = [NSString stringWithFormat:@"%@/%@/%@", [[[self baseRequest] url] absoluteString], @"credits", creditId];
    return [ASIHTTPRequest requestWithURL:[NSURL URLWithString:bankAccountURLString]];
}

- (ASIHTTPRequest*)requestForCardsWithCardID:(NSString*)cardId
{
    NSString *bankAccountURLString = [NSString stringWithFormat:@"%@/%@/%@/%@", [[[self baseRequest] url] absoluteString], @"marketplaces", MARKETPLACE_ID, @"cards"];
    
    if (cardId) {
        bankAccountURLString = [NSString stringWithFormat:@"%@/%@", bankAccountURLString, cardId];
    }
    
    return [ASIHTTPRequest requestWithURL:[NSURL URLWithString:bankAccountURLString]];
}

- (ASIHTTPRequest*)requestForMarketplaceAccountsWithAccountID:(NSString*)accountId
{
    NSString *bankAccountURLString = [NSString stringWithFormat:@"%@/%@/%@/%@", [[[self baseRequest] url] absoluteString], @"marketplaces", MARKETPLACE_ID, @"accounts"];
    
    if (accountId) {
        bankAccountURLString = [NSString stringWithFormat:@"%@/%@", bankAccountURLString, accountId];
    }
    
// Need to update for holds and debits
    return [ASIHTTPRequest requestWithURL:[NSURL URLWithString:bankAccountURLString]];
}



- (id)init
{
    if (self = [super init]) {
        
    }
    return self;
}


@end
