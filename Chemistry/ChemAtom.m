
//
//  ChemAtom.m
//  Chemistry
//
//  Created by Anton Matveenko on 21.07.13.
//  Copyright (c) 2013 Anton Matveenko. All rights reserved.
//

#import "ChemAtom.h"

@implementation ChemAtom

+(id)createFromString:(NSString*) atom {
    NSInteger num = 0;
    for (NSString* atomName in [ChemAtom name]) {
		if ([atom caseInsensitiveCompare:atomName] == NSOrderedSame) {
            return [[ChemAtom alloc] initWithNumber:[[NSNumber alloc] initWithInt:num]];
        }
        num++;
    }
    return nil;
}

+ (bool) isValidChemElement:(NSString*) testString {
    for (NSString* atomName in [ChemAtom name]) {
		if ([testString caseInsensitiveCompare:atomName] == NSOrderedSame) {
            return true;
        }
    }
    return false;
}

+ (NSArray*) possibleOxidationNumbers{
	static  NSArray* values;
	if(values == nil){
		@synchronized(values){
		}
	}
	return values;
}

+ (NSArray*) possibleValencies{
	static  NSArray* values;
	if(values == nil){
		@synchronized(values){
		}
	}
	return values;
}

+ (NSArray*) electronegativity{
	static  NSArray* values;
	if(values == nil){
		@synchronized(values){
		}
	}
	return values;
}

+ (NSArray*) period{
	static  NSArray* values;
	if(values == nil){
		@synchronized(values){
		}
	}
	return values;
}

