//
//  Card.h
//  SecretNumber
//
//  Created by Default on 2013-05-26.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject{
    
    Boolean onCard;
    NSMutableArray* numbers;  
    
}

-(void)addNumber:(NSNumber*) newNumber;
-(NSMutableArray*)getNumbers;
-(NSString*)toString;


-(void)printNumsOnCard;


@property(nonatomic, retain) NSMutableArray * numbers;
@property(nonatomic) Boolean onCard;
@end
