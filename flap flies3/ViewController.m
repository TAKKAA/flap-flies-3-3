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

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    float highScore = [defaults floatForKey:@"highScore"];
    
    highScoreLabel.text = [NSString stringWithFormat:@"%.1f秒",highScore];
    
    
    float angle = 300;
    float rad = angle * M_PI / 180;
    fly2.transform = CGAffineTransformMakeRotation(rad);
    
}

//ステータスバー
- (BOOL)prefersStatusBarHidden
{
    return YES;
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
