//
//  TemperatureViewController.m
//  TemperatureConverter
//
//  Created by Ben Lindsey on 10/2/13.
//  Copyright (c) 2013 Ben Lindsey. All rights reserved.
//

#import "TemperatureViewController.h"

@interface TemperatureViewController ()

@property (weak, nonatomic) IBOutlet UITextField *fahrenheitField;
@property (weak, nonatomic) IBOutlet UITextField *celsiusField;

@end

@implementation TemperatureViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Temperature";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.fahrenheitField.delegate = self;
    self.celsiusField.delegate = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onDoneButton
{
    [self.view endEditing:YES];
}

# pragma mark - UITextField delegate

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(onDoneButton)];
    self.fahrenheitField.text = @"";
    self.celsiusField.text = @"";
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    self.navigationItem.rightBarButtonItem = nil;
    if ([textField.text isEqualToString:@""]) textField.text = @"0";
    if (textField == self.fahrenheitField) {
        float value = [self.fahrenheitField.text floatValue];
        self.celsiusField.text = [NSString stringWithFormat:@"%0.1f", (value - 32) * 5 / 9];
    } else {
        float value = [self.celsiusField.text floatValue];
        self.fahrenheitField.text = [NSString stringWithFormat:@"%0.1f", value * 9 / 5 + 32];
    }
}

@end
