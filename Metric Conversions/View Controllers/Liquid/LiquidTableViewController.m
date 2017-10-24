//
//  LiquidTableViewController.m
//  Metric Conversions
//
//  Created by Kamireddi, Gaurav Venkata Satya Pratik on 10/23/17.
//  Copyright © 2017 Kamireddi, Gaurav Venkata Satya Pratik. All rights reserved.
//

#import "LiquidTableViewController.h"
#import "LiquidViewController.h"

@interface LiquidTableViewController ()
{
    NSString *selectedCell;
}
@end

@implementation LiquidTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _finalArray1 = [[NSMutableArray alloc] init];
    _dataArray1 = [[NSMutableArray alloc] initWithObjects:@"Litres To Gallons", @"Gallons To Litres", @"Pints To Gallons", @"Gallons To Pints", @"Quarts To Gallons", @"Gallons To Quarts", nil];
    _firstDict1 = [NSDictionary dictionaryWithObject:_dataArray1 forKey:@"data"];
    [_finalArray1 addObject:_firstDict1];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [NSUserDefaults standardUserDefaults];
    NSMutableArray *_recents = [defaults objectForKey:@"liquid"];
    _recents = [[[_recents reverseObjectEnumerator] allObjects ] mutableCopy];
    
    if(_recents.count==0)
    {
        _resultArray1 = [[NSArray alloc] init];
    }
    else if(_recents.count>5){
        _resultArray1 = [_recents subarrayWithRange:NSMakeRange(0,5)];
    }
    else{
        _resultArray1 = [_recents mutableCopy];
    }
    NSDictionary *_secondDict = [NSDictionary dictionaryWithObject:_resultArray1 forKey:@"data"];
    [_finalArray1 addObject:_secondDict];
    NSLog(@"final array %@",_finalArray1);
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
    NSDictionary *dict = [_finalArray1 objectAtIndex:section];
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
    NSDictionary *dictionary = [_finalArray1 objectAtIndex:indexPath.section];
    NSArray *array = [dictionary objectForKey:@"data"];
    NSString *cellValue = [array objectAtIndex:indexPath.row];
    cell.textLabel.text = cellValue;
    if(dictionary == _firstDict1)
    {
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    return cell;
}

- (void)tableView:(UITableView * )tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *dictionary = [_finalArray1 objectAtIndex:indexPath.section];
    NSArray *array = [dictionary objectForKey:@"data"];
    selectedCell = [array objectAtIndex:indexPath.row];
    if(dictionary == _firstDict1)
    {
        [self performSegueWithIdentifier:@"liquid2liquidvc" sender:self];
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSIndexPath *path = [self.tableView indexPathForSelectedRow];
    LiquidViewController *vc1 = [segue destinationViewController];
    vc1.temp = path.row;
}


@end
