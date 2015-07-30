//
//  SecretNumberUIViewController.m
//  SecretNumber
//
//  Created by Default on 2013-05-25.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "HomeController.h"

@implementation HomeController



- (void) viewDidUnload:(BOOL)animated{
    [logoImageView stopAnimating];
    [logoImageView2 stopAnimating];
    [logoImageView3 stopAnimating];
    [mascotImageView stopAnimating];
    [chevronsImageView2 stopAnimating];
    [chevronsImageView1 stopAnimating];
}

-(void)viewDidDisappear:(BOOL)animated{
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
    
    //NSLog(@"path: %@", path);
    
    NSURL* fileURL = [[NSURL alloc] initFileURLWithPath:path];
    themeMusic = [[AVAudioPlayer alloc] initWithContentsOfURL:fileURL error:nil];
    
    [themeMusic prepareToPlay];
    themeMusic.delegate = self;
    themeMusic.numberOfLoops = -1;
    

    
    
    //Create settings singleton
    //settings = [Settings sharedInstance];
    //printf("Max is = %d\n\r", [settings getMax]);
    //printf("Time is = %d\n\r", [settings getTime]);
    
    //[settings printSomeStuff];
    
    
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
    
    
    
    
    NSMutableArray *mascotImages = [[NSMutableArray alloc] initWithCapacity:3];
    
    UIImage *mascot1 = [UIImage imageNamed:@"mascotpose1.png"];
    UIImage *mascot2 = [UIImage imageNamed:@"mascotpose2.png"];
    UIImage *mascot3 = [UIImage imageNamed:@"mascotpose3.png"];
    
    [mascotImages addObject:mascot1];
    [mascotImages addObject:mascot2];
    [mascotImages addObject:mascot3];
    
    

    
    mascotImageView.animationImages = mascotImages;    
    mascotImageView.animationDuration = 1.5;
    mascotImageView.animationRepeatCount = 0;
    [mascotImageView startAnimating];
    
    

    NSMutableArray *chevronImages = [[NSMutableArray alloc] initWithCapacity:2];
    
    UIImage *chevron1 = [UIImage imageNamed:@"black_chevrons_up.png"];
    UIImage *chevron2 = [UIImage imageNamed:@"red_chevrons_up.png"];
    
    [chevronImages addObject:chevron1];
    [chevronImages addObject:chevron2];
    
    chevronsImageView1.animationImages = chevronImages;    
    chevronsImageView1.animationDuration = 1;
    chevronsImageView1.animationRepeatCount = 0;
    [chevronsImageView1 startAnimating];
    
    chevronsImageView2.animationImages = chevronImages;    
    chevronsImageView2.animationDuration = 1;
    chevronsImageView2.animationRepeatCount = 0;
    [chevronsImageView2 startAnimating];
    
    
    UIColor *background = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"lightgreen_background.png"]];
    backgroundView.backgroundColor = background;
    
    
    
    
    
    
}





@end
