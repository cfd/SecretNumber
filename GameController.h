//
//  PlayModeUIViewController.h
//  SecretNumber
//
//  Created by Default on 2013-05-26.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Settings.h"
#import "GameView.h"

#import <AVFoundation/AVAudioPlayer.h>


@interface GameController : UIViewController <AVAudioPlayerDelegate>{
    
    
    IBOutlet GameView *backgroundView;
    IBOutlet UIImageView *chevronsImageView1;
    IBOutlet UIImageView *chevronsImageView2;
    IBOutlet UIImageView *mascotAnimation;
    
    
    
    

    
    Settings *settings;
    
    NSMutableArray *cards;
    
    AVAudioPlayer* gameMusic;
    
    
}

    

- (IBAction)backPressed:(id)sender;


-(void)makeCards;




@end
