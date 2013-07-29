//
//  ChemAtom.h
//  Chemistry
//
//  Created by Anton Matveenko on 21.07.13.
//  Copyright (c) 2013 Anton Matveenko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ChemData.h"

@interface ChemAtom : NSObject <ChemData>
{
@private
	NSNumber* number;
    char oxidationNumber;
    bool isOxidationNumberDetermined;
}

+ (bool) isValidChemElement:(NSString*) testString;
+ (id)createFromString:(NSString*) atom;
+ (NSArray*) getAtomsWithGroup:(NSNumber*)group subgroup:(NSNumber*)subgroup;
- (id)initWithNumber:(NSNumber*) _number;
- (NSString*) formatAsString;
- (NSDictionary*) bruttoFormula;
- (double) molarMass;
- (NSString*) printOxidationNumbers;
- (BOOL)isEqual:(id)anObject;
- (NSUInteger)hash;
- (bool) isOxidationNumberDetermined;
- (bool) determineOxidationNumber:(NSDictionary*) bruttoFormula;

@property (readonly) NSNumber* number;
@property (readonly) NSArray* possibleOxidationNumbers;
@property (readonly) NSArray* possibleValencies;
@property (readonly) NSNumber* electronegativity;
@property (readonly) NSNumber* period;
@property (readonly) NSNumber* group;
@property (readonly) NSNumber* subgroup;
@property (readonly) NSString* name;
@property (readonly) NSNumber* radius; //in angstrems
@property (readonly) NSNumber* mass;
@property (readonly) NSArray* pronouncableNames;
@property (readonly) NSString* outerLayerElectrons;
@property (readonly) NSNumber* electrochemicalPotential; //only for metals, for non-metals -100
@property char oxidationNumber;
@property (readonly) bool isOxidationNumberDetermined;

@end
