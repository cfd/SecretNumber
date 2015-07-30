//
//  GuessSubmittedViewController.h
//  SecretNumber
//
//  Created by Default on 2013-05-29.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ScoreSubmissionView.h"
#import <AVFoundation/AVAudioPlayer.h>


@interface GuessSubmissionController : UIViewController <AVAudioPlayerDelegate>{


    IBOutlet ScoreSubmissionView *backgroundView;
    
    IBOutlet UINavigationItem *titleBar;
    NSManagedObjectContext* context;

    
    int guess;
    int appsNumber;
    double score;
    
    AVAudioPlayer* winMusic;
    

}





-(void)setNumbersFromSegue:(int)guessFromSegue second:(int)numberFromSegue third:(double)scoreFromSegue;
-(IBAction)submitted:(id)sender;


@end
