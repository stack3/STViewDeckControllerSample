//
//  STSecondViewController.m
//  STViewDeckControllerSample
//
//  Copyright (c) 2012 stack3.net (http://stack3.net/)
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

#import "STSecondViewController.h"

@implementation STSecondViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Second";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    _tableView = tableView;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
}

- (void)viewDidAppear:(BOOL)animated
{
    NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
    [notificationCenter addObserver:self selector:@selector(notificationWillOpenMenu:) name:STNotificationNameWillOpenMenu object:nil];
    [notificationCenter addObserver:self selector:@selector(notificationWillCloseMenu:) name:STNotificationNameWillCloseMenu object:nil];
}

- (void)viewDidDisappear:(BOOL)animated
{
    NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
    [notificationCenter removeObserver:self];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellIdentifier = @"cell";
    UITableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    cell.textLabel.text = @"Second";
    
    return cell;
}

#pragma mark - NSNotification

- (void)notificationWillOpenMenu:(NSNotification *)notification
{
    // Fix bug that does not work to scroll to top by statusbar.
    // Disabled tableView when menu was opened.
    _tableView.userInteractionEnabled = NO;
}

- (void)notificationWillCloseMenu:(NSNotification *)notification
{
    // Fix bug that does not work to scroll to top by statusbar.
    // Enabaled tableView when menu was closed.
    _tableView.userInteractionEnabled = YES;
}

@end
