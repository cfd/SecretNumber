//
//  Settings.h
//  SecretNumber
//
//  Created by Default on 2013-05-26.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Settings : NSObject{
    
    NSNumber *max;
    NSNumber *time;

    
}

+ (id)sharedInstance;



@property(nonatomic, retain) NSNumber * max;
@property(nonatomic, retain) NSNumber * time;

@end
