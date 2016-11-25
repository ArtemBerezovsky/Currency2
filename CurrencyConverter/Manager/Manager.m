//
//  Manager.m
//  CurrencyConverter
//
//  Created by ENGLISH on 11/13/16.
//  Copyright © 2016 ArtemBerezovskiy. All rights reserved.
//

#import "Manager.h"
#import "CurrencyModel.h"
#import "CurrencyViewController.h"

@implementation Manager

- (instancetype) init
{
    self = [super init];
    
    CurrencyModel *USD = [[CurrencyModel alloc] initWithCode: kUSD name: @"Доллар США"];
    CurrencyModel *GPB = [[CurrencyModel alloc] initWithCode: kGPB name: @"Фунт стерлингов"];
    CurrencyModel *AUD = [[CurrencyModel alloc] initWithCode: kAUD name: @"Австралийский доллар"];
    NSMutableArray *currenciesArray = [NSMutableArray arrayWithObjects:USD,GPB,AUD, nil ];
    _currencies = [currenciesArray copy];

    return self;
}

- (CurrencyModel *)defaultCurrency
{
    return _currencies.firstObject;
}


@end
