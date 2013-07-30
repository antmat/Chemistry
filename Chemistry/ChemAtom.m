
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
            values = [NSArray arrayWithObjects:
                      [NSArray arrayWithObjects: nil],
                      [NSArray arrayWithObjects:@-1, @1, nil],
                      [NSArray arrayWithObjects:nil],
                      [NSArray arrayWithObjects:@1, nil],
                      [NSArray arrayWithObjects:@2, nil],
                      [NSArray arrayWithObjects:@-3, @3, nil],
                      [NSArray arrayWithObjects:@-4, @-3, @-2, @-1, @1, @2, @3, @4, nil],
                      [NSArray arrayWithObjects:@-3, @-2, @-1, @1, @2, @3, @4, @5, nil],
                      [NSArray arrayWithObjects:@-2, @-1, @1, @2, nil],
                      [NSArray arrayWithObjects:@-1, nil],
                      [NSArray arrayWithObjects:nil],
                      [NSArray arrayWithObjects:@1, nil],
                      [NSArray arrayWithObjects:@2, nil],
                      [NSArray arrayWithObjects:@3, nil],
                      [NSArray arrayWithObjects:@-4, @2, @4, nil],
                      [NSArray arrayWithObjects:@-3, @3, @5, nil],
                      [NSArray arrayWithObjects:@-2, @4, @6, nil],
                      [NSArray arrayWithObjects:@-1, @1, @3, @4, @5, @6, @7, nil],
                      [NSArray arrayWithObjects:nil],
                      [NSArray arrayWithObjects:@1, nil],
                      [NSArray arrayWithObjects:@2, nil],
                      [NSArray arrayWithObjects:@3, nil],
                      [NSArray arrayWithObjects:@2, @3, @4, nil],
                      [NSArray arrayWithObjects:@2, @3, @4, @5, nil],
                      [NSArray arrayWithObjects:@2, @3, @6, nil],
                      [NSArray arrayWithObjects:@2, @3, @4, @5, @6, @7, nil],
                      [NSArray arrayWithObjects:@2, @3, @6, nil],
                      [NSArray arrayWithObjects:@-1, @2, @3, nil],
                      [NSArray arrayWithObjects:@2, @3, nil],
                      [NSArray arrayWithObjects:@1, @2, @3, nil],
                      [NSArray arrayWithObjects:@2, nil],
                      [NSArray arrayWithObjects:@3, nil],
                      [NSArray arrayWithObjects:@2, @4, nil],
                      [NSArray arrayWithObjects:@-3, @3, @5, nil],
                      [NSArray arrayWithObjects:@-2, @4, @6, nil],
                      [NSArray arrayWithObjects:@-1, @1, @3, @5, @7, nil],
                      [NSArray arrayWithObjects:@2, nil],
                      [NSArray arrayWithObjects:@1, nil],
                      [NSArray arrayWithObjects:@2, nil],
                      [NSArray arrayWithObjects:@3, nil],
                      [NSArray arrayWithObjects:@1, @2, @3, @4, nil],
                      [NSArray arrayWithObjects:@1, @2, @3, @4, @5, nil],
                      [NSArray arrayWithObjects:@2, @3, @4, @5, @6, nil],
                      [NSArray arrayWithObjects:@-1, @1, @2, @3, @4, @5, @6, @7, nil],
                      [NSArray arrayWithObjects:@3, @4, @6, @8, nil],
                      [NSArray arrayWithObjects:@1, @2, @3, @4, @5, nil],
                      [NSArray arrayWithObjects:@1, @2, @3, @4, @5, @6, nil],
                      [NSArray arrayWithObjects:@1, @2, nil],
                      [NSArray arrayWithObjects:@2, nil],
                      [NSArray arrayWithObjects:@3, nil],
                      [NSArray arrayWithObjects:@2, @4, nil],
                      [NSArray arrayWithObjects:@-3, @3, @5, nil],
                      [NSArray arrayWithObjects:@-2, @2, @4, @6, nil],
                      [NSArray arrayWithObjects:@-1, @1, @3, @5, @7, nil],
                      [NSArray arrayWithObjects:@1, @2, @4, @6, @8, nil],
                      [NSArray arrayWithObjects:@1, nil],
                      [NSArray arrayWithObjects:@2, nil],
                      [NSArray arrayWithObjects:@3, nil],
                      [NSArray arrayWithObjects:@3, @4, nil],
                      [NSArray arrayWithObjects:@3, @4, nil],
                      [NSArray arrayWithObjects:@3, nil],
                      [NSArray arrayWithObjects:@3, nil],
                      [NSArray arrayWithObjects:@2, @3, nil],
                      [NSArray arrayWithObjects:@2, @3, nil],
                      [NSArray arrayWithObjects:@3, nil],
                      [NSArray arrayWithObjects:@3, @4, nil],
                      [NSArray arrayWithObjects:@3, nil],
                      [NSArray arrayWithObjects:@3, nil],
                      [NSArray arrayWithObjects:@3, nil],
                      [NSArray arrayWithObjects:@2, @3, nil],
                      [NSArray arrayWithObjects:@2, @3, nil],
                      [NSArray arrayWithObjects:@3, nil],
                      [NSArray arrayWithObjects:@4, nil],
                      [NSArray arrayWithObjects:@5, nil],
                      [NSArray arrayWithObjects:@2, @3, @4, @5, @6, nil],
                      [NSArray arrayWithObjects:@-1, @2, @3, @4, @5, @6, @7, nil],
                      [NSArray arrayWithObjects:@-2, @2, @3, @4, @6, @8, nil],
                      [NSArray arrayWithObjects:@-1, @1, @2, @3, @4, @6, nil],
                      [NSArray arrayWithObjects:@2, @4, nil],
                      [NSArray arrayWithObjects:@-1 , @1, @3, @5, nil],
                      [NSArray arrayWithObjects:@1, @2, nil],
                      [NSArray arrayWithObjects:@1, @3, nil],
                      [NSArray arrayWithObjects:@2, @4, nil],
                      [NSArray arrayWithObjects:@3, @5, nil],
                      [NSArray arrayWithObjects:@-2, @2, @4, @6, nil],
                      [NSArray arrayWithObjects:@-1, @1, @3, @5, @7, nil],
                      [NSArray arrayWithObjects:nil],
                      [NSArray arrayWithObjects:@1, nil],
                      [NSArray arrayWithObjects:@2, nil],
                      [NSArray arrayWithObjects:@3, nil],
                      [NSArray arrayWithObjects:@4, nil],
                      [NSArray arrayWithObjects:@4, @5, nil],
                      [NSArray arrayWithObjects:@3, @4, @5, @6, nil],
                      [NSArray arrayWithObjects:@3, @4, @5, @6, @7, nil],
                      [NSArray arrayWithObjects:@2, @3, @4, @5, @6, @7, nil],
                      [NSArray arrayWithObjects:@3, @4, @5, @6, nil],
                      [NSArray arrayWithObjects:@3, @4, nil],
                      [NSArray arrayWithObjects:@3, @4, nil],
                      [NSArray arrayWithObjects:@2, @3, @4, nil],
                      [NSArray arrayWithObjects:@2, @3, @4, nil],
                      [NSArray arrayWithObjects:@3, nil],
                      [NSArray arrayWithObjects:@1, @2, @3, nil],
                      [NSArray arrayWithObjects:@2, @3, nil],
                      [NSArray arrayWithObjects:@3, nil],
                      [NSArray arrayWithObjects:@4, nil],
                      [NSArray arrayWithObjects:@3, @4, @5, nil],
                      [NSArray arrayWithObjects:nil],
                      [NSArray arrayWithObjects:nil],
                      [NSArray arrayWithObjects:nil],
                      [NSArray arrayWithObjects:nil],
                      [NSArray arrayWithObjects:nil],
                      [NSArray arrayWithObjects:nil],
                      [NSArray arrayWithObjects:nil],
                      nil];
		}
	}
	return values;
}