+ (NSArray*) group{
	static  NSArray* values;
	if(values == nil){
		@synchronized(values){
            values = [NSArray arrayWithObjects:

             [NSNumber numberWithUnsignedChar: 0],
             [NSNumber numberWithUnsignedChar: 1], //1
             [NSNumber numberWithUnsignedChar: 8],
             [NSNumber numberWithUnsignedChar: 1],
             [NSNumber numberWithUnsignedChar: 2],
             [NSNumber numberWithUnsignedChar: 3],
             [NSNumber numberWithUnsignedChar: 4],
             [NSNumber numberWithUnsignedChar: 5],
             [NSNumber numberWithUnsignedChar: 6],
             [NSNumber numberWithUnsignedChar: 7],
             [NSNumber numberWithUnsignedChar: 8],
             [NSNumber numberWithUnsignedChar: 1],
             [NSNumber numberWithUnsignedChar: 2],
             [NSNumber numberWithUnsignedChar: 3],
             [NSNumber numberWithUnsignedChar: 4],
             [NSNumber numberWithUnsignedChar: 5],
             [NSNumber numberWithUnsignedChar: 6],
             [NSNumber numberWithUnsignedChar: 7],
             [NSNumber numberWithUnsignedChar: 8],
             [NSNumber numberWithUnsignedChar: 1],
             [NSNumber numberWithUnsignedChar: 2],
             [NSNumber numberWithUnsignedChar: 3],
             [NSNumber numberWithUnsignedChar: 4],
             [NSNumber numberWithUnsignedChar: 5],
             [NSNumber numberWithUnsignedChar: 6],
             [NSNumber numberWithUnsignedChar: 7],
             [NSNumber numberWithUnsignedChar: 8],
             [NSNumber numberWithUnsignedChar: 8],
             [NSNumber numberWithUnsignedChar: 8],
             [NSNumber numberWithUnsignedChar: 1],
             [NSNumber numberWithUnsignedChar: 2],
             [NSNumber numberWithUnsignedChar: 3],
             [NSNumber numberWithUnsignedChar: 4],
             [NSNumber numberWithUnsignedChar: 5],
             [NSNumber numberWithUnsignedChar: 6],
             [NSNumber numberWithUnsignedChar: 7],
             [NSNumber numberWithUnsignedChar: 8],
             [NSNumber numberWithUnsignedChar: 1],
             [NSNumber numberWithUnsignedChar: 2],
             [NSNumber numberWithUnsignedChar: 3],
             [NSNumber numberWithUnsignedChar: 4],
             [NSNumber numberWithUnsignedChar: 5],
             [NSNumber numberWithUnsignedChar: 6],
             [NSNumber numberWithUnsignedChar: 7],
             [NSNumber numberWithUnsignedChar: 8],
             [NSNumber numberWithUnsignedChar: 8],
             [NSNumber numberWithUnsignedChar: 8],
             [NSNumber numberWithUnsignedChar: 1],
             [NSNumber numberWithUnsignedChar: 2],
             [NSNumber numberWithUnsignedChar: 3],
             [NSNumber numberWithUnsignedChar: 4],
             [NSNumber numberWithUnsignedChar: 5],
             [NSNumber numberWithUnsignedChar: 6],
             [NSNumber numberWithUnsignedChar: 7],
             [NSNumber numberWithUnsignedChar: 8],
             [NSNumber numberWithUnsignedChar: 1],
             [NSNumber numberWithUnsignedChar: 2],
             [NSNumber numberWithUnsignedChar: 3],
             [NSNumber numberWithUnsignedChar: 3],
             [NSNumber numberWithUnsignedChar: 3],
             [NSNumber numberWithUnsignedChar: 3],
             [NSNumber numberWithUnsignedChar: 3],
             [NSNumber numberWithUnsignedChar: 3],
             [NSNumber numberWithUnsignedChar: 3],
             [NSNumber numberWithUnsignedChar: 3],
             [NSNumber numberWithUnsignedChar: 3],
             [NSNumber numberWithUnsignedChar: 3],
             [NSNumber numberWithUnsignedChar: 3],
             [NSNumber numberWithUnsignedChar: 3],
             [NSNumber numberWithUnsignedChar: 3],
             [NSNumber numberWithUnsignedChar: 3],
             [NSNumber numberWithUnsignedChar: 3],
             [NSNumber numberWithUnsignedChar: 4],
             [NSNumber numberWithUnsignedChar: 5],
             [NSNumber numberWithUnsignedChar: 6],
             [NSNumber numberWithUnsignedChar: 7],
             [NSNumber numberWithUnsignedChar: 8],
             [NSNumber numberWithUnsignedChar: 8],
             [NSNumber numberWithUnsignedChar: 8],
             [NSNumber numberWithUnsignedChar: 1],
             [NSNumber numberWithUnsignedChar: 2],
             [NSNumber numberWithUnsignedChar: 3],
             [NSNumber numberWithUnsignedChar: 4],
             [NSNumber numberWithUnsignedChar: 5],
             [NSNumber numberWithUnsignedChar: 6],
             [NSNumber numberWithUnsignedChar: 7],
             [NSNumber numberWithUnsignedChar: 8],
             [NSNumber numberWithUnsignedChar: 1],
             [NSNumber numberWithUnsignedChar: 2],
             [NSNumber numberWithUnsignedChar: 3],
             [NSNumber numberWithUnsignedChar: 3],
             [NSNumber numberWithUnsignedChar: 3],
             [NSNumber numberWithUnsignedChar: 3],
             [NSNumber numberWithUnsignedChar: 3],
             [NSNumber numberWithUnsignedChar: 3],
             [NSNumber numberWithUnsignedChar: 3],
             [NSNumber numberWithUnsignedChar: 3],
             [NSNumber numberWithUnsignedChar: 3],
             [NSNumber numberWithUnsignedChar: 3],
             [NSNumber numberWithUnsignedChar: 3],
             [NSNumber numberWithUnsignedChar: 3],
             [NSNumber numberWithUnsignedChar: 3],
             [NSNumber numberWithUnsignedChar: 3],
             [NSNumber numberWithUnsignedChar: 3],
             [NSNumber numberWithUnsignedChar: 4],
             [NSNumber numberWithUnsignedChar: 5],
             [NSNumber numberWithUnsignedChar: 6],
             [NSNumber numberWithUnsignedChar: 7],
             [NSNumber numberWithUnsignedChar: 8],
             [NSNumber numberWithUnsignedChar: 8],
             [NSNumber numberWithUnsignedChar: 8],
             [NSNumber numberWithUnsignedChar: 1],
             [NSNumber numberWithUnsignedChar: 2],
             [NSNumber numberWithUnsignedChar: 3],
             [NSNumber numberWithUnsignedChar: 4],
             [NSNumber numberWithUnsignedChar: 5],
             [NSNumber numberWithUnsignedChar: 6],
             nil
             ];
		}
	}
	return values;
}

