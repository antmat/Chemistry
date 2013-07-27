//
//  ChemSubstance.m
//  Chemistry
//
//  Created by Anton Matveenko on 21.07.13.
//  Copyright (c) 2013 Anton Matveenko. All rights reserved.
//

#import "ChemSubstance.h"

@implementation ChemSubstance
- (ChemSubstance*) initFromString:(NSString*) string {
	if (self = [super initFromString:string]) {
        isOxidationNumberDetermined = YES;
    }
    return self;
}
@end
