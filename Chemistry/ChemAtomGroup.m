//
//  ChemAtomGroup.m
//  Chemistry
//
//  Created by Anton Matveenko on 21.07.13.
//  Copyright (c) 2013 Anton Matveenko. All rights reserved.
//

#import "ChemAtomGroup.h"
#import "ChemAtom.h"
#import "ChemIon.h"

@implementation ChemAtomGroup

- (ChemAtomGroup*)initFromString:(NSString*)string withCharge:(char)newCharge {
    if ([self initFromString:string] != nil) {
		oxidationNumber = newCharge;
        isOxidationNumberDetermined = YES;
    }
    return self;
}

-(ChemAtomGroup*)initFromString:string
{
    NSLog(@"ChemAtomGroup initFromString called");
	if ( self = [super init] ) {
		[self reset];
        [self parseElements:string];
	}
	return self;
}

- (void) reset {
    oxidationNumber = 0;
    isOxidationNumberDetermined = NO;
    isOxidationNumberDeterminedForElements = NO;
    elements = [[NSMutableArray alloc] init];
    elementsCount = [[NSMutableArray alloc] init];
    isComplex = NO;
    bruttoFormula = nil;
    molarMass = 0.0;
    hasError = NO;
}

- (bool) parseElements:(NSString*) string {
	return [self parseElements:string currentIndex:0];
}

- (bool) parseElements:(NSString*) string currentIndex:(NSInteger) index {
    NSLog(@"Parse called with %@, index is %u", string, index);
	if(string.length == 0) {
		return true;
	}
	NSString* part = [string substringToIndex:1];
    NSInteger len;
	if([self isOpenBracket:[part characterAtIndex:0]]) {
        NSLog(@"found open bracket");
		NSUInteger closeBracketPos = [self findCloseBracket:string];
        if(closeBracketPos == 0) {
            return false;
        }
		NSString* bracketContent = [string substringWithRange:NSMakeRange(1, closeBracketPos-1)];
		ChemIon* subgroup = [[ChemIon alloc] initFromString:bracketContent];
		if(subgroup == nil) {
			return false;
		}
		[elements addObject:subgroup];
		[elementsCount addObject: [self getGroupCount:[string substringFromIndex:closeBracketPos+1] foundCountLength:&len]];
		if (![self parseElements:[string substringFromIndex:(closeBracketPos + len + 1) ] currentIndex:index+1]) {
            [elements removeObjectsInRange:NSMakeRange(index, [elements count]-index)];
            [elementsCount removeObjectsInRange:NSMakeRange(index, [elements count]-index)];
			return false;
		}
        isComplex = YES;
		return true;
	}
    NSArray* indexes;
    if (useAlternateTreatment) {
        indexes = [[NSArray alloc] initWithObjects:
                   [NSNumber numberWithUnsignedChar:2],
                   [NSNumber numberWithUnsignedChar:1],
                   nil];
    }
    else {
        indexes = [[NSArray alloc] initWithObjects:
                   [NSNumber numberWithUnsignedChar:1],
                   [NSNumber numberWithUnsignedChar:2],
                   nil];
    }
    for (NSNumber* num in indexes) {
        unsigned char i = [num unsignedCharValue];
        if (i > [string length]) {
            continue;
        }
	    ChemAtom* atom = [ChemAtom createFromString:[string substringToIndex:i]];
		if (atom != nil) {
            NSLog(@"found atom");
            NSLog(@"%@", [atom name]);
	        NSNumber* possibleIndex = [self getGroupCount:[string substringFromIndex:i] foundCountLength:&len];
            NSLog(@"index is %@", possibleIndex);
        	[elements addObject:atom];
			[elementsCount addObject: possibleIndex];
	        if ([self parseElements:[string substringFromIndex:(len + i) ] currentIndex:index+1]) {
				return true;
			}
	        else {
	            [elements removeObjectsInRange:NSMakeRange(index, [elements count]-index)];
	            [elementsCount removeObjectsInRange:NSMakeRange(index, [elementsCount count]-index)];
	        }
		}
    }
	return false;
}

