//
//  LengthTableViewController.m
//  Metric Conversions
//
//  Created by Kamireddi, Gaurav Venkata Satya Pratik on 10/23/17.
//  Copyright © 2017 Kamireddi, Gaurav Venkata Satya Pratik. All rights reserved.
//

#import "LengthTableViewController.h"
#import "LengthViewController.h"

@interface LengthTableViewController ()
{
    NSString *selectedCell;
}
@end

@implementation LengthTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _finalArray = [[NSMutableArray alloc] init];
    _dataArray = [[NSMutableArray alloc] initWithObjects:@"Kilometers to Miles", @"Miles to Kilometers", @"Yard to Feet", @"Feet to Yard", @"Inches to Centimeters", @"Centimeters to Inches", nil];
    _firstDict = [NSDictionary dictionaryWithObject:_dataArray forKey:@"data"];
    [_finalArray addObject:_firstDict];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [NSUserDefaults standardUserDefaults];
    NSMutableArray *_recents = [defaults objectForKey:@"length"];
    _recents = [[[_recents reverseObjectEnumerator] allObjects ] mutableCopy];
    
    if(_recents.count==0)
    {
        _resultArray = [[NSArray alloc] init];
    }
    else if(_recents.count>5){
        _resultArray = [_recents subarrayWithRange:NSMakeRange(0,5)];
    }
    else{
        _resultArray = [_recents mutableCopy];
    }
    NSDictionary *_secondDict = [NSDictionary dictionaryWithObject:_resultArray forKey:@"data"];
    [_finalArray addObject:_secondDict];
    NSLog(@"final array %@",_finalArray);
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
    NSDictionary *dict = [_finalArray objectAtIndex:section];
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
    NSDictionary *dictionary = [_finalArray objectAtIndex:indexPath.section];
    NSArray *array = [dictionary objectForKey:@"data"];
    NSString *cellValue = [array objectAtIndex:indexPath.row];
    cell.textLabel.text = cellValue;
    if(dictionary == _firstDict)
    {
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    return cell;
}

- (void)tableView:(UITableView * )tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *dictionary = [_finalArray objectAtIndex:indexPath.section];
    NSArray *array = [dictionary objectForKey:@"data"];
    selectedCell = [array objectAtIndex:indexPath.row];
    if(dictionary == _firstDict)
    {
        //[self performSegueWithIdentifier:@"length2lengthvc" sender:self];
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSIndexPath *path = [self.tableView indexPathForSelectedRow];
    LengthViewController *vc1 = [segue destinationViewController];
    vc1.temp = path.row;
}

@end
