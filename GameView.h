//
//  GameView.h
//  SecretNumber
//
//  Created by Default on 2013-05-27.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Settings.h"
#import <AudioToolBox/AudioToolbox.h>
#import <QuartzCore/QuartzCore.h>

@interface GameView : UIView{
    NSArray *cards;
    int currentCardIndex;
    int appsNumber;
    BOOL gameOver;
    
    IBOutlet UIProgressView *progress;
    
    IBOutlet UIButton *guessButton;
    IBOutlet UITextField *guessBox;
    IBOutlet UILabel *indicatorLabel;
    IBOutlet UILabel *numbersLabel;
    IBOutlet UILabel *speech;
    IBOutlet UILabel *timeLabel;
    
    SystemSoundID swipeSoundID;
    
    
    NSTimer *scoreTimer;
    double time;    
    Settings *settings;
    
}





-(void)setArrays:(NSArray*)array;
-(void)updateLabel;
-(void)promptForGuess;
-(int)getAppsNumber;
-(void)stopTimer;
-(double)calculateScore;


@property(nonatomic, retain) IBOutlet UIButton * guessButton;
@property(nonatomic, retain) IBOutlet UITextField * guessBox;
@end
