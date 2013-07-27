//
//  ChemData.h
//  Chemistry
//
//  Created by Anton Matveenko on 26.07.13.
//  Copyright (c) 2013 Anton Matveenko. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ChemData <NSObject>
- (NSString*) formatAsString;
- (NSDictionary*) bruttoFormula;
- (double) molarMass;
- (void) setOxNumbers:(NSDictionary*) oxNums;
- (NSString*) printOxidationNumbers;
- (bool) isOxidationNumberDetermined;
- (bool) determineOxidationNumber:(NSDictionary*) bruttoFormula;
- (char) oxidationNumber;
@end
