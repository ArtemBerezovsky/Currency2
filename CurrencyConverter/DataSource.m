//
//  DataSource.m
//  CurrencyConverter
//
//  Created by ENGLISH on 11/13/16.
//  Copyright © 2016 ArtemBerezovskiy. All rights reserved.
//

#import "DataSource.h"
#import "CurrencyModel.h"



static NSString * identifier = @"Cell";

@implementation DataSource
{
    Manager *manager;
}

- (instancetype)initWithCurrencyManager:(Manager *)aManager
{
    self = [super init];
    
    manager = aManager;
    
    return self;
}

#pragma mark - UItableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return manager.currencies.count;
}

- (UITableViewCell *) tableView: (UITableView *) tableView cellForRowAtIndexPath: (NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: identifier];
    
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle: UITableViewCellStyleSubtitle reuseIdentifier: identifier];
    }
    cell.textLabel.text = manager.currencies[indexPath.row].name;
    cell.detailTextLabel.text = manager.currencies[indexPath.row].code;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    _selectedCurrencyCurrencyModel = manager.currencies[indexPath.row];
  
}


- (instancetype)init
{
    assert( NO );
    return nil;
}



@end