- (bool) isOpenBracket:(unichar) ch {

    if (ch == '(' || ch == '{' || ch == '[')
    {
        return true;
    }
	return false;
}

- (NSUInteger) findCloseBracket:(NSString*) string {
    unichar ch = [string characterAtIndex:0];
    assert( ch == '(' || ch == '{' || ch == '[' );
    NSInteger nestingLevel = 1;
	for (NSUInteger i = 1; i < [string length]; i++) {
		ch = [string characterAtIndex:i];
        if (ch == '(' || ch == '{' || ch == '[') {
            nestingLevel++;
        }
        else if (ch == ')' || ch == '}' || ch == ']') {
            nestingLevel--;
        }
        if(nestingLevel == 0) {
            return i;
        }
    }
	return 0;
}

- (NSNumber*) getGroupCount:(NSString*) string foundCountLength:(NSInteger*) len {
	(*len) = 0;
	bool isNumeric;
	NSUInteger ret = 0;
    NSUInteger pos = 0;
    if ([string length] == 0) {
        return [NSNumber numberWithInt:1];
    }
	do {
		unichar c = [string characterAtIndex:pos];
		isNumeric = isdigit(c);
		if (isNumeric) {
			ret += ret*10 + c - 48;
			(*len)++;
		}
        pos++;
	}
	while (isNumeric && pos < [string length]);
    if(ret == 0)
    {
        ret = 1;
    }
    return [NSNumber numberWithInt:ret];
}

- (NSMutableArray*) elements {
	return elements;
}

- (NSMutableArray*) elementsCount {
	return elementsCount;
}

- (char) oxidationNumber {
    if (!isOxidationNumberDetermined) {
        [self determineOxidationNumber:self.bruttoFormula];
    }
	return oxidationNumber;
}

- (void) setOxidationNumber:(char) oxNum {
    oxidationNumber = oxNum;
}

- (bool) isComplex {
	return isComplex;
}

-(NSString*) formatAsString {
    NSMutableString* ret = [[NSMutableString alloc] init];
    NSUInteger index = 0;
    NSString* open = @"", *close = @"";
	for (id element in elements) {
        if([element isKindOfClass:[ChemAtomGroup class]]) {
            if ([element isComplex]) {
                open = @"[";
                close = @"]";
            }
            else {
				open = @"(";
                close = @")";
            }
        }
        [ret appendString:open];
        [ret appendString:[element formatAsString]];
        [ret appendString:close];
        if ([[elementsCount objectAtIndex:index] intValue] > 1) {
            [ret appendString:[[elementsCount objectAtIndex:index] stringValue]];
        }
        index++;
    }
    return ret;
}

- (double) molarMass {
    if (molarMass != 0.0) {
		return molarMass;
    }
    NSUInteger index = 0;
    for (id<ChemData> element in elements) {
        molarMass += element.molarMass * [[elementsCount objectAtIndex:index] unsignedIntegerValue];
		index++;
    }
    return molarMass;
}

- (NSString*) bruttoFormulaAsString {
    NSMutableString* ret = [[NSMutableString alloc] init];
    NSDictionary* brutto = self.bruttoFormula;
    for (id key in brutto) {
		[ret appendString:key];
        [ret appendString:[[brutto objectForKey:key] stringValue]];
    }
    return ret;
}

