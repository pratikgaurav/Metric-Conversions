//
//  TemperatureViewController.m
//  Metric Conversions
//
//  Created by Kamireddi, Gaurav Venkata Satya Pratik on 10/23/17.
//  Copyright © 2017 Kamireddi, Gaurav Venkata Satya Pratik. All rights reserved.
//

#import "TemperatureViewController.h"

@interface TemperatureViewController ()
@property (weak, nonatomic) IBOutlet UILabel *temperatureLabel;
@property (weak, nonatomic) IBOutlet UITextField *temperatureInputText;
@property (weak, nonatomic) IBOutlet UILabel *outputLabel;
- (IBAction)temperatureAction:(id)sender;

@end

@implementation TemperatureViewController

float k;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    if (_temp == 0)
    {
        _temperatureLabel.text = @"Fahrenheit to Celsius\n 1 Fahrenheit = (Celsius x 1.8) + 32";
    }
    else if (_temp == 1)
    {
        _temperatureLabel.text = @"Celsius to Fahrenheit\n 1 Celsius = (Fahrenheit - 32)*0.5555";
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)temperatureAction:(id)sender {
    if (_temp == 0)
    {
        _temperatureLabel.text = @"Fahrenheit to Celsius\n 1 Fahrenheit = (Celsius x 1.8) + 32";
        NSString *str = [_temperatureInputText text];
        float n = [str floatValue];
        float k;
        k = (n * 1.8) + 32;
        _outputLabel.text = [NSString stringWithFormat:@"%f", k];
        NSString *str1 = [NSString stringWithFormat:@"%f Fahrenheit = %f Celsius",n, k];
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        NSMutableArray *_recents = [[defaults objectForKey:@"temperature"] mutableCopy];
        if(_recents.count==0){
            _recents = [[NSMutableArray alloc] init];
        }
        [_recents addObject:str1];
        [defaults setObject:_recents forKey:@"temperature"];
    }
    else if (_temp == 1)
    {
        _temperatureLabel.text = @"Celsius to Fahrenheit\n 1 Celsius = (Fahrenheit - 32)*0.5555";
        NSString *str = [_temperatureInputText text];
        float n = [str floatValue];
        float k;
        k = (n - 32) * 0.5555;
        _outputLabel.text = [NSString stringWithFormat:@"%f", k];
        NSString *str1 = [NSString stringWithFormat:@"%f Celsius = %f Fahrenheit",n, k];
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        NSMutableArray *_recents = [[defaults objectForKey:@"temperature"] mutableCopy];
        if(_recents.count==0){
            _recents = [[NSMutableArray alloc] init];
        }
        [_recents addObject:str1];
        [defaults setObject:_recents forKey:@"temperature"];
    }
}
@end
