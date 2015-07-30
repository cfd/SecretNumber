//
//  Card.m
//  SecretNumber
//
//  Created by Default on 2013-05-26.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "Card.h"

@implementation Card

@synthesize onCard;
@synthesize numbers;

-(id)init{
    self = [super init];
    if(self){
        numbers = [[NSMutableArray alloc] init];
    }
    return self;
}
    
-(void)addNumber:(NSNumber*) newNumber{
    [numbers addObject:newNumber];

}

-(NSMutableArray*)getNumbers{
    return numbers;
}

-(NSString*)toString{
    NSMutableString *string = [[NSMutableString alloc] init];
    for(NSNumber *num in numbers){
        [string appendFormat:@"%@ ", num];         
    }
    return string;  
}

-(void)printNumsOnCard{
    printf("nums on card = %d", [numbers count]);
    
}

@end