+ (NSArray*) possibleValencies{
	static  NSArray* values;
	if(values == nil){
		@synchronized(values){
            values = [NSArray arrayWithObjects:
                      [NSArray arrayWithObjects: nil],
                      [NSArray arrayWithObjects:@1, nil],
                      [NSArray arrayWithObjects:nil],
                      [NSArray arrayWithObjects:@1, nil],
                      [NSArray arrayWithObjects:@2, nil],
                      [NSArray arrayWithObjects:@3, nil],
                      [NSArray arrayWithObjects:@2, @4, nil],
                      [NSArray arrayWithObjects:@1, @2, @3, @4, @5, nil],
                      [NSArray arrayWithObjects:@2, nil],
                      [NSArray arrayWithObjects:@1, nil],
                      [NSArray arrayWithObjects:nil],
                      [NSArray arrayWithObjects:@1, nil],
                      [NSArray arrayWithObjects:@2, nil],
                      [NSArray arrayWithObjects:@3, nil],
                      [NSArray arrayWithObjects:@4, nil],
                      [NSArray arrayWithObjects:@3, @5, nil],
                      [NSArray arrayWithObjects:@2, @4, @6, nil],
                      [NSArray arrayWithObjects:@1, @3, @4, @5, @6, @7, nil],
                      [NSArray arrayWithObjects:nil],
                      [NSArray arrayWithObjects:@1, nil],
                      [NSArray arrayWithObjects:@2, nil],
                      [NSArray arrayWithObjects:@3, nil],
                      [NSArray arrayWithObjects:@2, @3, @4, nil],
                      [NSArray arrayWithObjects:@2, @3, @4, @5, nil],
                      [NSArray arrayWithObjects:@2, @3, @6, nil],
                      [NSArray arrayWithObjects:@2, @3, @4, @5, @6, @7, nil],
                      [NSArray arrayWithObjects:@2, @3, @6, nil],
                      [NSArray arrayWithObjects:@1, @2, @3, nil],
                      [NSArray arrayWithObjects:@2, @3, nil],
                      [NSArray arrayWithObjects:@1, @2, @3, nil],
                      [NSArray arrayWithObjects:@2, nil],
                      [NSArray arrayWithObjects:@3, nil],
                      [NSArray arrayWithObjects:@2, @4, nil],
                      [NSArray arrayWithObjects:@3, @5, nil],
                      [NSArray arrayWithObjects:@2, @4, @6, nil],
                      [NSArray arrayWithObjects:@1, @3, @5, @7, nil],
                      [NSArray arrayWithObjects:@2, nil],
                      [NSArray arrayWithObjects:@1, nil],
                      [NSArray arrayWithObjects:@2, nil],
                      [NSArray arrayWithObjects:@3, nil],
                      [NSArray arrayWithObjects:@1, @2, @3, @4, nil],
                      [NSArray arrayWithObjects:@1, @2, @3, @4, @5, nil],
                      [NSArray arrayWithObjects:@2, @3, @4, @5, @6, nil],
                      [NSArray arrayWithObjects:@1, @2, @3, @4, @5, @6, @7, nil],
                      [NSArray arrayWithObjects:@3, @4, @6, @8, nil],
                      [NSArray arrayWithObjects:@1, @2, @3, @4, @5, nil],
                      [NSArray arrayWithObjects:@1, @2, @3, @4, @5, @6, nil],
                      [NSArray arrayWithObjects:@1, @2, nil],
                      [NSArray arrayWithObjects:@2, nil],
                      [NSArray arrayWithObjects:@3, nil],
                      [NSArray arrayWithObjects:@2, @4, nil],
                      [NSArray arrayWithObjects:@3, @5, nil],
                      [NSArray arrayWithObjects:@2, @4, @6, nil],
                      [NSArray arrayWithObjects:@1, @3, @5, @7, nil],
                      [NSArray arrayWithObjects:@1, @2, @4, @6, @8, nil],
                      [NSArray arrayWithObjects:@1, nil],
                      [NSArray arrayWithObjects:@2, nil],
                      [NSArray arrayWithObjects:@3, nil],
                      [NSArray arrayWithObjects:@3, @4, nil],
                      [NSArray arrayWithObjects:@3, @4, nil],
                      [NSArray arrayWithObjects:@3, nil],
                      [NSArray arrayWithObjects:@3, nil],
                      [NSArray arrayWithObjects:@2, @3, nil],
                      [NSArray arrayWithObjects:@2, @3, nil],
                      [NSArray arrayWithObjects:@3, nil],
                      [NSArray arrayWithObjects:@3, @4, nil],
                      [NSArray arrayWithObjects:@3, nil],
                      [NSArray arrayWithObjects:@3, nil],
                      [NSArray arrayWithObjects:@3, nil],
                      [NSArray arrayWithObjects:@2, @3, nil],
                      [NSArray arrayWithObjects:@2, @3, nil],
                      [NSArray arrayWithObjects:@3, nil],
                      [NSArray arrayWithObjects:@4, nil],
                      [NSArray arrayWithObjects:@5, nil],
                      [NSArray arrayWithObjects:@2, @3, @4, @5, @6, nil],
                      [NSArray arrayWithObjects:@1, @2, @3, @4, @5, @6, @7, nil],
                      [NSArray arrayWithObjects:@2, @3, @4, @6, @8, nil],
                      [NSArray arrayWithObjects:@1, @2, @3, @4, @6, nil],
                      [NSArray arrayWithObjects:@2, @4, nil],
                      [NSArray arrayWithObjects:@1, @3, @5, nil],
                      [NSArray arrayWithObjects:@1, @2, nil],
                      [NSArray arrayWithObjects:@1, @3, nil],
                      [NSArray arrayWithObjects:@2, @4, nil],
                      [NSArray arrayWithObjects:@3, @5, nil],
                      [NSArray arrayWithObjects:@2, @4, @6, nil],
                      [NSArray arrayWithObjects:@1, @3, @5, @7, nil],
                      [NSArray arrayWithObjects:nil],
                      [NSArray arrayWithObjects:@1, nil],
                      [NSArray arrayWithObjects:@2, nil],
                      [NSArray arrayWithObjects:@3, nil],
                      [NSArray arrayWithObjects:@4, nil],
                      [NSArray arrayWithObjects:@4, @5, nil],
                      [NSArray arrayWithObjects:@3, @4, @5, @6, nil],
                      [NSArray arrayWithObjects:@3, @4, @5, @6, @7, nil],
                      [NSArray arrayWithObjects:@2, @3, @4, @5, @6, @7, nil],
                      [NSArray arrayWithObjects:@3, @4, @5, @6, nil],
                      [NSArray arrayWithObjects:@3, @4, nil],
                      [NSArray arrayWithObjects:@3, @4, nil],
                      [NSArray arrayWithObjects:@2, @3, @4, nil],
                      [NSArray arrayWithObjects:@2, @3, @4, nil],
                      [NSArray arrayWithObjects:@3, nil],
                      [NSArray arrayWithObjects:@1, @2, @3, nil],
                      [NSArray arrayWithObjects:@2, @3, nil],
                      [NSArray arrayWithObjects:@3, nil],
                      [NSArray arrayWithObjects:@4, nil],
                      [NSArray arrayWithObjects:@3, @4, @5, nil],
                      [NSArray arrayWithObjects:nil],
                      [NSArray arrayWithObjects:nil],
                      [NSArray arrayWithObjects:nil],
                      [NSArray arrayWithObjects:nil],
                      [NSArray arrayWithObjects:nil],
                      [NSArray arrayWithObjects:nil],
                      [NSArray arrayWithObjects:nil],
                      nil];
		}
	}
	return values;
}

