//
//  SecretNumberUITableViewController.h
//  SecretNumber
//
//  Created by Default on 2013-05-25.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVAudioPlayer.h>

@interface SettingsController : UITableViewController <AVAudioPlayerDelegate>{
    
    IBOutlet UITableView *backgroundView;
    
    AVAudioPlayer* themeMusic;
    
}
    
- (IBAction)backPressed:(id)sender;
    



@end
