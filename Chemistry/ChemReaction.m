//
//  ChemReaction.m
//  Chemistry
//
//  Created by Anton Matveenko on 21.07.13.
//  Copyright (c) 2013 Anton Matveenko. All rights reserved.
//

#import "ChemReaction.h"
#import "ChemSubstance.h"
#import "gauss.h"

@implementation ChemReaction
- (ChemReaction*)initFromString:(NSString*) string {
    if (self = [super init])
    {
        [self reset];
        unsigned short length = [string length];
        unsigned short start = 0;
        NSMutableArray* elements = leftElements;
        NSMutableArray* elementsCount = leftElementsCount;
        for(unsigned short position = 0; position < length; position++){
            unichar currentChar = [string characterAtIndex:position];
            if (currentChar == ' ' || currentChar == '+' || currentChar == '=' || (position == length -1)) {
                unsigned short i;
                unsigned short count = 0;
                for (i = start; i<position-start; i++) {
                    if(isdigit([string characterAtIndex:i])) {
                        count += count*10 + [string characterAtIndex:i] - 48;
                    }
                    else {
                        break;
                    }
                }
                if(count == 0) {
                    count = 1;
                }
                unsigned short substLen = position -i;
                if(position == length -1) {
                    substLen++;
                }
                NSString* substanceString = [string substringWithRange:NSMakeRange(i, substLen)];
                ChemSubstance* substance = [[ChemSubstance alloc] initFromString:substanceString];
                if(substance == nil) {
                    return nil;
                }
                [elements addObject:substance];
                [elementsCount addObject:[NSNumber numberWithUnsignedShort:count]];
                while ((currentChar == ' ' || currentChar == '+' || currentChar == '=') && position < length) {
                    if (currentChar == '=') {
                        if (elements == rightElements) {
                            return nil;
                        }
                        elements = rightElements;
                        elementsCount = rightElementsCount;
                    }
                    position++;
                    currentChar = [string characterAtIndex:position];
                }
                start = position;
            }
        }
        if(! [self equalize]) {
            self = nil;
        }
    }
    return self;
}
- (void) reset {
    leftElements = [[NSMutableArray alloc] init];
    leftElementsCount = [[NSMutableArray alloc] init];
    rightElements = [[NSMutableArray alloc] init];
    rightElementsCount = [[NSMutableArray alloc] init];
}
- (NSString*) formatAsString {
    NSMutableString* result = [[NSMutableString alloc] init];
    bool append = NO;
    unsigned short count = [leftElements count];
    for (unsigned short index = 0; index < count; index++) {
        if (append) {
            [result appendString:@" + "];
        }
        else {
            append = YES;
        }
        if ([[leftElementsCount objectAtIndex:index] shortValue] != 1) {
            [result appendString:[[leftElementsCount objectAtIndex:index] stringValue]];
        }
        [result appendString:[[leftElements objectAtIndex:index] formatAsString]];
    }
    append = NO;
    [result appendString:@" = "];
    count = [rightElements count];
    for (unsigned short index = 0; index < count; index++) {
        if (append) {
            [result appendString:@" + "];
        }
        else {
            append = YES;
        }
        if ([[rightElementsCount objectAtIndex:index] shortValue] != 1) {
            [result appendString:[[rightElementsCount objectAtIndex:index] stringValue]];
        }
        [result appendString:[[rightElements objectAtIndex:index] formatAsString]];
    }
    return result;
}
- (bool) equalize {
    NSMutableSet* atoms = [[NSMutableSet alloc] init];
    for (ChemSubstance* substance in leftElements) {
        for (id key in substance.bruttoFormula) {
            [atoms addObject:key];
        }
    }
    for (ChemSubstance* substance in rightElements) {
        for (id key in substance.bruttoFormula) {
            if (![atoms containsObject:key]) {
                return NO; //TODO maybe isValid is better
            }
        }
    }
    NSMutableArray* matrix = [[NSMutableArray alloc] init];
    for (NSString* atom in atoms) {
        NSMutableArray* row = [[NSMutableArray alloc] init];
        for (ChemSubstance* substance in leftElements) {
            short coeff = [[[substance bruttoFormula] objectForKey:atom] shortValue];
            [row addObject:[NSNumber numberWithShort:coeff]];
        }
        for (ChemSubstance* substance in rightElements) {
            short coeff = [[[substance bruttoFormula] objectForKey:atom] shortValue];
            [row addObject:[NSNumber numberWithShort:-1*coeff]];
        }
        [row addObject:[NSNumber numberWithShort:0]];
        [matrix addObject:row];
    }
    NSMutableArray* result = [[NSMutableArray alloc] init];
    if(gauss(matrix, result))
    {
        unsigned short index = 0;
        for (NSNumber* coeff in result) {
            if (index < [leftElementsCount count]) {
                [leftElementsCount setObject:[result objectAtIndex:index] atIndexedSubscript:index];
            }
            else {
                [rightElementsCount setObject:[result objectAtIndex:index] atIndexedSubscript:(index - [leftElementsCount count])];
            }
            index++;
        }
    }
    

    return YES;
}
- (NSMutableArray*) leftElements {
	return leftElements;
}

- (NSMutableArray*) leftElementsCount {
	return leftElementsCount;
}
- (NSMutableArray*) rightElements {
	return rightElements;
}

- (NSMutableArray*) rightElementsCount {
	return rightElementsCount;
}


@end
