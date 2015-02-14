//
//  ResultViewController.m
//  flap flies3
//
//  Created by 中山　貴仁 on 2015/01/31.
//  Copyright (c) 2015年 Nakayama Takahito. All rights reserved.
//

#import "ResultViewController.h"
#import "ViewController.h"

@interface ResultViewController ()

@end

@implementation ResultViewController

-(void)viewWillAppear:(BOOL)animated{
    
    timer = [NSTimer scheduledTimerWithTimeInterval:2.0
                                              target:self
                                            selector:@selector(onTime)
                                            userInfo:nil
                                             repeats:YES];
    
}

-(void)onTime{
    
    [UIView animateWithDuration:0.6
                          delay:0.0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         
                         scoreLabel.alpha = 0.0;
                         
                     }
                     completion:^(BOOL finishued){
                         
                         [UIView animateWithDuration:0.6
                                               delay:0.0
                                             options:UIViewAnimationOptionCurveEaseInOut
                                          animations:^{
                                              
                                              scoreLabel.alpha = 1.0;
                                              
                                          }
                                          completion:nil];
                         
                     }];
    
}

-(void)viewDidDisappear:(BOOL)animated{
    
    [timer isValid];
    //    button = nil;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIImage *background = [UIImage imageNamed:@"prairie.jpg"];
    self.view.backgroundColor = [UIColor colorWithPatternImage:background];

    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    float score = [defaults floatForKey:@"score"];
    
    scoreLabel.text = [NSString stringWithFormat:@"%.1f秒",score];
    
    float highScore = [defaults floatForKey:@"highScore"];
    
    highScoreLabel.text = [NSString stringWithFormat:@"%.1f秒",highScore];
    
    if (score > 59.9 && score <= 60.0) {
        
        scoreLabel.text = @"記録なし";
        
    }
    
    if (score == 0) {
        
        scoreLabel.text = @"You were killed";
        
        scoreLabel.textColor = [UIColor redColor];

        
        star1.hidden = YES;
        star2.hidden = YES;
        
    }
        
    //キラキラ
    star1.hidden = YES;
    star2.hidden = YES;
    
    if (score == highScore) {
        
        star1.hidden = NO;
        star2.hidden = NO;
        
    }
    
}

-(IBAction)retry:(id)sender{
    
    [audio play];
    
    [startSound play];

    
    GameViewController *GameView = [self.storyboard instantiateViewControllerWithIdentifier:@"Game"];
    GameView.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:GameView animated:YES completion:nil];

}

-(IBAction)end:(id)sender{
    
    [startSound play];

    
    ViewController *View = [self.storyboard instantiateViewControllerWithIdentifier:@"View"];
    View.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:View animated:YES completion:nil];
}

//ステータスバー
- (BOOL)prefersStatusBarHidden
{
    return YES;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
