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
                      
                      nil];
            fillingKnownIons = false;
        }
    }
    return values;
}

- (ChemIon*)initFromString:(NSString*) string {
    if(!fillingKnownIons)
    {
		ChemIon* instance = [[ChemIon knownIons] objectForKey:string];
	    if (instance != nil) {
    	    self = instance;
        	return self;
    	}
    }
    return [super initFromString:string];
}

@end
