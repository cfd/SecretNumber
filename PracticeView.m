//
//  PracticeView.m
//  SecretNumber
//
//  Created by Default on 2013-05-31.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "PracticeView.h"
#import "Card.h"

@implementation PracticeView



-(IBAction)handleSwipeLeft:(UISwipeGestureRecognizer *)recognizer{

    if(currentCardIndex <[cards count]-1){
            
        CATransition* transition = [CATransition animation];
        transition.type = kCATransitionPush;
        transition.subtype = kCATransitionFromRight;
        [numbersLabel.layer addAnimation:transition forKey:@"push-transition"];
            
        AudioServicesPlaySystemSound(swipeSoundID);
            
        currentCardIndex+=1;
            
        [self updateLabel];

    }
}


-(IBAction)handleSwipeRight:(UISwipeGestureRecognizer *)recognizer{
    
    if(currentCardIndex >0){
        
        CATransition* transition = [CATransition animation];
        transition.type = kCATransitionPush;
        transition.subtype = kCATransitionFromLeft;
        [numbersLabel.layer addAnimation:transition forKey:@"push-transition"];
        
        AudioServicesPlaySystemSound(swipeSoundID);
        
        currentCardIndex-=1;
        
        [self updateLabel];
        
    }
}

-(void)setArrays:(NSArray*) array{
    

    cards = array;

    
    
    UIColor *background = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"card.png"]];
    numbersLabel.backgroundColor = background;
    
    
    
    NSBundle* bundle = [NSBundle mainBundle];
    NSString* path = [bundle pathForResource:@"card_swipe" ofType:@"wav"];
    
        
    CFURLRef ref = (__bridge CFURLRef)[NSURL fileURLWithPath:path];
    
    AudioServicesCreateSystemSoundID(ref, & swipeSoundID);

    currentCardIndex = 0; 
    settings = [Settings sharedInstance];
    
    [self updateLabel];
    
}


-(void)updateLabel{
    numbersLabel.text = [[cards objectAtIndex:currentCardIndex] toString];
}


@end
