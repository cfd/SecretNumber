//
//  PlayModeUIViewController.m
//  SecretNumber
//
//  Created by Default on 2013-05-26.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "GameController.h"
#import "Card.h"
#import "GuessSubmissionController.h"

@implementation GameController

- (IBAction)backPressed:(id)sender {
    [self dismissViewControllerAnimated:YES completion:NULL];
    [backgroundView stopTimer];

}





- (void) viewDidDisappear:(BOOL)animated{
    [[NSNotificationCenter defaultCenter] removeObserver:backgroundView name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:backgroundView name:UIKeyboardWillHideNotification object:nil];
    
    [gameMusic stop];
    

}

-(void)viewDidAppear:(BOOL)animated{
    [gameMusic play];
}


- (void) viewDidUnload:(BOOL)animated{
    [chevronsImageView2 stopAnimating];
    [chevronsImageView1 stopAnimating];
    [mascotAnimation stopAnimating];
}

- (void) viewDidLoad
{
    
    NSString* path = [[NSBundle mainBundle]
                      pathForResource:@"action_music"
                      ofType:@"mp3"];
    
     
    NSURL* fileURL = [[NSURL alloc] initFileURLWithPath:path];
    gameMusic = [[AVAudioPlayer alloc] initWithContentsOfURL:fileURL error:nil];
    
    [gameMusic prepareToPlay];
    gameMusic.delegate = self;
    gameMusic.numberOfLoops = -1;
    gameMusic.volume = 0.2;
    
    
        
    NSMutableArray *chevronImages = [[NSMutableArray alloc] initWithCapacity:2];
    
    UIImage *chevron1 = [UIImage imageNamed:@"black_chevrons_right.png"];
    UIImage *chevron2 = [UIImage imageNamed:@"red_chevrons_right.png"];
    
    [chevronImages addObject:chevron1];
    [chevronImages addObject:chevron2];
    
    chevronsImageView1.animationImages = chevronImages;    
    chevronsImageView1.animationDuration = 1;
    chevronsImageView1.animationRepeatCount = 0;
    [chevronsImageView1 startAnimating];
    
    chevronsImageView2.animationImages = chevronImages;    
    chevronsImageView2.animationDuration = 1;
    chevronsImageView2.animationRepeatCount = 0;
    [chevronsImageView2 startAnimating];
    
    NSMutableArray *mascotImages = [[NSMutableArray alloc] initWithCapacity:3];
    
    UIImage *mascot1 = [UIImage imageNamed:@"mascotpose1.png"];
    UIImage *mascot2 = [UIImage imageNamed:@"mascotpose2.png"];
    UIImage *mascot3 = [UIImage imageNamed:@"mascotpose3.png"];
    
    [mascotImages addObject:mascot1];
    [mascotImages addObject:mascot2];
    [mascotImages addObject:mascot3];
    
    
    
    
    mascotAnimation.animationImages = mascotImages;    
    mascotAnimation.animationDuration = 1.5;
    mascotAnimation.animationRepeatCount = 0;
    [mascotAnimation startAnimating];


    
    
    [[NSNotificationCenter defaultCenter] addObserver:backgroundView selector:@selector(keyboardWillShow) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:backgroundView selector:@selector(keyboardWillHide) name:UIKeyboardWillHideNotification object:nil];
    
    UISwipeGestureRecognizer *swipe = [[UISwipeGestureRecognizer alloc] initWithTarget:backgroundView action:@selector(handleSwipeFrom:)];
    [backgroundView addGestureRecognizer:swipe];
    swipe.direction =UISwipeGestureRecognizerDirectionLeft;
    
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:backgroundView action:@selector(keyboardFinished:)];
    [tap setCancelsTouchesInView:NO];
    [backgroundView addGestureRecognizer:tap];
    
    

    cards = [[NSMutableArray alloc] init];
    
    
    UIColor *background = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"lightgreen_background.png"]];
    backgroundView.backgroundColor = background;
    
    
    [self makeCards];
    
    [backgroundView setArrays:cards];
    

}

-(void) makeCards{
    
    settings = [Settings sharedInstance];
    
   
    
    NSArray *cardSequence = [NSArray arrayWithObjects:[NSNumber numberWithInteger:1], [NSNumber numberWithInteger:2], [NSNumber numberWithInteger:4], [NSNumber numberWithInteger:8], [NSNumber numberWithInteger:16], [NSNumber numberWithInteger:32], nil];
    
    
    NSArray *magicNumbers = [NSArray alloc];
    
    if([settings.max intValue]<=32){
        int index = 0;
        for(int i = 0; i <= 5; i++){
        
            if([[cardSequence objectAtIndex:i] intValue] > [settings.max intValue]){
                magicNumbers = [cardSequence subarrayWithRange:NSMakeRange(0, i)];
                break;
            
            }        
            ++index;
        }
    }else{
        magicNumbers = cardSequence;
    }
    


    

    for(int i = 0; i <= [magicNumbers count]-1; i++){
        Card *card = [[Card alloc] init];
        [cards addObject:card];
    }

    
    
    
    for(int numToPlace=1;numToPlace<=[settings.max intValue]; ++numToPlace){
        int remaining = numToPlace;
        int index = 1;
        while (remaining > 0){
            if([[magicNumbers objectAtIndex:[magicNumbers count]-index] intValue] <= remaining){
                remaining -= [[magicNumbers objectAtIndex:[magicNumbers count]-index] intValue];
                [[cards objectAtIndex:[cards count]-index] addNumber:[NSNumber numberWithInteger:numToPlace]];
                
            }
            ++index;
        }
        index=1;
    }
     
 
    
    
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    [[segue destinationViewController] setNumbersFromSegue:[backgroundView.guessBox.text intValue] second:[backgroundView getAppsNumber] third:[backgroundView calculateScore]];
}




@end