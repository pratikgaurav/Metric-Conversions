//
//  MassViewController.m
//  Metric Conversions
//
//  Created by Kamireddi, Gaurav Venkata Satya Pratik on 10/23/17.
//  Copyright © 2017 Kamireddi, Gaurav Venkata Satya Pratik. All rights reserved.
//

#import "MassViewController.h"

@interface MassViewController ()
@property (weak, nonatomic) IBOutlet UILabel *massLabel;
@property (weak, nonatomic) IBOutlet UITextField *massInputText;
@property (weak, nonatomic) IBOutlet UILabel *outputLabel;
- (IBAction)massAction:(id)sender;

@end

@implementation MassViewController

float k;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    if (_temp == 0)
    {
        _massLabel.text = @"Kilograms To Pounds\n 1 Kg = 2.20462 Lbs";
    }
    else if (_temp == 1)
    {
        _massLabel.text = @"Pounds To Kilograms\n 1 Lb = 0.453592 Kgs";
    }
    else if (_temp == 2)
    {
        _massLabel.text = @"Ounce To Grams\n 1 Oz = 28.3495 G";
    }
    else if (_temp == 3)
    {
        _massLabel.text = @"Grams To Ounce\n 1 G = 0.035274 Oz";
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)massAction:(id)sender {
    if (_temp == 0)
    {
        _massLabel.text = @"Kilograms To Pounds\n 1 Kg = 2.20462 Pounds";
        NSString *str = [_massInputText text];
        float n = [str floatValue];
        float k;
        k = n * 2.20462;
        _outputLabel.text = [NSString stringWithFormat:@"%f", k];
        NSString *str1 = [NSString stringWithFormat:@"%f Kg = %f Pounds",n, k];
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        NSMutableArray *_recents = [[defaults objectForKey:@"mass"] mutableCopy];
        if(_recents.count==0){
            _recents = [[NSMutableArray alloc] init];
        }
        [_recents addObject:str1];
        [defaults setObject:_recents forKey:@"mass"];
    }
    else if (_temp == 1)
    {
        _massLabel.text = @"Pounds To Kilograms\n 1 Pound = 0.453592 Kgs";
        NSString *str = [_massInputText text];
        float n = [str floatValue];
        float k;
        k = n * 0.453592;
        _outputLabel.text = [NSString stringWithFormat:@"%f", k];
        NSString *str1 = [NSString stringWithFormat:@"%f Pound = %f Kgs",n, k];
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        NSMutableArray *_recents = [[defaults objectForKey:@"mass"] mutableCopy];
        if(_recents.count==0){
            _recents = [[NSMutableArray alloc] init];
        }
        [_recents addObject:str1];
        [defaults setObject:_recents forKey:@"mass"];
    }
    else if (_temp == 2)
    {
        _massLabel.text = @"Ounce To Grams\n 1 Ounce = 28.3495 Grams";
        NSString *str = [_massInputText text];
        float n = [str floatValue];
        float k;
        k = n * 28.3495;
        _outputLabel.text = [NSString stringWithFormat:@"%f", k];
        NSString *str1 = [NSString stringWithFormat:@"%f Ounce = %f Grams",n, k];
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        NSMutableArray *_recents = [[defaults objectForKey:@"mass"] mutableCopy];
        if(_recents.count==0){
            _recents = [[NSMutableArray alloc] init];
        }
        [_recents addObject:str1];
        [defaults setObject:_recents forKey:@"mass"];
    }
    else if (_temp == 3)
    {
        _massLabel.text = @"Grams To Ounce\n 1 Gram = 0.035274 Ounces";
        NSString *str = [_massInputText text];
        float n = [str floatValue];
        float k;
        k = n * 0.035274;
        _outputLabel.text = [NSString stringWithFormat:@"%f", k];
        NSString *str1 = [NSString stringWithFormat:@"%f Gram = %f Ounces",n, k];
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        NSMutableArray *_recents = [[defaults objectForKey:@"mass"] mutableCopy];
        if(_recents.count==0){
            _recents = [[NSMutableArray alloc] init];
        }
        [_recents addObject:str1];
        [defaults setObject:_recents forKey:@"mass"];
    }
}
@end