+ (NSArray*) electronegativity{
	static  NSArray* values;
	if(values == nil){
		@synchronized(values){
            [NSArray arrayWithObjects:
             @0,
             @2.2,
             @0,
             @0.98,
             @1.57,
             @2.04,
             @2.55,
             @3.04,
             @3.44,
             @3.98,
             @0,
             @0.93,
             @1.31,
             @1.61,
             @1.9,
             @2.19,
             @2.58,
             @3.16,
             @0,
             @0.82,
             @1.0,
             @1.36,
             @1.54,
             @1.63,
             @1.66,
             @1.55,
             @1.83,
             @1.88,
             @1.91,
             @1.9,
             @1.65,
             @1.81,
             @2.01,
             @2.18,
             @2.55,
             @2.96,
             @0,
             @0.82,
             @0.95,
             @1.22,
             @1.33,
             @1.6,
             @2.16,
             @1.9,
             @2.2,
             @2.28,
             @2.2,
             @1.93,
             @1.69,
             @1.78,
             @1.96,
             @2.05,
             @2.1,
             @2.66,
             @0,
             @0.79,
             @0.89,
             @1.1,
             @1.12,
             @1.13,
             @1.14,
             @1.1,
             @1.17,
             @1.2,
             @1.2,
             @1.2,
             @0,
             @1.23,
             @1.24,
             @1.25,
             @1.1,
             @1.27,
             @1.3,
             @1.5,
             @2.3,
             @1.9,
             @2.2,
             @2.2,
             @2.28,
             @2.64,
             @2.0,
             @1.62,
             @1.8,
             @2.02,
             @2.3,
             @2.5,
             @0,
             @0.7,
             @0.9,
             @1.1,
             @1.3,
             @1.5,
             @1.38,
             @1.36,
             @1.28,
             @1.3,
             @1.3,
             @1.3,
             @1.3,
             @1.3,
             @1.3,
             @1.3,
             @1.3,
             @1.3,
             @0,
             @0,
             @0,
             @0,
             @0,
             @0,
             @0,
             @0,
             @0,
             nil];

		}
	}
	return values;
}

