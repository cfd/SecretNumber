//
//  HighScoresTableViewController.h
//  SecretNumber
//
//  Created by Default on 2013-05-25.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVAudioPlayer.h>

@interface HighScoresController : UITableViewController <UITableViewDelegate, UITableViewDataSource, AVAudioPlayerDelegate, UIAlertViewDelegate>{
    
    IBOutlet UITableView *backgroundView;
    
    AVAudioPlayer* themeMusic;
    
    NSManagedObjectContext* context;
    NSArray* scores;
    
}

- (IBAction)backPressed:(id)sender;



@end
