//
//  ApiManager.h
//  CurrencyConverter
//
//  Created by ENGLISH on 11/23/16.
//  Copyright © 2016 ArtemBerezovskiy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ApiManager : NSObject


NS_ASSUME_NONNULL_BEGIN

- (void) getRatesWithResponseHandler: (void (^)( NSDictionary *dict))responseHandler
                  withFailureHandler: (void (^)( NSError *error))failureHandler;
                                      



NS_ASSUME_NONNULL_END
@end
