//
//  PracticeModeUIViewController.h
//  SecretNumber
//
//  Created by Default on 2013-05-31.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Settings.h"
#import "PracticeView.h"
#import <AVFoundation/AVAudioPlayer.h>

@interface PracticeController : UIViewController<AVAudioPlayerDelegate>{
    
    
    IBOutlet PracticeView *backgroundView;
    IBOutlet UIImageView *chevronsImageView1;
    IBOutlet UIImageView *chevronsImageView2;
    IBOutlet UIImageView *chevronsImageView3;
    IBOutlet UIImageView *chevronsImageView4;
    IBOutlet UIImageView *mascotAnimation;
    

    
    Settings *settings;
    
    NSMutableArray *cards;
    
    AVAudioPlayer* gameMusic;
    
    
}



- (IBAction)backPressed:(id)sender;


-(void)makeCards;

@end