+ (NSArray*) subgroup{
	static  NSArray* values;
	if(values == nil){
		@synchronized(values){
            values = [NSArray arrayWithObjects:

             [NSNumber numberWithUnsignedChar: 0],
             [NSNumber numberWithUnsignedChar: 1], //1
             [NSNumber numberWithUnsignedChar: 1],
             [NSNumber numberWithUnsignedChar: 1],
             [NSNumber numberWithUnsignedChar: 1],
             [NSNumber numberWithUnsignedChar: 1],
             [NSNumber numberWithUnsignedChar: 1],
             [NSNumber numberWithUnsignedChar: 1],
             [NSNumber numberWithUnsignedChar: 1],
             [NSNumber numberWithUnsignedChar: 1],
             [NSNumber numberWithUnsignedChar: 1],
             [NSNumber numberWithUnsignedChar: 1],
             [NSNumber numberWithUnsignedChar: 1],
             [NSNumber numberWithUnsignedChar: 1],
             [NSNumber numberWithUnsignedChar: 1],
             [NSNumber numberWithUnsignedChar: 1],
             [NSNumber numberWithUnsignedChar: 1],
             [NSNumber numberWithUnsignedChar: 1],
             [NSNumber numberWithUnsignedChar: 1],
             [NSNumber numberWithUnsignedChar: 1],
             [NSNumber numberWithUnsignedChar: 1],
             [NSNumber numberWithUnsignedChar: 1],

             [NSNumber numberWithUnsignedChar: 2],
             [NSNumber numberWithUnsignedChar: 2],
             [NSNumber numberWithUnsignedChar: 2],
             [NSNumber numberWithUnsignedChar: 2],
             [NSNumber numberWithUnsignedChar: 2],
             [NSNumber numberWithUnsignedChar: 2],
             [NSNumber numberWithUnsignedChar: 2],
             [NSNumber numberWithUnsignedChar: 2],
             [NSNumber numberWithUnsignedChar: 2],
             [NSNumber numberWithUnsignedChar: 2],

             [NSNumber numberWithUnsignedChar: 1],
             [NSNumber numberWithUnsignedChar: 1],
             [NSNumber numberWithUnsignedChar: 1],
             [NSNumber numberWithUnsignedChar: 1],
             [NSNumber numberWithUnsignedChar: 1],
             [NSNumber numberWithUnsignedChar: 1],
             [NSNumber numberWithUnsignedChar: 1],
             [NSNumber numberWithUnsignedChar: 1],

             [NSNumber numberWithUnsignedChar: 2],
             [NSNumber numberWithUnsignedChar: 2],
             [NSNumber numberWithUnsignedChar: 2],
             [NSNumber numberWithUnsignedChar: 2],
             [NSNumber numberWithUnsignedChar: 2],
             [NSNumber numberWithUnsignedChar: 2],
             [NSNumber numberWithUnsignedChar: 2],
             [NSNumber numberWithUnsignedChar: 2],
             [NSNumber numberWithUnsignedChar: 2],
             [NSNumber numberWithUnsignedChar: 2],

             [NSNumber numberWithUnsignedChar: 1],
             [NSNumber numberWithUnsignedChar: 1],
             [NSNumber numberWithUnsignedChar: 1],
             [NSNumber numberWithUnsignedChar: 1],
             [NSNumber numberWithUnsignedChar: 1],
             [NSNumber numberWithUnsignedChar: 1],
             [NSNumber numberWithUnsignedChar: 1],
             [NSNumber numberWithUnsignedChar: 1],

             [NSNumber numberWithUnsignedChar: 2],

             [NSNumber numberWithUnsignedChar: 3],
             [NSNumber numberWithUnsignedChar: 3],
             [NSNumber numberWithUnsignedChar: 3],
             [NSNumber numberWithUnsignedChar: 3],
             [NSNumber numberWithUnsignedChar: 3],
             [NSNumber numberWithUnsignedChar: 3],
             [NSNumber numberWithUnsignedChar: 3],
             [NSNumber numberWithUnsignedChar: 3],
             [NSNumber numberWithUnsignedChar: 3],
             [NSNumber numberWithUnsignedChar: 3],
             [NSNumber numberWithUnsignedChar: 3],
             [NSNumber numberWithUnsignedChar: 3],
             [NSNumber numberWithUnsignedChar: 3],
             [NSNumber numberWithUnsignedChar: 3],

             [NSNumber numberWithUnsignedChar: 2],
             [NSNumber numberWithUnsignedChar: 2],
             [NSNumber numberWithUnsignedChar: 2],
             [NSNumber numberWithUnsignedChar: 2],
             [NSNumber numberWithUnsignedChar: 2],
             [NSNumber numberWithUnsignedChar: 2],
             [NSNumber numberWithUnsignedChar: 2],
             [NSNumber numberWithUnsignedChar: 2],
             [NSNumber numberWithUnsignedChar: 2],

             [NSNumber numberWithUnsignedChar: 1],
             [NSNumber numberWithUnsignedChar: 1],
             [NSNumber numberWithUnsignedChar: 1],
             [NSNumber numberWithUnsignedChar: 1],
             [NSNumber numberWithUnsignedChar: 1],
             [NSNumber numberWithUnsignedChar: 1],
             [NSNumber numberWithUnsignedChar: 1],
             [NSNumber numberWithUnsignedChar: 1],

             [NSNumber numberWithUnsignedChar: 2],

             [NSNumber numberWithUnsignedChar: 3],
             [NSNumber numberWithUnsignedChar: 3],
             [NSNumber numberWithUnsignedChar: 3],
             [NSNumber numberWithUnsignedChar: 3],
             [NSNumber numberWithUnsignedChar: 3],
             [NSNumber numberWithUnsignedChar: 3],
             [NSNumber numberWithUnsignedChar: 3],
             [NSNumber numberWithUnsignedChar: 3],
             [NSNumber numberWithUnsignedChar: 3],
             [NSNumber numberWithUnsignedChar: 3],
             [NSNumber numberWithUnsignedChar: 3],
             [NSNumber numberWithUnsignedChar: 3],
             [NSNumber numberWithUnsignedChar: 3],
             [NSNumber numberWithUnsignedChar: 3],

             [NSNumber numberWithUnsignedChar: 2],
             [NSNumber numberWithUnsignedChar: 2],
             [NSNumber numberWithUnsignedChar: 2],
             [NSNumber numberWithUnsignedChar: 2],
             [NSNumber numberWithUnsignedChar: 2],
             [NSNumber numberWithUnsignedChar: 2],
             [NSNumber numberWithUnsignedChar: 2],
             [NSNumber numberWithUnsignedChar: 2],
             [NSNumber numberWithUnsignedChar: 2],

             [NSNumber numberWithUnsignedChar: 1],
             [NSNumber numberWithUnsignedChar: 1],
             [NSNumber numberWithUnsignedChar: 1],
             [NSNumber numberWithUnsignedChar: 1],
             nil
             ];
		}
	}
	return values;
}

