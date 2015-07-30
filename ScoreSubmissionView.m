//
//  ScoreSubmissionView.m
//  SecretNumber
//
//  Created by Default on 2013-05-30.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "ScoreSubmissionView.h"

@implementation ScoreSubmissionView
@synthesize label;
@synthesize nameBox;
@synthesize submitButton;
@synthesize confirmLabel;



-(IBAction)keyboardFinished:(id)sender{
    [nameBox resignFirstResponder];
    
    
}

-(void)keyboardWillShow{
    [UIView animateWithDuration:0.3f animations:^{
        self.frame = CGRectMake(0, -100, 320, 480);

    }];
}

-(void)keyboardWillHide{
    [UIView animateWithDuration:0.3f animations:^{
        self.frame = CGRectMake(0, 20, 320, 480);
        
        
    }];
}




@end
