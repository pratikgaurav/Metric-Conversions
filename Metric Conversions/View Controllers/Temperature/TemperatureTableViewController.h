//
//  TemperatureTableViewController.h
//  Metric Conversions
//
//  Created by Kamireddi, Gaurav Venkata Satya Pratik on 10/23/17.
//  Copyright © 2017 Kamireddi, Gaurav Venkata Satya Pratik. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TemperatureTableViewController : UITableViewController
{
    NSMutableArray* _dataArray;
    NSArray* _resultArray;
    NSDictionary *_firstDict;
    NSMutableArray *_finalArray;
}
@end
