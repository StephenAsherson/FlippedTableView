/*
Copyright 2012 Stephen Asherson

This file is part of FlippedTableView.

FlippedTableView is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

FlippedTableView is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with Foobar. If not, see http://www.gnu.org/licenses/. */

//
//  FlippedTableViewController.h
//  FlippedTableView
//
//  Created by Stephen Asherson on 2012/12/29.
//  Copyright (c) 2012 Stephen Asherson. All rights reserved.
//

#import <UIKit/UIKit.h>

/*
 This view controller demonstrates how to use a tableview with its rows
 anchored at the bottom.
 
 This code is based off the following Stack Overflow article:
 
 http://stackoverflow.com/questions/5679835/uitableview-anchor-rows-to-bottom
 */

// I prefer not to extend UITableViewController as it locks one into an inheritance
// tree... this is sometimes not ideal when extending from a common base ViewController.
@interface FlippedTableViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
{
    IBOutlet UITableView* tableView;
    NSArray* sectionHeaderNames;
    NSArray* rowNames;
}

@property(nonatomic, strong) IBOutlet UITableView* tableView;
@property(nonatomic, strong) NSArray* sectionHeaderNames;
@property(nonatomic, strong) NSArray* rowNames;

@end
