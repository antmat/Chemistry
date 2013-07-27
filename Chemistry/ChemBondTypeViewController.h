//
//  ChemBondTypeViewController.h
//  Chemistry
//
//  Created by Anton Matveenko on 20.07.13.
//  Copyright (c) 2013 Anton Matveenko. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChemBondTypeViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *textArea;
@property (weak, nonatomic) IBOutlet UILabel *substInfoBox;

- (IBAction)substanceEntered:(id)sender;
@end
