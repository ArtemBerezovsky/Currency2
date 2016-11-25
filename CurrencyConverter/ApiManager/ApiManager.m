//
//  ApiManager.m
//  CurrencyConverter
//
//  Created by ENGLISH on 11/23/16.
//  Copyright © 2016 ArtemBerezovskiy. All rights reserved.
//

#import "ApiManager.h"
#import "CurrencyModel.h"
#import "Manager.h"


# pragma mark - const API Manager

static NSString *const kHostAdressMask = @"http://api.fixer.io";
static NSString *const kMetod = @"/latest";
static NSString *const kBaseCurrencyCode = @"RUB";
static NSString *const kBasekey = @"base";

@implementation ApiManager
{
    NSURLSession *session;
    NSURLSessionDataTask *dataTask;
    NSURL *dataURL;
    NSDictionary *requestParams;
}

- (void) getRatesWithResponseHandler: (void (^)( NSDictionary *dict))responseHandler
                  withFailureHandler: (void (^)( NSError *error))failureHandler
{
    
    NSURL *requestURL = [self makeURL];
    
    typeof(self) __weak weakSelf = self;
    dataTask = [session dataTaskWithURL:requestURL
                      completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
                          [weakSelf processData:data
                                          error:error
                            withResponseHandler:responseHandler
                             withFailureHandler:failureHandler ];
                      }];
    
    [dataTask resume];
}


- (NSURL *)makeURL
{
    dataURL = [NSURL URLWithString:kHostAdressMask];
    NSURLComponents *components = [[NSURLComponents alloc] initWithURL:dataURL resolvingAgainstBaseURL:NO];
    components.path = kMetod;
    NSDictionary *params = @{kBasekey: kBaseCurrencyCode};
    requestParams = [params copy];
    if( nil != requestParams )
    {
        NSMutableArray *queryItems = [[NSMutableArray alloc] init];
        
        for (NSString *key in requestParams) {
            NSURLQueryItem *item = [NSURLQueryItem queryItemWithName:key value:requestParams[key]];
            [queryItems addObject:item];
        }
        
        components.queryItems = queryItems;
    }
    
    return [components URL];
}

- (void)processData:(NSData *)data
              error:(NSError *)error
withResponseHandler: (void (^)( NSDictionary *dict))responseHandler
 withFailureHandler: (void (^)( NSError *error))failureHandler
{
    if( nil != error )
    {
      failureHandler(error);
        return;
    }
    
    if( nil != data )
    {
        NSError *error = nil;
        
        id response = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
        
        if( nil != error )
        {
            failureHandler(error);
            return;
        }
        
        responseHandler(response);
    }
}




@end
