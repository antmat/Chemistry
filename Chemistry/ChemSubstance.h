//
//  ChemSubstance.h
//  Chemistry
//
//  Created by Anton Matveenko on 21.07.13.
//  Copyright (c) 2013 Anton Matveenko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ChemAtomGroup.h"
@interface ChemSubstance : ChemAtomGroup
- (ChemAtomGroup*)initFromString:(NSString*) string;
@end
