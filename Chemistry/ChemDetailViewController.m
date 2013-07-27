//
//  ChemDetailViewController.m
//  Chemistry
//
//  Created by Anton Matveenko on 20.07.13.
//  Copyright (c) 2013 Anton Matveenko. All rights reserved.
//

#import "ChemDetailViewController.h"
#import "MenuButton.h"
#import <QuartzCore/QuartzCore.h>

@implementation ChemDetailViewController

- (IBAction)reactionEntered:(UITextField *)sender {
	
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	//UIView *mainView = [self.view viewWithTag:0];
	//mainView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"tableview.png"]];

	UIView *textView = [self.view viewWithTag:1];
	textView.layer.cornerRadius = 5;
	textView.clipsToBounds = YES;
	// Do any additional setup after loading the view, typically from a nib.
	self.navigationItem.rightBarButtonItem = [[MenuButton alloc] initMenu];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
