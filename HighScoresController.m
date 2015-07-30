//
//  HighScoresUITableViewController.m
//  SecretNumber
//
//  Created by Default on 2013-05-26.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "HighScoresController.h"
#import "AppDelegate.h"
#import "Score.h"

@implementation HighScoresController




- (IBAction)backPressed:(id)sender {
    [self dismissViewControllerAnimated:YES completion:NULL];
}

- (IBAction)resetPressed:(id)sender {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Warning" message:@"Are you sure you want to reset all high scores?" delegate:self cancelButtonTitle:@"No" otherButtonTitles:@"Yes", nil];
    [alert show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 0){
    }else if (buttonIndex == 1){
        for (Score* score in scores) {
            [context deleteObject:score];
            
            
        }
        
        NSError* error = nil;
        [context save:&error];
        
        [self dismissViewControllerAnimated:YES completion:NULL];
        

    }
}

-(void) viewDidDisappear:(BOOL)animated{
    [themeMusic stop];
}

-(void)viewDidAppear:(BOOL)animated{
    [themeMusic play];
    


    
}

- (void) viewDidLoad
{
    
    AppDelegate* myApp = [UIApplication sharedApplication].delegate;
    context = [myApp managedObjectContext];
    
    
    NSFetchRequest* request = [NSFetchRequest new];
    
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"score" ascending:YES];
    NSArray *sortDescriptors = [[NSArray alloc] initWithObjects:sortDescriptor, nil];
    [request setSortDescriptors:sortDescriptors];
    
    
    request.entity = [NSEntityDescription entityForName:@"Score" inManagedObjectContext:context];
    
    scores = [context executeFetchRequest:request error:NULL];
    

   
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


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return scores.count;
}



- (UITableViewCell *)tableView:(UITableView *)theTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    
    UITableViewCell* cell = [theTableView dequeueReusableCellWithIdentifier:@"score"];
    
    Score* score = [scores objectAtIndex:indexPath.row];
    
    cell.textLabel.text = score.name;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%0.2f seconds", [score.score doubleValue]];
    
    return cell;
}




@end
