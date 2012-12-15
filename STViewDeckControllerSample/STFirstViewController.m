//
//  STFirstViewController.m
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

#import "STFirstViewController.h"
#import "STThirdViewController.h"

@implementation STFirstViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"First";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    CGRect bounds = self.view.bounds;
    
    self.view.backgroundColor = [UIColor colorWithRed:0.5 green:0.1 blue:0.1 alpha:1.0];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 8, self.view.bounds.size.width, 20)];
    label.text = @"First";
    label.textColor = [UIColor whiteColor];
    label.backgroundColor = [UIColor clearColor];
    label.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:label];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _button = button;
    _button.frame = CGRectMake(8, 36, bounds.size.width - 8*2, 37);
    [_button setTitle:[NSString stringWithFormat:@"%u", _tapButtonCount] forState:UIControlStateNormal];
    [_button addTarget:self action:@selector(buttonDidTap) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_button];
    
    UIButton *nextViewButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    nextViewButton.frame = CGRectMake(8, 80, bounds.size.width - 8*2, 37);
    [nextViewButton setTitle:@"Next" forState:UIControlStateNormal];
    [nextViewButton addTarget:self action:@selector(nextViewButtonDidTap) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:nextViewButton];
}

- (void)buttonDidTap
{
    _tapButtonCount++;
    [_button setTitle:[NSString stringWithFormat:@"%u", _tapButtonCount] forState:UIControlStateNormal];
}

- (void)nextViewButtonDidTap
{
    STThirdViewController *thirdViewController = [[STThirdViewController alloc] initWithNibName:nil bundle:nil];
    [self.navigationController pushViewController:thirdViewController animated:YES];
}

@end
