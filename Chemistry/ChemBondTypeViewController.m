//
//  ChemBondTypeViewController.m
//  Chemistry
//
//  Created by Anton Matveenko on 20.07.13.
//  Copyright (c) 2013 Anton Matveenko. All rights reserved.
//

#import "ChemBondTypeViewController.h"
#import "MenuButton.h"
#import "ChemSubstance.h"
#import "ChemReaction.h"
@interface ChemBondTypeViewController ()

@end

@implementation ChemBondTypeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.navigationItem.rightBarButtonItem = [[MenuButton alloc] initMenu];
    ChemSubstance* subst = [[ChemSubstance alloc] initFromString:[self.textArea text]];
    if(subst != nil)
    {
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)substanceEntered:(UITextField *)sender {
	/*ChemSubstance* subst = [[ChemSubstance alloc] initFromString:[self.textArea text]];
    if(subst != nil)
    {
        self.substInfoBox.text = [subst printOxidationNumbers];
        NSLog(@"%@", subst);
        NSLog(@"%@", subst.formatAsString);
        NSLog(@"%@", subst.bruttoFormulaAsString);
        NSLog(@"%F", subst.molarMass);
    }*/
    ChemReaction* reaction = [[ChemReaction alloc] initFromString:[self.textArea text]];
    if(reaction != nil) {
        self.substInfoBox.text = [reaction formatAsString];
    }
}
@end
