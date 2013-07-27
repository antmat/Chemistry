//
//  ChemAtomGroup.h
//  Chemistry
//
//  Created by Anton Matveenko on 21.07.13.
//  Copyright (c) 2013 Anton Matveenko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ChemData.h"
@interface ChemAtomGroup : NSObject <ChemData>
{
	@protected
	NSMutableArray* elements;
	NSMutableArray* elementsCount;
	bool isComplex;
    NSMutableDictionary* bruttoFormula;
    double molarMass;
    bool isOxidationNumberDetermined;
    bool isOxidationNumberDeterminedForElements;
	bool hasError;
    char oxidationNumber;
}

@property (readonly) NSMutableArray* elements;
@property (readonly) NSMutableArray* elementsCount;
@property (readonly) bool isComplex;
@property (readonly) NSDictionary* bruttoFormula;
@property (readonly) NSString* bruttoFormulaAsString;
@property (readonly) double molarMass;
@property char oxidationNumber;

- (ChemAtomGroup*)initFromString:(NSString*) string;
- (ChemAtomGroup*)initFromString:(NSString*)string withCharge:(char)newCharge;
- (NSString*) formatAsString;
- (NSString*) printOxidationNumbers;
- (BOOL)isEqual:(id)anObject;
- (NSUInteger)hash;
- (bool) isOxidationNumberDetermined;
- (char) oxidationNumber;



@end
