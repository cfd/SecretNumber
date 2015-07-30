//
//  PracticeModeUIViewController.m
//  SecretNumber
//
//  Created by Default on 2013-05-31.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "PracticeController.h"
#import "Card.h"

@implementation PracticeController


- (IBAction)backPressed:(id)sender {
    [self dismissViewControllerAnimated:YES completion:NULL];

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
    [chevronsImageView1 stopAnimating];
    [chevronsImageView2 stopAnimating];
    [chevronsImageView3 stopAnimating];
    [chevronsImageView4 stopAnimating];
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
    
    
    
    NSMutableArray *chevronImagesLeft = [[NSMutableArray alloc] initWithCapacity:2];
    
    UIImage *chevron1 = [UIImage imageNamed:@"black_chevrons_left.png"];
    UIImage *chevron2 = [UIImage imageNamed:@"red_chevrons_left.png"];
    
    [chevronImagesLeft addObject:chevron1];
    [chevronImagesLeft addObject:chevron2];
    
    chevronsImageView1.animationImages = chevronImagesLeft;    
    chevronsImageView1.animationDuration = 1;
    chevronsImageView1.animationRepeatCount = 0;
    [chevronsImageView1 startAnimating];
    
    chevronsImageView2.animationImages = chevronImagesLeft;    
    chevronsImageView2.animationDuration = 1;
    chevronsImageView2.animationRepeatCount = 0;
    [chevronsImageView2 startAnimating];
    
    
    
    
    NSMutableArray *chevronImagesRight = [[NSMutableArray alloc] initWithCapacity:2];
    
    UIImage *chevron3 = [UIImage imageNamed:@"black_chevrons_right.png"];
    UIImage *chevron4 = [UIImage imageNamed:@"red_chevrons_right.png"];
    
    [chevronImagesRight addObject:chevron3];
    [chevronImagesRight addObject:chevron4];
    
    chevronsImageView3.animationImages = chevronImagesRight;    
    chevronsImageView3.animationDuration = 1;
    chevronsImageView3.animationRepeatCount = 0;
    [chevronsImageView3 startAnimating];
    
    chevronsImageView4.animationImages = chevronImagesRight;    
    chevronsImageView4.animationDuration = 1;
    chevronsImageView4.animationRepeatCount = 0;
    [chevronsImageView4 startAnimating];
    
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
    
    
    
    
    
    UISwipeGestureRecognizer *swipe = [[UISwipeGestureRecognizer alloc] initWithTarget:backgroundView action:@selector(handleSwipeLeft:)];
    [backgroundView addGestureRecognizer:swipe];
    swipe.direction =UISwipeGestureRecognizerDirectionLeft;
    
    UISwipeGestureRecognizer *swipeBack = [[UISwipeGestureRecognizer alloc] initWithTarget:backgroundView action:@selector(handleSwipeRight:)];
    [backgroundView addGestureRecognizer:swipeBack];
    swipeBack.direction =UISwipeGestureRecognizerDirectionRight;
   
    

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


@end