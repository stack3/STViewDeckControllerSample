//
//  STViewController.m
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

#import "STViewDeckController.h"
#import "STMenuViewController.h"
#import "STFirstViewController.h"

@implementation STViewDeckController

- (id)init
{
    _menuViewController = [[STMenuViewController alloc] initWithNibName:nil bundle:nil];
    _menuViewController.delegate = self;
    
    _firstViewController = [[STFirstViewController alloc] initWithNibName:nil bundle:nil];
    _firstViewController.delegate = self;
    
    _secondViewController = [[STSecondViewController alloc] initWithNibName:nil bundle:nil];
    _secondViewController.delegate = self;
    
    UINavigationController *naviController = [[UINavigationController alloc] initWithRootViewController:_firstViewController];
    
    self = [super initWithCenterViewController:naviController leftViewController:_menuViewController];
    if (self) {
        self.delegate = self;
    }
    return self;
}

#pragma mark - STMenuViewControllerDelegate

- (void)menuViewController:(STMenuViewController *)sender didSelectMenuItem:(STMenuItem)menuItem
{
    UINavigationController *naviController = (UINavigationController *)self.centerController;
    UIViewController *centerRootViewController = nil;
    if (menuItem == STMenuItemFirst) {
        centerRootViewController = _firstViewController;
    } else if (menuItem == STMenuItemSecond) {
        centerRootViewController = _secondViewController;
    }
    
    if (centerRootViewController) {
        [naviController setViewControllers:[NSArray arrayWithObject:centerRootViewController]];
        [self closeLeftView];
    }
}

#pragma mark - STCenterRootViewControllerDelegate

- (void)centerRootViewControllerDidTapMenuButton:(STCenterRootViewController *)sender
{
    [self toggleLeftView];
}

#pragma mark IIViewControllerDelegate

- (BOOL)viewDeckControllerWillOpenLeftView:(IIViewDeckController*)viewDeckController animated:(BOOL)animated {
    NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
    NSNotification *notification = [NSNotification notificationWithName:STNotificationNameWillOpenMenu object:self userInfo:nil];
    [notificationCenter postNotification:notification];
    
    return YES;
}

- (BOOL)viewDeckControllerWillCloseLeftView:(IIViewDeckController*)viewDeckController animated:(BOOL)animated {
    NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
    NSNotification *notification = [NSNotification notificationWithName:STNotificationNameWillCloseMenu object:self userInfo:nil];
    [notificationCenter postNotification:notification];
    
    return YES;
}

@end
