/*
 Copyright 2012 Stephen Asherson
 
 This file is part of FlippedTableView.
 
 FlippedTableView is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.
 
 FlippedTableView is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.
 
 You should have received a copy of the GNU General Public License along with Foobar. If not, see http://www.gnu.org/licenses/. */

//
//  FlippedTableViewController.m
//  FlippedTableView
//
//  Created by Stephen Asherson on 2012/12/29.
//  Copyright (c) 2012 Stephen Asherson. All rights reserved.
//

#import "FlippedTableViewController.h"

#define INVALID_ROW_OR_SECTION_NUMBER -1

@interface FlippedTableViewController ()

@end

@implementation FlippedTableViewController

@synthesize tableView;
@synthesize rowNames;
@synthesize sectionHeaderNames;

#pragma mark - LifeCycle Methods

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Create some test names for our rows.
    // We will just reuse the same 3 names in the different
    // sections
    self.rowNames = [NSArray arrayWithObjects:@"Row 1", @"Row 2", @"Row 3", nil];
    self.sectionHeaderNames = [NSArray arrayWithObjects:@"Section 1", @"Section 2", @"Section 3", @"Section 4", @"Section 5", nil];
    
    // Flip the tableview by applying a transform
    self.tableView.transform = CGAffineTransformMakeRotation(-M_PI);
}

#pragma mark - Memory Methods

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Flipped TableView Utility Methods

// Returns the reversed row number based on the datasource
// array.
-(NSInteger) getReversedRowNumber:(NSInteger) row inSection:(NSInteger) section
{
    if (!self.rowNames)
    {
        return INVALID_ROW_OR_SECTION_NUMBER;
    }
    
    // We ignore the section in this example
    
    return ([self.rowNames count] - 1) - row;
}

// Returns the reversed object from the datasource array
-(NSObject*) getObjectForRow:(NSInteger) row inSection:(NSInteger) section
{
    if (!self.rowNames)
    {
        return nil;
    }
    
    // We ignore the section in this example
    int reversedRowNum = [self getReversedRowNumber:row inSection:section];
    
    if (reversedRowNum == INVALID_ROW_OR_SECTION_NUMBER)
    {
        return nil;
    }
    
    return [self.rowNames objectAtIndex:reversedRowNum];
}

// Returns the reversed object from the section datasource array
-(NSObject*) getObjectForSection:(NSInteger) section
{
    if (!self.sectionHeaderNames)
    {
        return nil;
    }
        
    return [self.sectionHeaderNames objectAtIndex:section];
}

#pragma mark - TableView DataSource Methods

- (CGFloat) tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
	return 44.0;
}

// Returns the footer which actually behaves as our headers due to the tableview
// being rotated 180 degrees.
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    // create the parent view that will hold header Label
	UIView* customView = [[UIView alloc] initWithFrame:CGRectMake(10.0, 0.0, 300.0, 44.0)];
	
	// create the label style to match the grouped tableview style
	UILabel * headerLabel = [[UILabel alloc] initWithFrame:CGRectZero];
	headerLabel.opaque = NO;
	
    headerLabel.font = [UIFont boldSystemFontOfSize:17.0];
    headerLabel.shadowOffset = CGSizeMake(0, 1);
    headerLabel.shadowColor = [UIColor whiteColor];
    headerLabel.backgroundColor = [UIColor clearColor];
    headerLabel.textColor = [UIColor colorWithRed:0.298 green:0.337 blue:0.423 alpha:1.000];
	headerLabel.frame = CGRectMake(10.0, 0.0, 300.0, 44.0);
	headerLabel.text = (NSString*) [self getObjectForSection:section];
	[customView addSubview:headerLabel];
    
    // Flip the "footer" by applying a transform
    customView.transform = CGAffineTransformMakeRotation(-M_PI);
    
	return customView;
    
}


// Return the number of sections depending on the size of our section name
// array.
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if (!self.sectionHeaderNames)
    {
        return 0;
    }
    
    return [sectionHeaderNames count];
}


// Return the number of rows in each section. This example simply uses the 3 names
// per section.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (!self.rowNames)
    {
        return 0;
    }
    
    return [self.rowNames count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"NameCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }

    // The tableview has been rotated clockwise 180 degrees. As a result
    // we need to rotate the cell counterclockwise 180 degrees to show the contents
    // the correct way.
    cell.contentView.transform = CGAffineTransformMakeRotation(M_PI);
    
    cell.textLabel.textAlignment = UITextAlignmentCenter;
    
    // Get the names to use for the cell
    cell.textLabel.text = (NSString*) [self getObjectForRow:indexPath.row inSection:indexPath.section];
    
    return cell;
}


#pragma mark - TableView Delegate Methods

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Do nothing for now.
    NSString* rowName = (NSString*) [self getObjectForRow:indexPath.row inSection:indexPath.section];
    NSString* sectionName = (NSString*) [self getObjectForSection:indexPath.section];
    
    NSLog(@"Row with name (%@) in section (%@) selected", rowName, sectionName);
}

@end
