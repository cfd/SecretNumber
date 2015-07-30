//
//  SecretNumberUITableViewController.m
//  SecretNumber
//
//  Created by Default on 2013-05-25.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "SettingsController.h"

@implementation SettingsController


- (IBAction)backPressed:(id)sender {
    [self dismissViewControllerAnimated:YES completion:NULL];
}

-(void) viewDidDisappear:(BOOL)animated{
    [themeMusic stop];
}

-(void)viewDidAppear:(BOOL)animated{
    [themeMusic play];
}

- (void) viewDidLoad
{

    NSString* path = [[NSBundle mainBundle]
                      pathForResource:@"secret_number"
                      ofType:@"mp3"];
    

    
    NSURL* fileURL = [[NSURL alloc] initFileURLWithPath:path];
    themeMusic = [[AVAudioPlayer alloc] initWithContentsOfURL:fileURL error:nil];
    
    [themeMusic prepareToPlay];
    themeMusic.delegate = self;
    themeMusic.numberOfLoops = -1;
    
    UIColor *background = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"lightgreen_background.png"]];
    backgroundView.backgroundColor = background;

    
}


@end
