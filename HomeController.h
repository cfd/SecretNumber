//
//  SecretNumberUIViewController.h
//  SecretNumber
//
//  Created by Default on 2013-05-25.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVAudioPlayer.h>
#import "Settings.h"

@interface HomeController: UIViewController <AVAudioPlayerDelegate>{
    
    IBOutlet UIImageView *logoImageView;
    IBOutlet UIImageView *logoImageView2;
    IBOutlet UIImageView *logoImageView3;
    IBOutlet UIImageView *mascotImageView;
    IBOutlet UIImageView *chevronsImageView1;
    IBOutlet UIImageView *chevronsImageView2;
    IBOutlet UIView *backgroundView;
    
    
    Settings *settings;
    
    AVAudioPlayer* themeMusic;
    
    
}

@end
