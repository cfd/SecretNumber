//
//  GameRangeUIViewController.h
//  SecretNumber
//
//  Created by Default on 2013-05-26.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Settings.h"
#import <AVFoundation/AVAudioPlayer.h>

@interface GameSettingsController : UIViewController <AVAudioPlayerDelegate>{

    IBOutlet UIImageView *logoImageView;
    IBOutlet UIImageView *logoImageView2;
    IBOutlet UIImageView *logoImageView3;
    
    
    IBOutlet UISlider *slider;
    IBOutlet UILabel *label;
    
    
    IBOutlet UIView *backgroundView;
    
    Settings *settings;
    
    
    AVAudioPlayer* themeMusic;
    
}

- (void)updateLabel;


@end