+ (NSArray*) period{
	static  NSArray* values;
	if(values == nil){
		@synchronized(values){
            values = [NSArray arrayWithObjects:
                      @0,
                      @1,
                      @1,
                      @2,
                      @2,
                      @2,
                      @2,
                      @2,
                      @2,
                      @2,
                      @2,
                      @3,
                      @3,
                      @3,
                      @3,
                      @3,
                      @3,
                      @3,
                      @3,
                      @4,
                      @4,
                      @4,
                      @4,
                      @4,
                      @4,
                      @4,
                      @4,
                      @4,
                      @4,
                      @4,
                      @4,
                      @4,
                      @4,
                      @4,
                      @4,
                      @4,
                      @4,
                      @5,
                      @5,
                      @5,
                      @5,
                      @5,
                      @5,
                      @5,
                      @5,
                      @5,
                      @5,
                      @5,
                      @5,
                      @5,
                      @5,
                      @5,
                      @5,
                      @5,
                      @5,
                      @6,
                      @6,
                      @6,
                      @6,
                      @6,
                      @6,
                      @6,
                      @6,
                      @6,
                      @6,
                      @6,
                      @6,
                      @6,
                      @6,
                      @6,
                      @6,
                      @6,
                      @6,
                      @6,
                      @6,
                      @6,
                      @6,
                      @6,
                      @6,
                      @6,
                      @6,
                      @6,
                      @6,
                      @6,
                      @6,
                      @6,
                      @6,
                      @7,
                      @7,
                      @7,
                      @7,
                      @7,
                      @7,
                      @7,
                      @7,
                      @7,
                      @7,
                      @7,
                      @7,
                      @7,
                      @7,
                      @7,
                      @7,
                      @7,
                      @7,
                      @7,
                      @7,
                      @7,
                      @7,
                      @7,
                      @7,
                      @7,
                      @7,
                      nil];

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
            values = [NSArray arrayWithObjects:
                      @0,
                      @53,
                      @31,
                      @155,
                      @112,
                      @83,
                      @91,
                      @92,
                      @60,
                      @39,
                      @38,
                      @190,
                      @160,
                      @143,
                      @132,
                      @128,
                      @127,
                      @73,
                      @71,
                      @235,
                      @197,
                      @162,
                      @147,
                      @134,
                      @130,
                      @135,
                      @126,
                      @125,
                      @124,
                      @128,
                      @138,
                      @122,
                      @122.5,
                      @139,
                      @140,
                      @85,
                      @88,
                      @248,
                      @215,
                      @178,
                      @160,
                      @146,
                      @139,
                      @136,
                      @134,
                      @134,
                      @137,
                      @144,
                      @154,
                      @163,
                      @162,
                      @159,
                      @160,
                      @104,
                      @108,
                      @267,
                      @222,
                      @187,
                      @181,
                      @182,
                      @182,
                      @182,
                      @181,
                      @199,
                      @179,
                      @180,
                      @180,
                      @179,
                      @178,
                      @177,
                      @194,
                      @175,
                      @167,
                      @149,
                      @141,
                      @137,
                      @135,
                      @136,
                      @139,
                      @144,
                      @157,
                      @171,
                      @175,
                      @170,
                      @176,
                      @145,
                      @214,
                      @180,
                      @223,
                      @188,
                      @180,
                      @161,
                      @138,
                      @130,
                      @162,
                      @173,
                      @299,
                      @297,
                      @295,
                      @292,
                      @290,
                      @287,
                      @285,
                      @282,
                      @0,
                      @0,
                      @0,
                      @128,
                      @0,
                      @0,
                      @0,
                      @0,
                      @0,
                      nil];

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
            values = [NSArray arrayWithObjects:
                      [NSArray arrayWithObjects: nil],
                      [NSArray arrayWithObjects:@"водород", @"водорода", @"водороду", @"водород", @"водородом", @"водороде", nil],
                      [NSArray arrayWithObjects:@"гелий", @"гелия", @"гелию", @"гелий", @"гелием", @"гелии", nil],
                      [NSArray arrayWithObjects:@"литий", @"лития", @"литию", @"литий", @"литием", @"литии", nil],
                      [NSArray arrayWithObjects:@"бериллий", @"бериллия", @"бериллию", @"бериллий", @"бериллием", @"бериллии", nil],
                      [NSArray arrayWithObjects:@"бор", @"бора", @"бору", @"бор", @"бором", @"боре", nil],
                      [NSArray arrayWithObjects:@"углерод", @"углерода", @"углероду", @"углерод", @"углеродом", @"углероде", nil],
                      [NSArray arrayWithObjects:@"азот", @"азота", @"азот", @"азот", @"азотом", @"азоте", nil],
                      [NSArray arrayWithObjects:@"кислород", @"кислорода", @"кислороду", @"кислород", @"кислородом", @"кислороде", nil],
                      [NSArray arrayWithObjects:@"фтор", @"фтора", @"фтору", @"фтор", @"фтором", @"фторе", nil],
                      [NSArray arrayWithObjects:@"неон", @"неона", @"неону", @"неон", @"неоном", @"неоне", nil],
                      [NSArray arrayWithObjects:@"натрий", @"натрия", @"натрию", @"натрий", @"натрием", @"натрии", nil],
                      [NSArray arrayWithObjects:@"магний", @"магния", @"магнию", @"магний", @"магнием", @"магнии", nil],
                      [NSArray arrayWithObjects:@"алюминий", @"алюминия", @"алюминию", @"алюминий", @"алюминием", @"алюминии", nil],
                      [NSArray arrayWithObjects:@"кремний", @"кремния", @"кремнию", @"кремний", @"кремнием", @"кремнии", nil],
                      [NSArray arrayWithObjects:@"фосфор", @"фосфора", @"фосфору", @"фосфор", @"фосфором", @"фосфоре", nil],
                      [NSArray arrayWithObjects:@"сера", @"серы", @"сере", @"серу", @"серой", @"сере", nil],
                      [NSArray arrayWithObjects:@"xлор", @"хлора", @"хлору", @"хлор", @"хлором", @"хлоре", nil],
                      [NSArray arrayWithObjects:@"аргон", @"аргона", @"аргону", @"аргон", @"аргоном", @"аргоне", nil],
                      [NSArray arrayWithObjects:@"калий", @"калия", @"калию", @"калий", @"калием", @"калии", nil],
                      [NSArray arrayWithObjects:@"кальций", @"кальция", @"кальцию", @"кальций", @"кальцием", @"кальции", nil],
                      [NSArray arrayWithObjects:@"скандий", @"скандия", @"скандию", @"скандий", @"скандием", @"скандии", nil],
                      [NSArray arrayWithObjects:@"титан", @"титана", @"титану", @"титан", @"титаном", @"титане", nil],
                      [NSArray arrayWithObjects:@"ванидий", @"ванадия", @"ванадию", @"ванадий", @"ванадием", @"ванадии", nil],
                      [NSArray arrayWithObjects:@"хром", @"хрома", @"хрому", @"хром", @"хромом", @"хроме", nil],
                      [NSArray arrayWithObjects:@"марганец", @"марганца", @"марганцу", @"марганец", @"марганцем", @"марганце", nil],
                      [NSArray arrayWithObjects:@"железо", @"железа", @"железу", @"железо", @"железом", @"железе", nil],
                      [NSArray arrayWithObjects:@"кобальт", @"кобальта", @"кобальту", @"кобальт", @"кобальтом", @"кобальте", nil],
                      [NSArray arrayWithObjects:@"никель", @"никеля", @"никелю", @"никель", @"никелем", @"никеле", nil],
                      [NSArray arrayWithObjects:@"медь", @"меди", @"меди", @"медь", @"медью", @"меди", nil],
                      [NSArray arrayWithObjects:@"цинк", @"цинка", @"цинку", @"цинк", @"цинком", @"цинке", nil],
                      [NSArray arrayWithObjects:@"галлий", @"галлия", @"галлию", @"галлий", @"галлием", @"галлии", nil],
                      [NSArray arrayWithObjects:@"германий", @"германия", @"германию", @"германий", @"германием", @"германии", nil],
                      [NSArray arrayWithObjects:@"мышьяк", @"мышьяка", @"мышьяку", @"мышьяк", @"мышьяком", @"мышьяке", nil],
                      [NSArray arrayWithObjects:@"селен", @"селена", @"селену", @"селен", @"селеном", @"селене", nil],
                      [NSArray arrayWithObjects:@"бром", @"брома", @"брому", @"бром", @"бромом", @"броме", nil],
                      [NSArray arrayWithObjects:@"криптон", @"криптона", @"критпону", @"криптон", @"криптоном", @"криптоне", nil],
                      [NSArray arrayWithObjects:@"рубидий", @"рубидия", @"рубидию", @"рубидий", @"рубидием", @"рубидии", nil],
                      [NSArray arrayWithObjects:@"стронций", @"стронция", @"стронцию", @"стронций", @"стронцием", @"стронции", nil],
                      [NSArray arrayWithObjects:@"иттрий", @"иттрия", @"иттрию", @"иттрий", @"иттрием", @"иттрии", nil],
                      [NSArray arrayWithObjects:@"цирконий", @"циркония", @"цирконию", @"цирконий", @"цирконием", @"цирконии", nil],
                      [NSArray arrayWithObjects:@"ниобий", @"ниобия", @"ниобию", @"ниобий", @"ниобием", @"ниобии", nil],
                      [NSArray arrayWithObjects:@"молибден", @"молибдена", @"молибдену", @"молибден", @"молибденом", @"молибдене", nil],
                      [NSArray arrayWithObjects:@"технеций", @"технеция", @"технецию", @"технеций", @"технецием", @"технеции", nil],
                      [NSArray arrayWithObjects:@"рутений", @"рутения", @"рутению", @"рутений", @"рутением", @"рутении", nil],
                      [NSArray arrayWithObjects:@"родий", @"родия", @"родию", @"родий", @"родием", @"родии", nil],
                      [NSArray arrayWithObjects:@"палладий", @"палладия", @"палладию", @"палладий", @"палладием", @"палладии", nil],
                      [NSArray arrayWithObjects:@"серебро", @"серебра", @"серебру", @"серебро", @"серебром", @"серебре", nil],
                      [NSArray arrayWithObjects:@"кадмий", @"кадмия", @"кадмию", @"кадмий", @"кадмием", @"кадмии", nil],
                      [NSArray arrayWithObjects:@"индий", @"индия", @"индию", @"индий", @"индием", @"индии", nil],
                      [NSArray arrayWithObjects:@"олово", @"олова", @"олову", @"олово", @"оловом", @"олове", nil],
                      [NSArray arrayWithObjects:@"сурьма", @"сурьмы", @"сурьме", @"сурьму", @"сурьмой", @"сурьме", nil],
                      [NSArray arrayWithObjects:@"теллур", @"теллура", @"теллуру", @"теллур", @"теллуром", @"теллуре", nil],
                      [NSArray arrayWithObjects:@"йод", @"йода", @"йоду", @"йод", @"йодом", @"йоде", nil],
                      [NSArray arrayWithObjects:@"ксенон", @"ксенона", @"ксенону", @"ксенон", @"ксеноном", @"ксеноне", nil],
                      [NSArray arrayWithObjects:@"цезий", @"цезия", @"цезию", @"цезий", @"цезием", @"цезии", nil],
                      [NSArray arrayWithObjects:@"барий", @"бария", @"барию", @"барий", @"барием", @"барии", nil],
                      [NSArray arrayWithObjects:@"лантан", @"лантана", @"лантану", @"лантан", @"лантаном", @"лантане", nil],
                      [NSArray arrayWithObjects:@"церий", @"церия", @"церию", @"церий", @"церием", @"церии", nil],
                      [NSArray arrayWithObjects:@"празеодим", @"празеодима", @"празеодиму", @"празеодим", @"празеодимом", @"празеодиме", nil],
                      [NSArray arrayWithObjects:@"неодим", @"неодима", @"неодиму", @"неодим", @"неодимом", @"неодиме", nil],
                      [NSArray arrayWithObjects:@"прометий", @"прометия", @"прометию", @"прометий", @"прометием", @"прометии", nil],
                      [NSArray arrayWithObjects:@"самарий", @"самария", @"самарию", @"самарий", @"самарием", @"самарии", nil],
                      [NSArray arrayWithObjects:@"европий", @"европия", @"европию", @"европий", @"европием", @"европии", nil],
                      [NSArray arrayWithObjects:@"гадолиний", @"гадолиния", @"гадолинию", @"гадолиний", @"гадолинием", @"гадолинии", nil],
                      [NSArray arrayWithObjects:@"тербий", @"тербия", @"тербию", @"тербий", @"тербием", @"тербии", nil],
                      [NSArray arrayWithObjects:@"диспрозий", @"диспрозия", @"диспрозию", @"диспрозий", @"диспрозием", @"диспрозии", nil],
                      [NSArray arrayWithObjects:@"гольмий", @"гольмия", @"гольмию", @"гольмий", @"гольмием", @"гольмии", nil],
                      [NSArray arrayWithObjects:@"эрбий", @"эрбия", @"эрбию", @"эрбий", @"эрбием", @"эрбии", nil],
                      [NSArray arrayWithObjects:@"тулий", @"тулия", @"тулию", @"тулий", @"тулием", @"тулии", nil],
                      [NSArray arrayWithObjects:@"иттербий", @"иттербия", @"иттербию", @"иттербий", @"иттербием", @"иттербии", nil],
                      [NSArray arrayWithObjects:@"лютеций", @"лютеция", @"лютецию", @"лютеций", @"лютецием", @"лютеции", nil],
                      [NSArray arrayWithObjects:@"гафний", @"гафния", @"гафнию", @"гафний", @"гафнием", @"гафнии", nil],
                      [NSArray arrayWithObjects:@"тантал", @"тантала", @"танталу", @"тантал", @"танталом", @"тантале", nil],
                      [NSArray arrayWithObjects:@"вольфрам", @"вольфрама", @"вольфраму", @"вольфрам", @"вольфрамом", @"вольфраме", nil],
                      [NSArray arrayWithObjects:@"рений", @"рении", @"рению", @"рений", @"рением", @"рении", nil],
                      [NSArray arrayWithObjects:@"осмий", @"осмия", @"осмию", @"осмий", @"осмием", @"осмии", nil],
                      [NSArray arrayWithObjects:@"иридий", @"иридия", @"иридию", @"иридий", @"иридием", @"иридии", nil],
                      [NSArray arrayWithObjects:@"платина", @"платины", @"платине", @"платину", @"платиной", @"платине", nil],
                      [NSArray arrayWithObjects:@"золото", @"золота", @"золоту", @"золото", @"золотом", @"золоте", nil],
                      [NSArray arrayWithObjects:@"ртуть", @"ртути", @"ртути", @"ртуть", @"ртутью", @"ртути", nil],
                      [NSArray arrayWithObjects:@"таллий", @"тиллия", @"тиллию", @"таллий", @"таллием", @"таллии", nil],
                      [NSArray arrayWithObjects:@"свинец", @"свинца", @"свинцу", @"свинец", @"свинцом", @"свинце", nil],
                      [NSArray arrayWithObjects:@"висмут", @"висмута", @"висмуту", @"висмут", @"висмутом", @"висмуте", nil],
                      [NSArray arrayWithObjects:@"полоний", @"полония", @"полонию", @"полоний", @"полонием", @"полонии", nil],
                      [NSArray arrayWithObjects:@"астат", @"астата", @"астату", @"астат", @"астатом", @"астате", nil],
                      [NSArray arrayWithObjects:@"радон", @"радона", @"радону", @"радон", @"радоном", @"радоне", nil],
                      [NSArray arrayWithObjects:@"франций", @"франция", @"францию", @"франций", @"францием", @"франции", nil],
                      [NSArray arrayWithObjects:@"радий", @"радия", @"радию", @"радий", @"радием", @"радии", nil],
                      [NSArray arrayWithObjects:@"актиний", @"актиния", @"актинию", @"актиний", @"актинием", @"актинии", nil],
                      [NSArray arrayWithObjects:@"торий", @"тория", @"торию", @"торий", @"торием", @"тории", nil],
                      [NSArray arrayWithObjects:@"протактиний", @"протактиния", @"протактинию", @"протактиний", @"протактинием", @"протактинии", nil],
                      [NSArray arrayWithObjects:@"уран", @"урана", @"урану", @"уран", @"ураном", @"уране", nil],
                      [NSArray arrayWithObjects:@"нептуний", @"нептуния", @"нептунию", @"нептуний", @"нептунием", @"нептунии", nil],
                      [NSArray arrayWithObjects:@"плутоний", @"плутония", @"плутонию", @"плутоний", @"плутонием", @"плутонии", nil],
                      [NSArray arrayWithObjects:@"америций", @"америция", @"америцию", @"америций", @"америцием", @"америции", nil],
                      [NSArray arrayWithObjects:@"кюрий", @"кюрия", @"кюрию", @"кюрий", @"кюрием", @"кюрии", nil],
                      [NSArray arrayWithObjects:@"берклий", @"берклия", @"берклию", @"берклий", @"берклием", @"берклии", nil],
                      [NSArray arrayWithObjects:@"калифорний", @"калифорния", @"калифорнию", @"калифорний", @"калифорнием", @"калифорнии", nil],
                      [NSArray arrayWithObjects:@"эйнштейний", @"эйнштейния", @"эйнштейнию", @"эйштейний", @"эйштейнием", @"эйштейнии", nil],
                      [NSArray arrayWithObjects:@"фермий", @"фермия", @"фермию", @"фермий", @"фермием", @"фермии", nil],
                      [NSArray arrayWithObjects:@"менделеевий", @"менделеевия", @"менделеевию", @"менделеевий", @"менделеевием", @"менделеевии", nil],
                      [NSArray arrayWithObjects:@"нобелий", @"нобелия", @"нобелию", @"нобелий", @"нобелием", @"нобелии", nil],
                      [NSArray arrayWithObjects:@"лоуренсий", @"лоуренсия", @"лоуренсию", @"лоуренсий", @"лоуренсием", @"лоуренсии", nil],
                      [NSArray arrayWithObjects:@"резерфордий", @"резерфордия", @"резерфордию", @"резерфордий", @"резерфордием", @"резерфордии", nil],
                      [NSArray arrayWithObjects:@"дубний", @"дубния", @"дубнию", @"дубний", @"дубнием", @"дубнии", nil],
                      [NSArray arrayWithObjects:@"сиборгий", @"сиборгия", @"сиборгию", @"сиборгий", @"сиборгием", @"сиборгии", nil],
                      [NSArray arrayWithObjects:@"борий", @"бория", @"борию", @"борий", @"борием", @"бории", nil],
                      [NSArray arrayWithObjects:@"хассий", @"хассия", @"хассию", @"хассий", @"хассием", @"хассии", nil],
                      [NSArray arrayWithObjects:@"мейтнерий", @"мейтнерия", @"мейтнерию", @"мейтнерий", @"мейтнерием", @"мейтнерии", nil],
                      [NSArray arrayWithObjects:@"дармштадтий", @"дармштадтия", @"дармштадтию", @"дармштадтий", @"дармштадтием", @"дармштадтии", nil],
                      [NSArray arrayWithObjects:@"рентгений", @"рентгения", @"рентгению", @"рентгений", @"рентгением", @"рентгении", nil],
                      [NSArray arrayWithObjects:@"коперниций", @"коперниция", @"коперницию", @"коперниций", @"коперницием", @"коперниции", nil],
                      nil];
		}
	}
	return values;
}
+ (NSArray*) outerLayerElectrons{
	static  NSArray* values;
	if(values == nil){
		@synchronized(values){
            values = [NSArray arrayWithObjects:
                      @"",
                      @"1s^1",
                      @"1s^2",
                      @"2s^1",
                      @"2s^2",
                      @"2s^2 2p^1",
                      @"2s^2 2p^2",
                      @"2s^2 2p^3",
                      @"2s^2 2p^4",
                      @"2s^2 2p^5",
                      @"2s^2 2p^6",
                      @"3s^1",
                      @"3s^2",
                      @"3s^2 3p^1",
                      @"3s^3 3p^2",
                      @"3s^2 3p^3",
                      @"3s^2 3p^4",
                      @"3s^2 3p^5",
                      @"3s^2 3p^6",
                      @"4s^1",
                      @"4s^2",
                      @"3d^1 4s^2",
                      @"3d^2 4s^2",
                      @"3d^3 4s^2",
                      @"3d^5 4s^1",
                      @"3d^5 4s^2",
                      @"3d^6 4s^2",
                      @"3d^7 4s^2",
                      @"3d^8 4s^2",
                      @"3d^10 4s^1",
                      @"3d^10 4s^2",
                      @"3d^10 4s^2 4p^1",
                      @"3d^10 4s^2 4p^2",
                      @"3d^10 4s^2 4p^3",
                      @"3d^10 4s^2 4p^4",
                      @"3d^10 4s^2 4s^5",
                      @"3d^10 4s^2 4p^6",
                      @"5s^1",
                      @"5s^2",
                      @"4d^1 5s^2",
                      @"4d^2 5s^2",
                      @"4d^4 5s^1",
                      @"4d^5 5s^1",
                      @"4d^6 5s^1",
                      @"4d^7 5s^1",
                      @"4d^8 5s^1",
                      @"4d^10",
                      @"4d^10 5s^1",
                      @"4d^10 5s^2",
                      @"4d^10 5s^2 5p^1",
                      @"4d^10 5s^2 5p^2",
                      @"4d^10 5s^2 5p^3",
                      @"4d^10 5s^2 5p^4",
                      @"4d^10 5s^2 5p^5",
                      @"4d^10 5s^2 5p^6",
                      @"6s^1",
                      @"6s^2",
                      @"5d^1 6s^2",
                      @"4f^1 5d^1 6s^2",
                      @"4f^3 6s^2",
                      @"4f^4 6s^2",
                      @"4f^5 6s^2",
                      @"4f^6 6s^2",
                      @"4f^7 6s^2",
                      @"4f^7 5d^1 6s^2",
                      @"4f^9 6s^2",
                      @"4f^10 6s^2",
                      @"4f^11 6s^2",
                      @"4f^12 6s^2",
                      @"4f^13 6s^2",
                      @"4f^14 6s^2",
                      @"4f^14 5d^1 6s^2",
                      @"4f^14 5d^2 6s^2",
                      @"4f^14 5d^3 6s^2",
                      @"4f^14 5d^4 6s^2",
                      @"4f^14 5d^5 6s^2",
                      @"4f^14 5d^6 6s^2",
                      @"4f^14 5d^7 6s^2",
                      @"4f^14 5d^9 6s^1",
                      @"4f^14 5d^10 6s^1",
                      @"4f^14 5d^10 6s^2",
                      @"4f^14 5d^10 6s^2 6p^1",
                      @"4f^14 5d^10 6s^2 6p^2",
                      @"4f^14 5d^10 6s^2 6p^3",
                      @"4f^14 5d^10 6s^2 6p^4",
                      @"4f^14 5d^10 6s^2 6p^5",
                      @"4f^14 5d^10 6s^2 6p^6",
                      @"7s^1",
                      @"7s^2",
                      @"6d^1 7s^2",
                      @"6d^2 7s^2",
                      @"5f^2 6d^1 7s^2",
                      @"5f^3 6d^1 7s^2",
                      @"5f^4 6d^1 7s^2",
                      @"5f^6 6d^0 7s^2",
                      @"5f^7 6d^0 7s^2",
                      @"5f^7 6d^1 7s^2",
                      @"5f^9 6d^0 7s^2",
                      @"5f^10 6d^0 7s^2",
                      @"5f^11 6d^0 7s^2",
                      @"5f^12 6d^0 7s^2",
                      @"5f^13 6d^0 7s^2",
                      @"5f^14 6d^0 7s^2",
                      @"5f^14 6d^1 7s^2",
                      @"5f^14 6d^2 7s^2",
                      @"5f^14 6d^3 7s^2",
                      @"5f^14 6d^0 7s^2",
                      @"5f^14 6d^5 7s^2",
                      @"5f^14 6d^6 7s^2",
                      @"5f^14 6d^0 7s^2",
                      @"",
                      @"5f^14 6d^10 7s^1",
                      @"5f^14 6d^10 7s^2",
                      nil];
		}
	}
	return values;
}

