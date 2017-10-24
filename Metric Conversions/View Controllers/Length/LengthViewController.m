//
//  LengthViewController.m
//  Metric Conversions
//
//  Created by Kamireddi, Gaurav Venkata Satya Pratik on 10/23/17.
//  Copyright © 2017 Kamireddi, Gaurav Venkata Satya Pratik. All rights reserved.
//

#import "LengthViewController.h"

@interface LengthViewController ()
    @property (weak, nonatomic) IBOutlet UILabel *lengthLabel;
    @property (weak, nonatomic) IBOutlet UITextField *lengthInputText;
    @property (weak, nonatomic) IBOutlet UILabel *OutputLabel;
    - (IBAction)lengthAction:(id)sender;
@end

@implementation LengthViewController

float k;

- (void)viewDidLoad {
    [super viewDidLoad];
    if (_temp == 0)
    {
        _lengthLabel.text = @"Kilometers to Miles\n 1 Km = 0.621371 miles";
    }
    else if (_temp == 1)
    {
        _lengthLabel.text = @"Miles to Kilometers\n 1 Mile = 1.60934 Kilometers";
    }
    else if (_temp == 2)
    {
        _lengthLabel.text = @"Yard to Feet\n 1 Yard = 3 Feet";
    }
    else if (_temp == 3)
    {
        _lengthLabel.text = @"Feet to Yard\n 1 Feet = 0.33333 Yards";
    }
    else if (_temp == 4)
    {
        _lengthLabel.text = @"Inches to Centimeters\n 1 Inch = 2.54 Centimeters";
    }
    else if (_temp == 5)
    {
        _lengthLabel.text = @"Centimeters to Inches\n 1 Centimeter = 0.3937 Inches";
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)lengthAction:(id)sender {
    if (_temp == 0)
    {
        _lengthLabel.text = @"Kilometers to Miles\n 1 Km = 0.621371 miles";
        NSString *str = [_lengthInputText text];
        float n = [str floatValue];
        float k;
        k = n * 0.621371;
        _OutputLabel.text = [NSString stringWithFormat:@"%f", k];
        NSString *str1 = [NSString stringWithFormat:@"%f Kilometers = %f Miles",n, k];
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        NSMutableArray *_recents = [[defaults objectForKey:@"length"] mutableCopy];
        if(_recents.count==0){
            _recents = [[NSMutableArray alloc] init];
        }
        [_recents addObject:str1];
        [defaults setObject:_recents forKey:@"length"];
    }
    else if (_temp == 1)
    {
        _lengthLabel.text = @"Miles to Kilometers\n 1 Mile = 1.60934 Kilometers";
        NSString *str = [_lengthInputText text];
        float n = [str floatValue];
        float k;
        k = n * 1.60934;
        _OutputLabel.text = [NSString stringWithFormat:@"%f", k];
        NSString *str1 = [NSString stringWithFormat:@"%f Miles = %f Kilometers",n, k];
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        NSMutableArray *_recents = [[defaults objectForKey:@"length"] mutableCopy];
        if(_recents.count==0){
            _recents = [[NSMutableArray alloc] init];
        }
        [_recents addObject:str1];
        [defaults setObject:_recents forKey:@"length"];
    }
    else if (_temp == 2)
    {
        _lengthLabel.text = @"Yard to Feet\n 1 Yard = 3 Feet";
        NSString *str = [_lengthInputText text];
        float n = [str floatValue];
        float k;
        k = n * 3;
        _OutputLabel.text = [NSString stringWithFormat:@"%f", k];
        NSString *str1 = [NSString stringWithFormat:@"%f Yard = %f Feet",n, k];
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        NSMutableArray *_recents = [[defaults objectForKey:@"length"] mutableCopy];
        if(_recents.count==0){
            _recents = [[NSMutableArray alloc] init];
        }
        [_recents addObject:str1];
        [defaults setObject:_recents forKey:@"length"];
    }
    else if (_temp == 3)
    {
        _lengthLabel.text = @"Feet to Yard\n 1 Feet = 0.33333 Yards";
        NSString *str = [_lengthInputText text];
        float n = [str floatValue];
        float k;
        k = n * 0.33333;
        _OutputLabel.text = [NSString stringWithFormat:@"%f", k];
        NSString *str1 = [NSString stringWithFormat:@"%f Feet = %f Yards",n, k];
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        NSMutableArray *_recents = [[defaults objectForKey:@"length"] mutableCopy];
        if(_recents.count==0){
            _recents = [[NSMutableArray alloc] init];
        }
        [_recents addObject:str1];
        [defaults setObject:_recents forKey:@"length"];
    }
    else if (_temp == 4)
    {
        _lengthLabel.text = @"Inches to Centimeters\n 1 Inch = 2.54 Centimeters";
        NSString *str = [_lengthInputText text];
        float n = [str floatValue];
        float k;
        k = n * 2.54;
        _OutputLabel.text = [NSString stringWithFormat:@"%f", k];
        NSString *str1 = [NSString stringWithFormat:@"%f Inch = %f Centimeters",n, k];
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        NSMutableArray *_recents = [[defaults objectForKey:@"length"] mutableCopy];
        if(_recents.count==0){
            _recents = [[NSMutableArray alloc] init];
        }
        [_recents addObject:str1];
        [defaults setObject:_recents forKey:@"length"];
    }
    else if (_temp == 5)
    {
        _lengthLabel.text = @"Centimeters to Inches\n 1 Centimeter = 0.3937 Inches";
        _lengthLabel.text = @"Inches to Centimeters\n 1 Inch = 2.54 Centimeters";
        NSString *str = [_lengthInputText text];
        float n = [str floatValue];
        float k;
        k = n * 0.3937;
        _OutputLabel.text = [NSString stringWithFormat:@"%f", k];
        NSString *str1 = [NSString stringWithFormat:@"%f Centimeter = %f Inches",n, k];
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        NSMutableArray *_recents = [[defaults objectForKey:@"length"] mutableCopy];
        if(_recents.count==0){
            _recents = [[NSMutableArray alloc] init];
        }
        [_recents addObject:str1];
        [defaults setObject:_recents forKey:@"length"];
    }
}
@end
