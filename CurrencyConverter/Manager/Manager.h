//
//  Manager.h
//  CurrencyConverter
//
//  Created by ENGLISH on 11/13/16.
//  Copyright © 2016 ArtemBerezovskiy. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CurrencyModel;
@class CurrencyViewController;


@interface Manager : NSObject

@property (nonatomic, copy, readonly) NSArray <CurrencyModel *> *currencies;
@property (nonatomic, readonly) CurrencyModel *defaultCurrency;
@property (nonatomic, readonly) CurrencyModel *baseCurrency;

- (instancetype) init;

@end
