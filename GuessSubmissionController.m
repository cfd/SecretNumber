//
//  GuessSubmittedViewController.m
//  SecretNumber
//
//  Created by Default on 2013-05-29.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "GuessSubmissionController.h"
#import "AppDelegate.h"
#import "Score.h"



@implementation GuessSubmissionController


-(void) viewDidDisappear:(BOOL)animated{
    [[NSNotificationCenter defaultCenter] removeObserver:backgroundView name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:backgroundView name:UIKeyboardWillHideNotification object:nil];
    [winMusic stop];
}

-(void)viewDidAppear:(BOOL)animated{
    [winMusic play];
    
    
}

-(void) viewDidLoad{
    

    AppDelegate* myApp = [UIApplication sharedApplication].delegate;
    context = myApp.managedObjectContext;
    

    
    
    NSString* path = [[NSBundle mainBundle]
                      pathForResource:@"win_sound"
                      ofType:@"mp3"];
    
    
    NSURL* fileURL = [[NSURL alloc] initFileURLWithPath:path];
    winMusic = [[AVAudioPlayer alloc] initWithContentsOfURL:fileURL error:nil];
    
    [winMusic prepareToPlay];
    winMusic.delegate = self;
    winMusic.numberOfLoops = -1;
    winMusic.volume = 0.2;

    
    
    [[NSNotificationCenter defaultCenter] addObserver:backgroundView selector:@selector(keyboardWillShow) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:backgroundView selector:@selector(keyboardWillHide) name:UIKeyboardWillHideNotification object:nil];
    
    UIColor *background = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"lightgreen_background.png"]];
    backgroundView.backgroundColor = background;
    
    
    printf("GUESS = %d | NUMBER = %d | SCORE = %0.2f", guess, appsNumber, score);
    
    if(guess == appsNumber){
        backgroundView.label.text = [NSString stringWithFormat:@"YOU WIN!\n\rTime: %0.2fsec\n\rEnter your name", score];
        [backgroundView.nameBox setHidden:NO];
        [backgroundView.submitButton setHidden:NO];
        
        titleBar.title = @"Congratulations!!!";
        

        
        
    }else{
        backgroundView.label.text = @"YOU LOSE!\n\rSorry, that was not my number";
        titleBar.title = @"Better luck next time...";
    }
    
    
}


-(void)setNumbersFromSegue:(int)guessFromSegue second:(int)numberFromSegue third:(double)scoreFromSegue{
    guess = guessFromSegue;
    appsNumber = numberFromSegue;
    score = scoreFromSegue;
}


-(IBAction)submitted:(id)sender{
    [backgroundView.nameBox setHidden:YES];
    [backgroundView.submitButton setHidden:YES];
    [backgroundView.confirmLabel setHidden:NO];
    

    
    CATransition* transition = [CATransition animation];
    transition.type = kCATransitionPush;
    transition.subtype = kCATransitionFromTop;
    [backgroundView.confirmLabel.layer addAnimation:transition forKey:@"push-transition"];
    
    
    
    Score* newScore = [NSEntityDescription insertNewObjectForEntityForName:@"Score" inManagedObjectContext:context];
    
    newScore.name = backgroundView.nameBox.text;
    newScore.score = [NSNumber numberWithDouble:score];
    

    NSError* error = nil;
    BOOL okay = [context save:&error];
    
    if (!okay) {
        printf("error: %s\n", [[error description] UTF8String]);
    }else{
        printf("ok :)");
    }
    

    
}




@end
