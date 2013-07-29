//
//  ChemIon.m
//  Chemistry
//
//  Created by Anton Matveenko on 21.07.13.
//  Copyright (c) 2013 Anton Matveenko. All rights reserved.
//

#import "ChemIon.h"

@implementation ChemIon
static bool fillingKnownIons = false;
+ (NSDictionary*) knownIons {
    static  NSDictionary* values;
    if(values == nil){
        @synchronized(values){
            fillingKnownIons = true;
            values = [[NSDictionary alloc] initWithObjectsAndKeys:
                      [[ChemIon alloc] initFromString:@"NH4" withCharge:1],
                      @"NH4",
                      [[ChemIon alloc] initFromString:@"SCN" withCharge:-1 withAtomCharges:@[ @-2, @4, @-3]],
                      @"SCN",
                      nil];
            fillingKnownIons = false;
        }
    }
    return values;
}

- (ChemIon*)initFromString:(NSString*) string {
    if(!fillingKnownIons) {
		ChemIon* instance = [[ChemIon knownIons] objectForKey:string];
	    if (instance != nil) {
    	    self = instance;
        	return self;
    	}
    }
    return [super initFromString:string];
}

-(ChemAtomGroup*)initFromString:string withCharge:(char)newCharge withAtomCharges:(NSArray*)newAtomCharges {
    if (self = [super initFromString:string withCharge:newCharge]) {
        if ([elements count] != [newAtomCharges count]) {
            return nil;
        }
        unsigned char index = 0;
        for (id<ChemData> element in elements) {
            element.oxidationNumber = [[newAtomCharges objectAtIndex:index ] charValue];
            index++;
        }
    }
    return self;
}
+ (ChemIon*)getKnownIon:(NSString*) ion {
    return [[ChemIon knownIons] objectForKey:ion];
}

@end
