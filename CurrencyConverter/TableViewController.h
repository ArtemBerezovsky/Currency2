//
//  TableViewController.h
//  CurrencyConverter
//
//  Created by Student on 05.11.16.
//  Copyright © 2016 ArtemBerezovskiy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyTableViewControllerProtocol.h"


@interface TableViewController : UIViewController

@property (weak, nonatomic) id <MyTableViewControllerProtocol> delegate;


@end
