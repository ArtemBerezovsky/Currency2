//
//  CurrencyModel.m
//  CurrencyConverter
//
//  Created by ENGLISH on 11/13/16.
//  Copyright © 2016 ArtemBerezovskiy. All rights reserved.
//

#import "CurrencyModel.h"

@implementation CurrencyModel

- (instancetype) initWithCode: ( NSString * )code
                         name: ( NSString *)name
{
    self = [super init];
    _code = [code copy];
    _name = [name copy];
    return self;
    
}

- (instancetype) init
{
    assert( NO );
    return nil;
}




@end
