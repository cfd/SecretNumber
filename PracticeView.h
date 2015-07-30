//
//  PracticeView.h
//  SecretNumber
//
//  Created by Default on 2013-05-31.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Settings.h"
#import <AudioToolBox/AudioToolbox.h>
#import <QuartzCore/QuartzCore.h>

@interface PracticeView : UIView{
    NSArray *cards;
    int currentCardIndex;

    IBOutlet UILabel *numbersLabel;

    
    SystemSoundID swipeSoundID;
   
    Settings *settings;
    
}





-(void)setArrays:(NSArray*)array;
-(void)updateLabel;
@end