+ (NSArray*) name{
	static  NSArray* values;
	if(values == nil){
		@synchronized(values){
            values = [NSArray arrayWithObjects:
                      @"",
                      @"H",
                      @"He",
                      @"Li",
                      @"Be",
                      @"B",
                      @"C",
                      @"N",
                      @"O",
                      @"F",
                      @"Ne",
                      @"Na",
                      @"Mg",
                      @"Al",
                      @"Si",
                      @"P",
                      @"S",
                      @"Cl",
                      @"Ar",
                      @"K",
                      @"Ca",
                      @"Sc",
                      @"Ti",
                      @"V",
                      @"Cr",
                      @"Mn",
                      @"Fe",
                      @"Co",
                      @"Ni",
                      @"Cu",
                      @"Zn",
                      @"Ga",
                      @"Ge",
                      @"As",
                      @"Se",
                      @"Br",
                      @"Kr",
                      @"Rb",
                      @"Sr",
                      @"Y",
                      @"Zr",
                      @"Nb",
                      @"Mo",
                      @"Tc",
                      @"Ru",
                      @"Rh",
                      @"Pd",
                      @"Ag",
                      @"Cd",
                      @"In",
                      @"Sn",
                      @"Sb",
                      @"Te",
                      @"I",
                      @"Xe",
                      @"Cs",
                      @"Ba",
                      @"La",
                      @"Ce",
                      @"Pr",
                      @"Nd",
                      @"Pm",
                      @"Sm",
                      @"Eu",
                      @"Gd",
                      @"Tb",
                      @"Dy",
                      @"Ho",
                      @"Er",
                      @"Tm",
                      @"Yb",
                      @"Lu",
                      @"Hf",
                      @"Ta",
                      @"W",
                      @"Re",
                      @"Os",
                      @"Ir",
                      @"Pt",
                      @"Au",
                      @"Hg",
                      @"Tl",
                      @"Pb",
                      @"Bi",
                      @"Po",
                      @"At",
                      @"Rn",
                      @"Fr",
                      @"Ra",
                      @"Ac",
                      @"Th",
                      @"Pa",
                      @"U",
                      @"Np",
                      @"Pu",
                      @"Am",
                      @"Cm",
                      @"Bk",
                      @"Cf",
                      @"Es",
                      @"Fm",
                      @"Md",
                      @"No",
                      @"Lr",
                      @"Rf",
                      @"Db",
                      @"Sg",
                      @"Bh",
                      @"Hs",
                      @"Mt",
                      @"Ds",
                      @"Rg",
                      @"Cn",
                      @"",
                      @"Fl",
                      @"",
                      @"Lv",
                      @"",
                      nil];
		}
	}
	return values;
}
+ (NSArray*) radius{
	static  NSArray* values;
	if(values == nil){
		@synchronized(values){
		}
	}
	return values;
}
+ (NSArray*) mass{
	static  NSArray* values;
	if(values == nil){
		@synchronized(values){
            values = [NSArray arrayWithObjects:
                      [NSNumber numberWithDouble: 0.0],
                      [NSNumber numberWithDouble: 1.00795], //1
                      [NSNumber numberWithDouble: 4.002602],
                      [NSNumber numberWithDouble: 6.9412],
                      [NSNumber numberWithDouble: 9.01218],
                      [NSNumber numberWithDouble: 10.812],
                      [NSNumber numberWithDouble: 12.0108],
                      [NSNumber numberWithDouble: 14.0067],
                      [NSNumber numberWithDouble: 15.9994],
                      [NSNumber numberWithDouble: 18.99840],
                      [NSNumber numberWithDouble: 20.179],
                      [NSNumber numberWithDouble: 22.98977],
                      [NSNumber numberWithDouble: 24.305],
                      [NSNumber numberWithDouble: 26.98154],
                      [NSNumber numberWithDouble: 28.086],
                      [NSNumber numberWithDouble: 30.97376],
                      [NSNumber numberWithDouble: 32.06],
                      [NSNumber numberWithDouble: 35.453],
                      [NSNumber numberWithDouble: 39.948],
                      [NSNumber numberWithDouble: 39.0983],
                      [NSNumber numberWithDouble: 40.08],
                      [NSNumber numberWithDouble: 44.9559],
                      [NSNumber numberWithDouble: 47.90],
                      [NSNumber numberWithDouble: 50.9415],
                      [NSNumber numberWithDouble: 51.996],
                      [NSNumber numberWithDouble: 54.9380],
                      [NSNumber numberWithDouble: 55.847],
                      [NSNumber numberWithDouble: 58.9332],
                      [NSNumber numberWithDouble: 58.70],
                      [NSNumber numberWithDouble: 63.546],
                      [NSNumber numberWithDouble: 65.38],
                      [NSNumber numberWithDouble: 69.72],
                      [NSNumber numberWithDouble: 72.59],
                      [NSNumber numberWithDouble: 74.9216],
                      [NSNumber numberWithDouble: 78.96],
                      [NSNumber numberWithDouble: 79.904],
                      [NSNumber numberWithDouble: 83.80],
                      [NSNumber numberWithDouble: 85.4678],
                      [NSNumber numberWithDouble: 87.62],
                      [NSNumber numberWithDouble: 88.9059],
                      [NSNumber numberWithDouble: 91.22],
                      [NSNumber numberWithDouble: 92.9064],
                      [NSNumber numberWithDouble: 95.94],
                      [NSNumber numberWithDouble: 98.9062],
                      [NSNumber numberWithDouble: 101.07],
                      [NSNumber numberWithDouble: 102.9055],
                      [NSNumber numberWithDouble: 106.4],
                      [NSNumber numberWithDouble: 107.868],
                      [NSNumber numberWithDouble: 112.41],
                      [NSNumber numberWithDouble: 114.82],
                      [NSNumber numberWithDouble: 118.69],
                      [NSNumber numberWithDouble: 121.75],
                      [NSNumber numberWithDouble: 127.60],
                      [NSNumber numberWithDouble: 126.9045],
                      [NSNumber numberWithDouble: 131.30],
                      [NSNumber numberWithDouble: 132.9054],
                      [NSNumber numberWithDouble: 137.33],
                      [NSNumber numberWithDouble: 138.9],
                      [NSNumber numberWithDouble: 140.1],
                      [NSNumber numberWithDouble: 140.9],
                      [NSNumber numberWithDouble: 144.2],
                      [NSNumber numberWithDouble: 145.0],
                      [NSNumber numberWithDouble: 150.4],
                      [NSNumber numberWithDouble: 151.9],
                      [NSNumber numberWithDouble: 157.3],
                      [NSNumber numberWithDouble: 158.9],
                      [NSNumber numberWithDouble: 162.5],
                      [NSNumber numberWithDouble: 164.9],
                      [NSNumber numberWithDouble: 167.3],
                      [NSNumber numberWithDouble: 168.9],
                      [NSNumber numberWithDouble: 173.0],
                      [NSNumber numberWithDouble: 174.9],
                      [NSNumber numberWithDouble: 178.49],
                      [NSNumber numberWithDouble: 180.9479],
                      [NSNumber numberWithDouble: 183.85],
                      [NSNumber numberWithDouble: 186.207],
                      [NSNumber numberWithDouble: 190.2],
                      [NSNumber numberWithDouble: 192.22],
                      [NSNumber numberWithDouble: 195.09],
                      [NSNumber numberWithDouble: 196.9665],
                      [NSNumber numberWithDouble: 200.59],
                      [NSNumber numberWithDouble: 204.37],
                      [NSNumber numberWithDouble: 207.2],
                      [NSNumber numberWithDouble: 208.9],
                      [NSNumber numberWithDouble: 209.0],
                      [NSNumber numberWithDouble: 210.0],
                      [NSNumber numberWithDouble: 222.0],
                      [NSNumber numberWithDouble: 223.0],
                      [NSNumber numberWithDouble: 226.0],
                      [NSNumber numberWithDouble: 227.0],
                      [NSNumber numberWithDouble: 232.0],
                      [NSNumber numberWithDouble: 231.0],
                      [NSNumber numberWithDouble: 238.0],
                      [NSNumber numberWithDouble: 237.0],
                      [NSNumber numberWithDouble: 244.0],
                      [NSNumber numberWithDouble: 243.0],
                      [NSNumber numberWithDouble: 247.0],
                      [NSNumber numberWithDouble: 247.0],
                      [NSNumber numberWithDouble: 251.0],
                      [NSNumber numberWithDouble: 252.0],
                      [NSNumber numberWithDouble: 257.0],
                      [NSNumber numberWithDouble: 258.0],
                      [NSNumber numberWithDouble: 259.0],
                      [NSNumber numberWithDouble: 262.0],
                      [NSNumber numberWithDouble: 261.0],
                      [NSNumber numberWithDouble: 262.0],
                      [NSNumber numberWithDouble: 266.0],
                      [NSNumber numberWithDouble: 269.0],
                      [NSNumber numberWithDouble: 269.0],
                      [NSNumber numberWithDouble: 268.0],
                      [NSNumber numberWithDouble: 271.0],
                      [NSNumber numberWithDouble: 272.0],
                      [NSNumber numberWithDouble: 285.0],
                      [NSNumber numberWithDouble: 0.0],
                      [NSNumber numberWithDouble: 289.0],
                      [NSNumber numberWithDouble: 0.0],
                      [NSNumber numberWithDouble: 0.0],
                      nil
                      ];
		}
	}
	return values;
}
+ (NSArray*) pronouncableNames{
	static  NSArray* values;
	if(values == nil){
		@synchronized(values){
		}
	}
	return values;
}
+ (NSArray*) outerLayerElectrons{
	static  NSArray* values;
	if(values == nil){
		@synchronized(values){
		}
	}
	return values;
}

