//
//  GameView.m
//  SecretNumber
//
//  Created by Default on 2013-05-27.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "GameView.h"
#import "Card.h"

@implementation GameView

@synthesize guessButton;
@synthesize guessBox;



-(IBAction)handleSwipeFrom:(UISwipeGestureRecognizer *)recognizer{
    if(!gameOver){
        
        CATransition* transition = [CATransition animation];
        transition.type = kCATransitionPush;
        transition.subtype = kCATransitionFromRight;
        [numbersLabel.layer addAnimation:transition forKey:@"push-transition"];
        AudioServicesPlaySystemSound(swipeSoundID);
    
        if(currentCardIndex <[cards count]-1){
            currentCardIndex+=1;
            
            [self updateLabel];
        
        
        } else if (currentCardIndex == [cards count]-1){
            [self promptForGuess];
            
            gameOver = YES;
        }
    }
    
}

-(double)calculateScore{
    double score = [settings.time intValue] - time/100;
    return score;
}

-(void)stopTimer{
    [scoreTimer invalidate];
    scoreTimer = nil;   
}


-(void)keyboardFinished:(id)sender{
    [guessBox resignFirstResponder];
    
    
}


-(void)keyboardWillShow{
    [UIView animateWithDuration:0.3f animations:^{
        //self.frame = CGRectMake(0, 20, 320, 264);
        self.frame = CGRectMake(0, -100, 320, 480);
    }];
}

-(void)keyboardWillHide{
    [UIView animateWithDuration:0.3f animations:^{
        self.frame = CGRectMake(0, 20, 320, 480);
        
        
    }];
}



-(void)timerTick{
    time-=1;
    
    
    
    float decreaseAmount = 1/([settings.time intValue]/0.01);
    
    progress.progress -=  decreaseAmount;
    timeLabel.text = [NSString stringWithFormat:@"Time: %0.2f", time/100];
    
    
    if(time <= 0){
        [self stopTimer];
        [indicatorLabel setHidden:YES];
        [speech setHidden:YES];
        
        
        CATransition* transition = [CATransition animation];
        transition.type = kCATransitionPush;
        transition.subtype = kCATransitionFromRight;
        [numbersLabel.layer addAnimation:transition forKey:@"push-transition"];
        
        
        numbersLabel.text = @"Out Of Time!";
        progress.progress = 0;
        gameOver = YES;
        
        
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

    [guessButton setHidden:YES];
    [guessBox setHidden:YES];
    currentCardIndex = 0; 
    settings = [Settings sharedInstance];
    time = [settings.time intValue] * 100;
    timeLabel.text = [NSString stringWithFormat:@"Time: %0.2f", time/100];
    appsNumber = (arc4random() % [settings.max intValue] + 1);

    scoreTimer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(timerTick) userInfo:nil repeats:YES];

    
    for(Card *card in cards){
        for(NSNumber *num in [card getNumbers]){
            if([num intValue] == appsNumber){
                card.onCard=YES;
            }
        }
    }
    [self updateLabel];
}

-(void)updateLabel{
    numbersLabel.text = [[cards objectAtIndex:currentCardIndex] toString];
    if(((Card*)[cards objectAtIndex:currentCardIndex]).onCard == YES){
        
        CATransition* transition = [CATransition animation];
        transition.type = kCATransitionFade;
        transition.duration = 0.3;
        [indicatorLabel.layer addAnimation:transition forKey:@"push-transition"];
        
        UIColor *yesCard = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"yesCard.png"]];
        indicatorLabel.backgroundColor = yesCard;
        
        indicatorLabel.text = @"YES";
        
    } else if(((Card*)[cards objectAtIndex:currentCardIndex]).onCard == NO){
        
        CATransition* transition = [CATransition animation];
        transition.type = kCATransitionFade;
        transition.duration = 0.3;
        [indicatorLabel.layer addAnimation:transition forKey:@"push-transition"];
        
        UIColor *noCard = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"noCard.png"]];
        indicatorLabel.backgroundColor = noCard;
        
        indicatorLabel.text = @"NO";
    } 
    
}

-(void)promptForGuess{
    
    [self stopTimer];
    [guessButton setHidden:NO];
    [guessBox setHidden:NO];
    [indicatorLabel setHidden:YES];
    [speech setHidden:YES];
    numbersLabel.text = @"Enter Your Guess!";
    
    
}


-(int)getAppsNumber{
    return appsNumber;
}


@end
