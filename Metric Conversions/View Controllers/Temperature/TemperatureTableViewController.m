//
//  TemperatureTableViewController.m
//  Metric Conversions
//
//  Created by Kamireddi, Gaurav Venkata Satya Pratik on 10/23/17.
//  Copyright © 2017 Kamireddi, Gaurav Venkata Satya Pratik. All rights reserved.
//

#import "TemperatureTableViewController.h"
#import "TemperatureViewController.h"

@interface TemperatureTableViewController ()
{
    NSString *selectedCell;
}
@end

@implementation TemperatureTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _finalArray3 = [[NSMutableArray alloc] init];
    _dataArray3 = [[NSMutableArray alloc] initWithObjects:@"Fahrenheit to Celsius", @"Celsius to Fahrenheit", nil];
    _firstDict3 = [NSDictionary dictionaryWithObject:_dataArray3 forKey:@"data"];
    [_finalArray3 addObject:_firstDict3];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [NSUserDefaults standardUserDefaults];
    NSMutableArray *_recents = [defaults objectForKey:@"temperature"];
    _recents = [[[_recents reverseObjectEnumerator] allObjects ] mutableCopy];
    
    if(_recents.count==0)
    {
        _resultArray3 = [[NSArray alloc] init];
    }
    else if(_recents.count>5){
        _resultArray3 = [_recents subarrayWithRange:NSMakeRange(0,5)];
    }
    else{
        _resultArray3 = [_recents mutableCopy];
    }
    NSDictionary *_secondDict = [NSDictionary dictionaryWithObject:_resultArray3 forKey:@"data"];
    [_finalArray3 addObject:_secondDict];
    NSLog(@"final array %@",_finalArray3);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void) viewDidAppear:(BOOL)animated{
    [self viewDidLoad];
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSDictionary *dict = [_finalArray3 objectAtIndex:section];
    NSMutableArray *arr = [dict objectForKey:@"data"];
    return [arr count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if(section == 0)
        return @"Conversions";
    else
        return @"Recents";
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    NSDictionary *dictionary = [_finalArray3 objectAtIndex:indexPath.section];
    NSArray *array = [dictionary objectForKey:@"data"];
    NSString *cellValue = [array objectAtIndex:indexPath.row];
    cell.textLabel.text = cellValue;
    if(dictionary == _firstDict3)
    {
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    return cell;
}

- (void)tableView:(UITableView * )tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *dictionary = [_finalArray3 objectAtIndex:indexPath.section];
    NSArray *array = [dictionary objectForKey:@"data"];
    selectedCell = [array objectAtIndex:indexPath.row];
    if(dictionary == _firstDict3)
    {
        //[self performSegueWithIdentifier:@"temperature2temperaturevc" sender:self];
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSIndexPath *path = [self.tableView indexPathForSelectedRow];
    TemperatureViewController *vc1 = [segue destinationViewController];
    vc1.temp = path.row;
}

@end
