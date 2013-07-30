//
//  ChemData.h
//  Chemistry
//
//  Created by Anton Matveenko on 26.07.13.
//  Copyright (c) 2013 Anton Matveenko. All rights reserved.
//

#import <Foundation/Foundation.h>
@class ChemSubstance;
@protocol ChemData <NSObject>
- (NSString*) formatAsString;
- (NSDictionary*) bruttoFormula;
- (double) molarMass;

- (NSString*) printOxidationNumbers;
- (bool) isOxidationNumberDetermined;
- (bool) determineOxidationNumber:(ChemSubstance*) bruttoFormula;

@property (readonly) unsigned char oxidationNumberDeterminationPriority;
@property char oxidationNumber;
@end
