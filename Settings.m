//
//  Settings.m
//  SecretNumber
//
//  Created by Default on 2013-05-26.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "Settings.h"

@implementation Settings

@synthesize max;
@synthesize time;

static Settings *sharedInstance = nil;

+ (Settings *) sharedInstance {
    if(sharedInstance == nil) {
        sharedInstance = [[super allocWithZone:NULL] init];
    }
       return sharedInstance;      
       
}

- (id) init{
    
    self = [super init];
    if(self) {
        max = [NSNumber numberWithInteger:30];
        time = [NSNumber numberWithInteger:90];
        
    }
    return self;
}

+(id)allocWithZone:(NSZone *)zone{
    return [self sharedInstance];
}

-(id)copyWithZone:(NSZone *)zone {
    return self;
}

@end