+ (NSArray*) getAtomsWithGroup:(NSNumber*)group subgroup:(NSNumber*)subgroup {
    NSMutableArray* ret = [[NSMutableArray alloc] init];
    unsigned char index = 0;
    for (NSNumber* currentGroup in [ChemAtom group]) {
        if ([group unsignedCharValue] == [currentGroup unsignedCharValue] &&
            [group unsignedCharValue] == [[[ChemAtom subgroup] objectAtIndex:index] unsignedCharValue]) {
            [ret addObject:[[ChemAtom alloc] initWithNumber:[NSNumber numberWithUnsignedChar:index]]];
        }
        index++;
    }
    return ret;
}



-(id)initWithNumber:(NSNumber*) _number {
	assert([_number integerValue] <255);
	if (self = [super init])
    {
		number = _number;
    }
    return self;
}

-(id)init {
	assert(false);
}

- (NSNumber*) number{
	return number;
}

- (NSArray*) possibleOxidationNumbers{
	return [[ChemAtom possibleOxidationNumbers] objectAtIndex:[number integerValue]];
}
- (NSArray*) possibleValencies{
	return [[ChemAtom possibleValencies] objectAtIndex:[number integerValue]];
}
- (NSNumber*) electronegativity{
	return [[ChemAtom electronegativity] objectAtIndex:[number integerValue]];
}
- (NSNumber*) period{
	return [[ChemAtom period] objectAtIndex:[number integerValue]];
}
- (NSNumber*) group{
	return [[ChemAtom group] objectAtIndex:[number integerValue]];
}
- (NSNumber*) subgroup{
	return [[ChemAtom subgroup] objectAtIndex:[number integerValue]];
}
- (NSString*) name{
	return [[ChemAtom name] objectAtIndex:[number integerValue]];
}
- (NSNumber*) radius{
	return [[ChemAtom radius] objectAtIndex:[number integerValue]];
}
- (NSNumber*) mass{
	return [[ChemAtom mass] objectAtIndex:[number integerValue]];
}
- (NSArray*) pronouncableNames{
	return [[ChemAtom pronouncableNames] objectAtIndex:[number integerValue]];
}
- (NSString*) outerLayerElectrons{
	return [[ChemAtom outerLayerElectrons] objectAtIndex:[number integerValue]];
}

