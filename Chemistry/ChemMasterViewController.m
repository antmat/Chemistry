//
//  ChemMasterViewController.m
//  Chemistry
//
//  Created by Anton Matveenko on 20.07.13.
//  Copyright (c) 2013 Anton Matveenko. All rights reserved.
//

#import "ChemMasterViewController.h"

#import "ChemDetailViewController.h"

#import "MenuButton.h"

@interface ChemMasterViewController () {
    NSMutableArray *_objects;
}
@end

@implementation ChemMasterViewController

- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.navigationItem.hidesBackButton = YES;
	self.navigationItem.leftBarButtonItem = nil;
	self.navigationItem.rightBarButtonItem = [[MenuButton alloc] initMenu];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return 1;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
}

@end
