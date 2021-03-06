//
//  ViewController.m
//  flap flies3
//
//  Created by 中山　貴仁 on 2015/01/26.
//  Copyright (c) 2015年 Nakayama Takahito. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

-(void)viewWillAppear:(BOOL)animated{
    
    button = [NSTimer scheduledTimerWithTimeInterval:2.0
                                              target:self
                                            selector:@selector(onTime)
                                            userInfo:nil
                                             repeats:YES];
    
}

-(void)onTime{
    
    [UIView animateWithDuration:0.5
                          delay:0.0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         
                         start.alpha = 0.0;
                         
                     }
                     completion:^(BOOL finishued){
                         
    [UIView animateWithDuration:0.3
                          delay:0.0
                          options:UIViewAnimationOptionCurveEaseInOut
                          animations:^{
                                              
                         start.alpha = 1.0;
                                              
                                          }
                        completion:nil];
                         
                     }];
    
}

-(void)viewDidDisappear:(BOOL)animated{
    
    [button isValid];
//    button = nil;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIImage *background = [UIImage imageNamed:@"prairie.jpg"];
    self.view.backgroundColor = [UIColor colorWithPatternImage:background];
    
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    float highScore = [defaults floatForKey:@"highScore"];
    
    highScoreLabel.text = [NSString stringWithFormat:@"%.1f秒",highScore];
    
    
    float angle = 300;
    float rad = angle * M_PI / 180;
    fly2.transform = CGAffineTransformMakeRotation(rad);
//    fly2.frame = CGRectMake(212, 163, 400, 400);
    
    if (highScore == 0.0) {
        
        highScoreLabel.text = @"記録なし";
    }
    
}

//ステータスバー
- (BOOL)prefersStatusBarHidden
{
    return YES;
}

-(IBAction)start:(id)sender{
    
    GameViewController *GameView = [self.storyboard instantiateViewControllerWithIdentifier:@"Game"];
    GameView.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:GameView animated:YES completion:nil];
    
    
    NSString *path1 = [[NSBundle mainBundle] pathForResource:@"button5" ofType:@"mp3"];
    NSURL *url1 = [NSURL fileURLWithPath:path1];
    startSound = [[AVAudioPlayer alloc] initWithContentsOfURL:url1 error:nil];
    [startSound play];
    
    
    
//    NSString *path2 = [[NSBundle mainBundle] pathForResource:@"fly1" ofType:@"mp3"];
//    NSURL *url2 = [NSURL fileURLWithPath:path2];
//    audio = [[AVAudioPlayer alloc] initWithContentsOfURL:url2 error:nil];
//    [audio prepareToPlay];
//    [audio setNumberOfLoops:-1];
//    [audio play];
//    
}


-(IBAction)reset:(id)sender{
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    [defaults removeObjectForKey:@"highScore"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