-(NSString*) formatAsString {
    return [self name];
}

- (NSDictionary*) bruttoFormula {
	return [[NSDictionary alloc] initWithObjectsAndKeys:[NSNumber numberWithUnsignedInteger:1], self.name, nil];
}

- (double) molarMass {
	return [self.mass doubleValue];
}

- (char) oxidationNumber {
    return oxidationNumber;
}

- (void) setOxidationNumber:(char) oxNum {
    oxidationNumber = oxNum;
}
- (bool) isOxidationNumberDetermined {
    if (isOxidationNumberDetermined) {
        return YES;
    }
    if ([self.number unsignedCharValue] == 9) { //fluoride
        isOxidationNumberDetermined = YES;
        oxidationNumber = -1;
        return YES;
    }
    if ([self.number unsignedCharValue] != 1 &&
	        [self.group unsignedCharValue] <= 2 &&
    	    [self.subgroup unsignedCharValue] == 1) {
        isOxidationNumberDetermined = YES;
        oxidationNumber = [self.group unsignedCharValue];
        return YES;
    }
    return NO;
}

- (bool) determineOxidationNumber:(NSDictionary*) bruttoFormula {
    
}

- (void) setOxNumbers:(NSDictionary*) oxNums {
    self.oxidationNumber = [[oxNums objectForKey:[self name]] shortValue];
}

- (NSString*) printOxidationNumbers {
    return [[NSString alloc] initWithFormat:@"%@:%d", self.name, self.oxidationNumber ];
}

- (BOOL)isEqual:(id)anObject {
	if ([anObject isKindOfClass:[ChemAtom class]]){
		if ([self.number unsignedCharValue] != [[anObject number] unsignedCharValue]) {
			return NO;
        }
        return TRUE;
    }
    else {
        return NO;
    }
}

- (NSUInteger)hash {
    return [self.number unsignedIntegerValue];
}

@end
