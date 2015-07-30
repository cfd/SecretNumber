//
//  GameRangeUIViewController.m
//  SecretNumber
//
//  Created by Default on 2013-05-26.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "GameSettingsController.h"

@implementation GameSettingsController



- (IBAction)sliderMoving:(id)sender {
    
    
    [self updateLabel];
    


}


-(void) viewDidDisappear:(BOOL)animated{
    [themeMusic stop];
}

-(void)viewDidAppear:(BOOL)animated{
    [themeMusic play];
}


    




- (void) viewDidUnload:(BOOL)animated{
    [logoImageView stopAnimating];
    [logoImageView2 stopAnimating];
    [logoImageView3 stopAnimating];
}

- (void) viewDidLoad{
    
    NSString* path = [[NSBundle mainBundle]
                      pathForResource:@"secret_number"
                      ofType:@"mp3"];
    
    //NSLog(@"path: %@", path);
    
    NSURL* fileURL = [[NSURL alloc] initFileURLWithPath:path];
    themeMusic = [[AVAudioPlayer alloc] initWithContentsOfURL:fileURL error:nil];
    
    [themeMusic prepareToPlay];
    themeMusic.delegate = self;
    themeMusic.numberOfLoops = -1;
    
    
    
    settings = [Settings sharedInstance];
    //printf("Max is = %d\n\r", [settings getMax]);
    //printf("Time is = %d\n\r", [settings getTime]);
    
    
    //printf("tag is: %d", slider.tag);
    
    if(slider.tag == 1){
        [slider setValue:[settings.max intValue]];
    } else if (slider.tag == 2){
        [slider setValue:[settings.time intValue]];
    }
    
    
    

    [self updateLabel];
    
    UIColor *background = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"lightgreen_background.png"]];
    backgroundView.backgroundColor = background;
    
    
    
    
    NSMutableArray *images = [[NSMutableArray alloc] initWithCapacity:3];
    
    UIImage *frame = [UIImage imageNamed:@"yellow_logo.png"];
    UIImage *frame2 = [UIImage imageNamed:@"blue_logo.png"];
    UIImage *frame3 = [UIImage imageNamed:@"red_logo.png"];
    
    [images addObject:frame];
    [images addObject:frame2];
    [images addObject:frame3];
    
    
    
    
    logoImageView.animationImages = images;
    logoImageView.animationDuration = 1;
    logoImageView.animationRepeatCount = 0;
    [logoImageView startAnimating];
    
    
    
    logoImageView2.animationImages = images;
    logoImageView2.animationDuration = 1;
    logoImageView2.animationRepeatCount = 0;
    [logoImageView2 startAnimating];
    
    logoImageView3.animationImages = images;
    logoImageView3.animationDuration = 1;
    logoImageView3.animationRepeatCount = 0;
    [logoImageView3 startAnimating];
    
    
}


- (void) updateLabel{
    
    label.text = [NSString stringWithFormat:@"%0.0f", slider.value];
    //double dollarAmount = [dollarAmountString doubleValue];
    //float lol = slider.value;
    //int param = [lol intValue];
    
    
    
    
    if(slider.tag == 1){
        [settings setMax:[NSNumber numberWithInteger:[label.text intValue]]];
    } else if (slider.tag == 2){
        [settings setTime:[NSNumber numberWithInteger:[label.text intValue]]];
    }
    
}



@end
