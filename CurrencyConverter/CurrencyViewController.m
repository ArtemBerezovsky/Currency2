//
//  CurrencyViewController.m
//  CurrencyConverter
//
//  Created by ENGLISH on 10/30/16.
//  Copyright © 2016 ArtemBerezovskiy. All rights reserved.
//

#import "CurrencyViewController.h"


#pragma mark - constants

static const float kRate = 62.5f;
static NSString *kRUB = @"RUB";
static NSString *kUSD = @"USD";
static NSString *kValueDefault = @"0";
//text


@interface CurrencyViewController () <UITextFieldDelegate, MyTableViewControllerProtocol>

@property (weak, nonatomic) IBOutlet UILabel *leftCurrency;
@property (weak, nonatomic) IBOutlet UILabel *rightCurrency;
@property (weak, nonatomic) IBOutlet UITextField *valueTextField;
@property (weak, nonatomic) IBOutlet UILabel *resultLabel;
@property (assign, nonatomic) BOOL lastDot;
@property (assign, nonatomic) BOOL rubIsLeft;

@end

@implementation CurrencyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.rubIsLeft = YES;
    self.title = @"Обмен Валюты";
    self.valueTextField.delegate = self;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - IBAction

-(IBAction)CurrencyTwo: (id)sender
{
    TableViewController *tablerate;
    tablerate = [[TableViewController alloc] initWithNibName: nil bundle: nil];
    [self.navigationController pushViewController: tablerate animated: YES];
}

- (IBAction) calculateButtonClicked: (UIButton *) sender
{
    NSNumber *inputValue = [self conversion: self.valueTextField.text];
    float result;
    if (self.rubIsLeft == YES)
    {
        result = inputValue.floatValue / kRate;
        
    }
    else
    {
        result = inputValue.floatValue * kRate;
    }
    NSNumber *resultNumber = [NSNumber numberWithFloat: result];
    self.resultLabel.text = [resultNumber stringValue];
    
}

- (IBAction) changeButtonClicked: (UIButton *) sender
{
    self.rubIsLeft = !self.rubIsLeft;
    self.resultLabel.text = kValueDefault;
    if (self.rubIsLeft == YES)
    {
        self.leftCurrency.text = kRUB;
        self.rightCurrency.text = kUSD;
        [self calculateButtonClicked: nil];
    }
    else
    {
        self.leftCurrency.text = kUSD;
        self.rightCurrency.text = kRUB;
        [self calculateButtonClicked: nil];
    }
}

#pragma mark - myMetods

-(NSNumber *) conversion: (NSString *) inputText
{
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    formatter.numberStyle = NSNumberFormatterDecimalStyle;
    NSNumber *currency = [formatter numberFromString: inputText];
    return currency;
}

#pragma mark - MyTableViewControllerProtocol

-(void) didChangeCurrency: (NSNumber *) selectedCurrency
{
    switch (selectedCurrency.integerValue)
    {
        case 0:
            self.leftCurrency.text = kRUB;
            self.rightCurrency.text = kUSD;
            break;
            
        case 1:
            self.leftCurrency.text = kUSD;
            self.rightCurrency.text = kRUB;
            
        default:
            NSLog(@"Incorrect  Value: %ld", (long)selectedCurrency.integerValue);
            break;
    }
}

#pragma mark - delegateMetods

- (BOOL) textField: (UITextField *)textField
shouldChangeCharactersInRange: (NSRange)range
            replacementString: (NSString *)string
{
    if([textField.text length] > 0)
    {
        NSString *lastCharacter = [textField.text substringFromIndex:[textField.text length]-1];
        if ([string isEqualToString: @""])
        {
            if ([lastCharacter isEqualToString: @"."])
            {
                self.lastDot = NO;
            }
        }
        if ([string isEqualToString: @"."])
        {
            if(self.lastDot == NO)
            {
                self.lastDot = YES;
                return YES;
            }
            else
            {
                return NO;
            }
        }
    }
    if([textField.text length] > 0 && [string isEqualToString: @""]){
        NSNumber *inputValue = [self conversion: [textField.text substringToIndex: [textField.text length]-1]];
        float result;
        if (self.rubIsLeft == YES) {
            result = inputValue.floatValue / kRate;
            
        }
        else {
            result = inputValue.floatValue * kRate;
        }
        NSNumber *resultNumber = [NSNumber numberWithFloat: result];
        self.resultLabel.text = [resultNumber stringValue];
        return YES;
    }
    else {
        
        NSNumber *inputValue = [self conversion: [textField.text stringByAppendingString: string]];
        float result;
        if (self.rubIsLeft == YES) {
            result = inputValue.floatValue / kRate;
            
        }
        else {
            result = inputValue.floatValue * kRate;
        }
        NSNumber *resultNumber = [NSNumber numberWithFloat: result];
        self.resultLabel.text = [resultNumber stringValue];
        return YES;
        
    }
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
