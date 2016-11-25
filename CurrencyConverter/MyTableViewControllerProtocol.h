//
//  MyTableViewControllerProtocol.h
//  CurrencyConverter
//
//  Created by ENGLISH on 11/6/16.
//  Copyright © 2016 ArtemBerezovskiy. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol MyTableViewControllerProtocol <NSObject>


@required

-(void) didChangeCurrency: (NSString *) selectedCurrency;






@end