-(NSDictionary*) bruttoFormula {
    if (bruttoFormula != nil) {
		return bruttoFormula;
    }
    bruttoFormula = [[NSMutableDictionary alloc] init];
    NSUInteger index = 0;
	for (id<ChemData> element in elements) {
        NSDictionary* subformula = [element bruttoFormula];
        for (id subelementKey in subformula) {
            if([bruttoFormula objectForKey:subelementKey] == nil) {
                NSNumber* newVal = [NSNumber numberWithUnsignedInteger:
                                    [[subformula objectForKey:subelementKey] unsignedIntegerValue] *
                                    [[elementsCount objectAtIndex:index] unsignedIntegerValue]
                                    ];
                [bruttoFormula setObject:newVal forKey:subelementKey];
            }
            else {
                NSNumber* newVal = [NSNumber numberWithUnsignedInteger:
                                    [[subformula objectForKey:subelementKey] unsignedIntValue] *
                                    [[elementsCount objectAtIndex:index] unsignedIntegerValue] +
                                    [[bruttoFormula objectForKey:subelementKey] unsignedIntValue]
                                    ];
                [bruttoFormula setObject:newVal forKey:subelementKey];
            }
        }
        index++;
    }
    return bruttoFormula;
}

- (ChemAtomGroup*) getNonComplex {
    return [[[self class] alloc] initFromString:[self bruttoFormulaAsString]]; //TODO: refactor
}

- (bool) determineOxidationNumber:(NSDictionary*)bFormula {
    if (bFormula == nil) {
        bFormula = self.bruttoFormula;
    }
    if(hasError) {
        return NO;
    }
    if (isOxidationNumberDeterminedForElements) {
        return YES;
    }
	char currentTotalCharge = -1 * oxidationNumber;
    NSMutableArray* undeterminedElements = [[NSMutableArray alloc] init];
    unsigned char index = 0;
    unsigned char undeterminedElementsCount = 0;
    for (id<ChemData> element  in elements) {
        if(![element determineOxidationNumber:bFormula]) {
            [undeterminedElements addObject:element];
            undeterminedElementsCount = [[elementsCount objectAtIndex:index] unsignedCharValue];
        }
        else{
            currentTotalCharge += element.oxidationNumber * [[elementsCount objectAtIndex:index] unsignedCharValue];
        }
        index++;
    }

    if ([undeterminedElements count] > 1) {
        hasError = YES;
        return NO;
    }

    if(isOxidationNumberDetermined && [undeterminedElements count] == 1) {
		[[undeterminedElements objectAtIndex:0] setOxidationNumber:-1*currentTotalCharge/undeterminedElementsCount];
        return [[undeterminedElements objectAtIndex:0] determineOxidationNumber:bFormula];
    }
    if([undeterminedElements count] == 0) {
        isOxidationNumberDeterminedForElements = YES;
        return YES;
    }
    if (isOxidationNumberDetermined) {
    	hasError = YES;
    }
    return NO;
}

- (NSString*) printOxidationNumbers {
    NSMutableString* ret = [[NSMutableString alloc] init];
    if([self determineOxidationNumber:self.bruttoFormula]) {
        for (id<ChemData> element in elements) {
            if (![ret isEqual: @""]) {
                [ret appendString:@","];
            }
            [ret appendString:[element printOxidationNumbers]];
        }
    }
    return ret;
}

- (BOOL)isEqual:(id)anObject {
	if ([anObject isKindOfClass:[ChemAtomGroup class]]){
        if ([elements count] != [[anObject elements] count]) {
            return NO;
        }
        for (unsigned char index = 0; index < [elements count]; index++)
        {
			if ([[elementsCount objectAtIndex:index] unsignedCharValue] !=
                [[[anObject elementsCount] objectAtIndex:index] unsignedCharValue]) {
				return NO;
            }
            if (![[elements objectAtIndex:index] isEqual: [[anObject elements] objectAtIndex:index]]) {
                return NO;
            }
        }
        return YES;
    }
    else {
        return NO;
    }
}

- (NSUInteger)hash {
    NSUInteger hash = 0;
    for (id<ChemData> element in elements) {
        hash = hash*2 + [element hash];
    }
    return hash;
}

-(bool) isOxidationNumberDetermined {
    return isOxidationNumberDetermined;
}

@end
