//
//  LiquidViewController.m
//  Metric Conversions
//
//  Created by Kamireddi, Gaurav Venkata Satya Pratik on 10/23/17.
//  Copyright © 2017 Kamireddi, Gaurav Venkata Satya Pratik. All rights reserved.
//

#import "LiquidViewController.h"

@interface LiquidViewController ()
@property (weak, nonatomic) IBOutlet UILabel *liquidLabel;
@property (weak, nonatomic) IBOutlet UITextField *liquidInputText;
@property (weak, nonatomic) IBOutlet UILabel *outputLabel;
- (IBAction)liquidAction:(id)sender;

@end

@implementation LiquidViewController

float k;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    if (_temp == 0)
    {
        _liquidLabel.text = @"Litres To Gallons\n 1 Lit = 0.264172 Gal";
    }
    else if (_temp == 1)
    {
        _liquidLabel.text = @"Gallons To Litres\n 1 Gal = 3.78541 Lit";
    }
    else if (_temp == 2)
    {
        _liquidLabel.text = @"Pints To Gallons\n 1 Pint = 0.125 Gal";
    }
    else if (_temp == 3)
    {
        _liquidLabel.text = @"Gallons To Pints\n 1 Gal = 9.60762 Pints";
    }
    else if (_temp == 4)
    {
        _liquidLabel.text = @"Quarts To Gallons\n 1 Quart = 0.20817 Gal";
    }
    else if (_temp == 5)
    {
        _liquidLabel.text = @"Gallons To Quarts\n 1 Gal = 4.80381 Quarts";
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)liquidAction:(id)sender {
    if (_temp == 0)
    {
        _liquidLabel.text = @"Litres To Gallons\n 1 Liter = 0.264172 Gallons";
        NSString *str = [_liquidInputText text];
        float n = [str floatValue];
        float k;
        k = n * 0.264172;
        _outputLabel.text = [NSString stringWithFormat:@"%f", k];
        NSString *str1 = [NSString stringWithFormat:@"%f Liter = %f Gallons",n, k];
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        NSMutableArray *_recents = [[defaults objectForKey:@"liquid"] mutableCopy];
        if(_recents.count==0){
            _recents = [[NSMutableArray alloc] init];
        }
        [_recents addObject:str1];
        [defaults setObject:_recents forKey:@"liquid"];
    }
    else if (_temp == 1)
    {
        _liquidLabel.text = @"Gallons To Litres\n 1 Gallon = 3.78541 Liters";
        NSString *str = [_liquidInputText text];
        float n = [str floatValue];
        float k;
        k = n * 3.78541;
        _outputLabel.text = [NSString stringWithFormat:@"%f", k];
        NSString *str1 = [NSString stringWithFormat:@"%f Gallon = %f Liters",n, k];
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        NSMutableArray *_recents = [[defaults objectForKey:@"liquid"] mutableCopy];
        if(_recents.count==0){
            _recents = [[NSMutableArray alloc] init];
        }
        [_recents addObject:str1];
        [defaults setObject:_recents forKey:@"liquid"];
    }
    else if (_temp == 2)
    {
        _liquidLabel.text = @"Pints To Gallons\n 1 Pint = 0.125 Gallons";
        NSString *str = [_liquidInputText text];
        float n = [str floatValue];
        float k;
        k = n * 0.125;
        _outputLabel.text = [NSString stringWithFormat:@"%f", k];
        NSString *str1 = [NSString stringWithFormat:@"%f Pint = %f Gallons",n, k];
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        NSMutableArray *_recents = [[defaults objectForKey:@"liquid"] mutableCopy];
        if(_recents.count==0){
            _recents = [[NSMutableArray alloc] init];
        }
        [_recents addObject:str1];
        [defaults setObject:_recents forKey:@"liquid"];
    }
    else if (_temp == 3)
    {
        _liquidLabel.text = @"Gallons To Pints\n 1 Gallon = 9.60762 Pints";
        NSString *str = [_liquidInputText text];
        float n = [str floatValue];
        float k;
        k = n * 9.60762;
        _outputLabel.text = [NSString stringWithFormat:@"%f", k];
        NSString *str1 = [NSString stringWithFormat:@"%f Gallon = %f Pints",n, k];
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        NSMutableArray *_recents = [[defaults objectForKey:@"liquid"] mutableCopy];
        if(_recents.count==0){
            _recents = [[NSMutableArray alloc] init];
        }
        [_recents addObject:str1];
        [defaults setObject:_recents forKey:@"liquid"];
    }
    else if (_temp == 4)
    {
        _liquidLabel.text = @"Quarts To Gallons\n 1 Quart = 0.20817 Gal";
        NSString *str = [_liquidInputText text];
        float n = [str floatValue];
        float k;
        k = n * 0.20817;
        _outputLabel.text = [NSString stringWithFormat:@"%f", k];
        NSString *str1 = [NSString stringWithFormat:@"%f Quart = %f Gal",n, k];
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        NSMutableArray *_recents = [[defaults objectForKey:@"liquid"] mutableCopy];
        if(_recents.count==0){
            _recents = [[NSMutableArray alloc] init];
        }
        [_recents addObject:str1];
        [defaults setObject:_recents forKey:@"liquid"];
    }
    else if (_temp == 5)
    {
        _liquidLabel.text = @"Gallons To Quarts\n 1 Gallons = 4.80381 Quarts";
        NSString *str = [_liquidInputText text];
        float n = [str floatValue];
        float k;
        k = n * 4.80381;
        _outputLabel.text = [NSString stringWithFormat:@"%f", k];
        NSString *str1 = [NSString stringWithFormat:@"%f Gallons = %f Quarts",n, k];
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        NSMutableArray *_recents = [[defaults objectForKey:@"liquid"] mutableCopy];
        if(_recents.count==0){
            _recents = [[NSMutableArray alloc] init];
        }
        [_recents addObject:str1];
        [defaults setObject:_recents forKey:@"liquid"];
    }
}
@end