+ (NSDictionary*) oxidationNumberDeterminationPriority{
	static  NSDictionary* values;
	if(values == nil){
		@synchronized(values){
            values = @{
                       @9   :@100, //fluoride
                       @3   :@99,    //metals of 1a group
                       @11  :@98,
                       @19  :@97,
                       @37  :@96,
                       @55  :@95,
                       @87  :@94,

                       @4   :@93,//metals of 2a group
                       @12  :@92,
                       @20  :@91,
                       @38  :@90,
                       @56  :@89,
                       @88  :@88,

                       @13  :@87,//aluminium

                       @1   :@86,//hydrogen
                       @8   :@85//oxygen
                       


                       };
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


- (unsigned char) oxidationNumberDeterminationPriority {
    return [[[ChemAtom oxidationNumberDeterminationPriority] objectForKey:number] unsignedCharValue];
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
    for (NSNumber* possibleOxidationNumber in self.possibleOxidationNumbers)
    {
        if([possibleOxidationNumber charValue] == oxNum)
        {
            isOxidationNumberDetermined = YES;
            oxidationNumber = oxNum;
            return;
        }
    }
}
- (bool) isOxidationNumberDetermined {
    return isOxidationNumberDetermined;
}

- (bool) determineOxidationNumber:(ChemSubstance*) subst {
    if (isOxidationNumberDetermined) {
        return YES;
    }
    if ([subst.bruttoFormula count] == 1) {
        oxidationNumber = 0;
        isOxidationNumberDetermined = YES;
        return YES;
    }
    if(!subst.isComplex && [subst.bruttoFormula count] == 2) {
        unsigned char count = 0;
        ChemAtom* el0 = [subst.elements objectAtIndex:0];
        ChemAtom* el1 = [subst.elements objectAtIndex:1];
        ChemAtom* oxElement = (el0.electronegativity > el1.electronegativity) ? el0 : el1;
        if(oxElement == self)
        {
            char oxNumber = 0;
            for (NSNumber* possibleOxidationNumber in oxElement.possibleOxidationNumbers) {
                if ([possibleOxidationNumber charValue] < 0) {
                    count++;
                    oxNumber = [possibleOxidationNumber charValue];
                }
            }
            if(count == 1){
                oxidationNumber = oxNumber;
                isOxidationNumberDetermined = YES;
                return YES;
            }
        }
    }
    
    if ([self.number unsignedCharValue] == 9) { //fluoride
        isOxidationNumberDetermined = YES;
        oxidationNumber = -1;
        return YES;
    }
    if ([self.number unsignedCharValue] == 8) { //oxygen
        isOxidationNumberDetermined = YES;
        oxidationNumber = -2;
        return YES;
    }
    if ([self.number unsignedCharValue] == 13) { //Aluminium
        isOxidationNumberDetermined = YES;
        oxidationNumber = +3;
        return YES;
    }
    if ([self.number unsignedCharValue] != 1 &&
        [self.group unsignedCharValue] <= 2 &&
        [self.subgroup unsignedCharValue] == 1) {
        isOxidationNumberDetermined = YES;
        oxidationNumber = [self.group unsignedCharValue];
        return YES;
    }

    if ([self.number unsignedCharValue] == 1)
    {
        short oxNum = -1;
        ChemAtom* hydrogen = [[ChemAtom alloc] initWithNumber:[NSNumber numberWithUnsignedChar:1]];
        for (NSString* key in subst.bruttoFormula) {
            ChemAtom* atom = [ChemAtom createFromString:key];
            if(![atom isEqual:hydrogen] && atom.electronegativity >= hydrogen.electronegativity) {
                oxNum = 1;
                break;
            }
        }
        oxidationNumber = oxNum;
        isOxidationNumberDetermined = YES;
        return YES;
    }
	return NO;
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
