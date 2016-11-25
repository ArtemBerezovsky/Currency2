//
//  CurrencyModel.h
//  CurrencyConverter
//
//  Created by ENGLISH on 11/13/16.
//  Copyright © 2016 ArtemBerezovskiy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CurrencyModel : NSObject

@property (nonnull, readonly, nonatomic) NSString *name;
@property (nonnull, readonly, nonatomic) NSString *code;

- (nonnull instancetype) initWithCode: ( nonnull NSString *)code
                                 name: ( nonnull NSString *)name;
- (nonnull instancetype) init NS_UNAVAILABLE;

@end

