//
//  ScoreSubmissionView.h
//  SecretNumber
//
//  Created by Default on 2013-05-30.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface ScoreSubmissionView : UIView{
    IBOutlet UITextField *nameBox;
    IBOutlet UIButton *submitButton;
    IBOutlet UILabel *label;
    IBOutlet UILabel *confirmLabel;
}


-(IBAction)keyboardFinished:(id)sender;


@property(nonatomic, retain) IBOutlet UILabel  * label;
@property(nonatomic, retain) IBOutlet UITextField  * nameBox;
@property(nonatomic, retain) IBOutlet UIButton  * submitButton;
@property(nonatomic, retain) IBOutlet UILabel * confirmLabel;

@end
