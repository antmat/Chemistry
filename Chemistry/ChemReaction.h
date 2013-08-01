//
//  ChemReaction.h
//  Chemistry
//
//  Created by Anton Matveenko on 21.07.13.
//  Copyright (c) 2013 Anton Matveenko. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ChemReaction : NSObject
{
@protected
	NSMutableArray* leftElements;
	NSMutableArray* leftElementsCount;
    NSMutableArray* rightElements;
	NSMutableArray* rightElementsCount;

//	bool isComplex;
//    NSMutableDictionary* bruttoFormula;
//    double molarMass;
//    bool isOxidationNumberDetermined;
//    bool isOxidationNumberDeterminedForElements;
//	bool hasError;
//    char oxidationNumber;
//    bool useAlternateTreatment;
}

@property (readonly) NSMutableArray* leftElements;
@property (readonly) NSMutableArray* leftElementsCount;
@property (readonly) NSMutableArray* rightElements;
@property (readonly) NSMutableArray* rightElementsCount;

//@property (readonly) bool isComplex;
//@property (readonly) NSDictionary* bruttoFormula;
//@property (readonly) NSString* bruttoFormulaAsString;
//@property (readonly) double molarMass;
//@property char oxidationNumber;

//- (ChemAtomGroup*)initFromString:(NSString*)string withCharge:(char)newCharge;
//- (bool) parseElements:(NSString*) string currentIndex:(NSInteger) index;
//- (bool) parseElements:(NSString*) string;
- (NSString*) formatAsString;
//- (NSString*) printOxidationNumbers;
//- (BOOL)isEqual:(id)anObject;
//- (NSUInteger)hash;
//- (bool) isOxidationNumberDetermined;
//- (void) reset;



- (ChemReaction*)initFromString:(NSString*) string;
@end
