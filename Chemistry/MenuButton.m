//
//  MenuButton.m
//  Chemistry
//
//  Created by Anton Matveenko on 21.07.13.
//  Copyright (c) 2013 Anton Matveenko. All rights reserved.
//

#import "MenuButton.h"

@implementation MenuButton

-(id)initMenu {
	return [self initWithTitle:@"Menu" style:UIBarButtonItemStyleBordered target:self action:@selector(showMenu:)];
	self.title = @"Menu";
}

- (void)showMenu:(id)sender
{
	UIActionSheet* actionSheet = [[UIActionSheet alloc] initWithTitle:@"Menu"
															 delegate:nil
													cancelButtonTitle:@"Отмена"
											   destructiveButtonTitle:nil
													otherButtonTitles:@"Таблица Менделеева", @"Таблица растворимостей", nil];
	[actionSheet showFromBarButtonItem:sender animated:YES];
}


@end
