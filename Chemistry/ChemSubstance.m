//
//  ChemSubstance.m
//  Chemistry
//
//  Created by Anton Matveenko on 21.07.13.
//  Copyright (c) 2013 Anton Matveenko. All rights reserved.
//

#import "ChemSubstance.h"
#import "ChemIon.h"

@implementation ChemSubstance
- (ChemSubstance*) initFromString:(NSString*) string {
	if (self = [super initFromString:string]) {
        isOxidationNumberDetermined = YES;
        if (![self determineOxidationNumber:self.bruttoFormula]) {
            useAlternateTreatment = YES;
            [self reset];
            isOxidationNumberDetermined = YES;
            [self parseElements:string];
            if (![self determineOxidationNumber:self.bruttoFormula]) {
                return nil;
            }
            else {
                return self;
            }
        }
    }
    return self;
}

- (bool) parseElements:(NSString*) string {
    for (char i=0; i<[string length]; i++) {
		ChemIon* ion = [ChemIon getKnownIon:[string substringFromIndex:i]];
        if(ion) {
            NSMutableString* newStr = [[NSMutableString alloc] init];
            [newStr appendString:[string substringToIndex:i]];
            [newStr appendString:@"("];
            [newStr appendString:[string substringFromIndex:i]];
            [newStr appendString:@")"];
			return [self parseElements:newStr currentIndex:0];
        }
    }
    for (char i=[string length]-1; i>=0; i--) {
		ChemIon* ion = [ChemIon getKnownIon:[string substringToIndex:i]];
        if(ion) {
            NSMutableString* newStr = [[NSMutableString alloc] init];
            [newStr appendString:@"("];
            [newStr appendString:[string substringToIndex:i]];
            [newStr appendString:@")"];
            [newStr appendString:[string substringFromIndex:i]];
			return [self parseElements:newStr currentIndex:0];
        }
    }
	return [self parseElements:string currentIndex:0];
}

@end
