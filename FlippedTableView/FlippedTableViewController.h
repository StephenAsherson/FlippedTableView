/*
 Copyright (c) 2012 Stephen Asherson
 
 Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*/

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
