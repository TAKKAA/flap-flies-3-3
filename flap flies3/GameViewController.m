//
//  GameViewController.m
//  flap flies3
//
//  Created by 中山　貴仁 on 2015/01/26.
//  Copyright (c) 2015年 Nakayama Takahito. All rights reserved.
//

#import "GameViewController.h"

@interface GameViewController ()

@end

@implementation GameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIImage *background = [UIImage imageNamed:@"prairie.jpg"];
    self.view.backgroundColor = [UIColor colorWithPatternImage:background];
    
    number = 0;
    
    
    //カウントダウン
    countdownTimer = [NSTimer scheduledTimerWithTimeInterval:1
                                                      target:self
                                                    selector:@selector(countDown)
                                                    userInfo:nil
                                                     repeats:YES];
    countdown = 6;
    [countdownTimer fire];
    
    //アニメーション、秒数のタイマー
    timer = [NSTimer scheduledTimerWithTimeInterval:0.1
                                             target:self
                                           selector:@selector(count)
                                           userInfo:nil
                                            repeats:YES];
    
    count = -5.9;
    [timer fire];
    
    
    [self display];
    
    //効果音
    //    NSString *path = [[NSBundle mainBundle] pathForResource:@"fly1" ofType:@"mp3"];
    //    NSURL *url = [NSURL fileURLWithPath:path];
    //    audio = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    //    [audio prepareToPlay];
    //    [audio setNumberOfLoops:-1];
    //    [audio play];
    
    
    for (int i = 0; i<15; i++) {
        
        //位置
        x[i] = arc4random() % 261 + 20;
        y[i] = arc4random() % 529 + 20;
        
        //スピード
        speedX[i] = arc4random() % 15 + 15;
        speedY[i] = arc4random() % 15 + 15;
        
        //初期角度
        angles[i] = arc4random() % 360;
        //初期角度（π）
        rad[i] =(angles[i] * M_PI / 180);
        
        //実際に進む距離
        vx[i] = cos(rad[i]) * speedX[i];
        vy[i] = sin(rad[i]) * speedY[i];
        
    }
    
    [self makeFly];
    
}


//ステータスバー
- (BOOL)prefersStatusBarHidden
{
    return YES;
}

//画面初期設定
-(void)display{
    
    countdownLabel.hidden = NO;
    
    timeLabel.hidden = YES;
    
    gameOverLabel.hidden = YES;
    
    backGround.hidden = YES;
    
    killLabel.hidden = YES;
    
}

-(void)makeFly{
    
    for (int i = 0; i < 15; i++) {
        
        if (i < 10) {
            
            flyNumber[i] = [UIImage imageNamed:@"fly1.png"];
            flies[i] = [[UIImageView alloc] initWithImage:flyNumber[i]];
            flies[i].tag = i;
            flies[i].frame = CGRectMake(x[i], y[i], 40, 40);
            flies[i].transform = CGAffineTransformMakeRotation(M_PI_2);
            flies[i].transform = CGAffineTransformRotate(flies[i].transform, rad[i]);
            [self.view addSubview:flies[i]];
            
        }
        
        if (i >= 10) {
            
            flyNumber[i] = [UIImage imageNamed:@"fly2.png"];
            flies[i] = [[UIImageView alloc] initWithImage:flyNumber[i]];
            flies[i].tag = i;
            flies[i].frame = CGRectMake(x[i], y[i], 40, 40);
            flies[i].transform = CGAffineTransformMakeRotation(M_PI_2 * 0.8);
            flies[i].transform = CGAffineTransformRotate(flies[i].transform, rad[i]);
            [self.view addSubview:flies[i]];
            
        }
        
    }
    
}

-(void)countDown{
    
    countdown -= 1;
    
    
    if (countdown >= 4) {
        
        countdownLabel.text = @"できるだけ早くハエを駆除しろ";
        countdownLabel.font = [UIFont fontWithName:@"Hiragino Mincho ProN" size:40];
        
    }
    
    if (countdown >= 1 && countdown <= 3) {
        
        countdownLabel.text = [NSString stringWithFormat:@"%d",countdown];
        countdownLabel.font = [UIFont fontWithName:@"Hiragino Mincho ProN" size:200];
        
    }
    
    if (countdown == 0) {
        
        countdownLabel.text = @"スタート";
        countdownLabel.font = [UIFont fontWithName:@"Hiragino Mincho ProN" size:50];
    }
    
    if (countdown == -1) {
        
        countdownLabel.hidden = YES;
        
        [countdownTimer invalidate];
        
        countdownLabel.hidden = YES;
        
        timeLabel.hidden = NO;
        
    }
    
}

-(void)change{
    
    for (int i = 0; i < 15 ; i++) {
        
        flies[i].transform = CGAffineTransformRotate(flies[i].transform, M_PI_2);
        angles[i] += 90;
        rad[i]=(angles[i] * M_PI / 180);
        
        vx[i] = cos(rad[i]) * speedX[i];
        vy[i] = sin(rad[i]) * speedY[i];
        
    }
    
}

-(void)count{
    
    count += 0.1;
    
    timeLabel.text = [NSString stringWithFormat:@"%.1f",count];
    
    for (int i = 0; i < 15; i++) {
        
        if (count < 0) {
            
            flies[i].userInteractionEnabled = NO;
            
        }else{
            
            flies[i].userInteractionEnabled = YES;
            
        }
        
        float wx = flies[i].center.x + vx[i];
        float wy = flies[i].center.y + vy[i];
        
        float amari = fmodf(count, 1.0);
        
        if (amari >= 0 && amari < 0.1){
            
            [self change];
            
        }
        
        if (wx > 320) {
            
            wx =  0;
        }
        if (wx < 0) {
            
            wx = 320;
        }
        if (wy > 568) {
            
            wy = 0;
        }
        if (wy < 0) {
            
            wy = 568;
            
        }
        
        flies[i].center = CGPointMake(wx, wy);
        
        
        
    }
    
    if (flies[10].hidden == YES || flies[11].hidden == YES ||flies[12].hidden == YES || flies[13].hidden == YES ||
        flies[14].hidden == YES) {
        
        number = 1;
        
        [timer invalidate];
        
        [self performSelector:@selector(transition) withObject:nil afterDelay:2.0];
        
        [self finish];
        
        backGround.backgroundColor = [UIColor redColor];
        
        backGround.alpha = 0.8;
        
        backGround.hidden = NO;
        
        killLabel.hidden = NO;
        
        killLabel.text = @"You were killed";
        
        for (int i = 0; i < 10; i++) {
            
            flies[i].userInteractionEnabled = NO;
            
        }
        
    }
    
    
    if (flies[0].hidden == YES && flies[1].hidden == YES &&  flies[2].hidden == YES && flies[3].hidden == YES
        && flies[4].hidden == YES && flies[5].hidden == YES && flies[6].hidden == YES && flies[7].hidden == YES
        &&flies[8].hidden == YES && flies[9].hidden == YES) {
        
        [timer invalidate];
        
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        
        [defaults setFloat:count forKey:@"score"];
        
        [defaults synchronize];
        
        float score = [defaults floatForKey:@"score"];
        
        float highScore = [defaults floatForKey:@"highScore"];
        
        backGround.hidden = NO;
        
        backGround.backgroundColor = [UIColor greenColor];
        
        backGround.alpha = 0.8;
        
        killLabel.hidden = NO;
        
        killLabel.text = @"Complete!";
        
        
        for (int i = 10; i < 15; i++) {
            
            flies[i].userInteractionEnabled = NO;
            
        }
        
        if (highScore == 0.0) {
            
            [defaults setFloat:count forKey:@"highScore"];
            
        }
        
        if (score < highScore) {
            
            [defaults setFloat:count forKey:@"highScore"];
            
            [defaults synchronize];
            
        }
        
        [self performSelector:@selector(transition) withObject:nil afterDelay:2.0];
        
    }
    
    if (count > 59.9 && count <= 60.0) {
        
        [timer invalidate];
        
        [self finish];
        
        gameOverLabel.hidden = NO;
        
        backGround.hidden = NO;
        
        backGround.backgroundColor = [UIColor blueColor];
        
        backGround.alpha = 0.8;
        
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        
        [defaults setFloat:count forKey:@"score"];
        
        [self performSelector:@selector(transition) withObject:nil afterDelay:1.5];
    }
    
}

-(void)transition{
    
    ResultViewController *ResultView = [self.storyboard instantiateViewControllerWithIdentifier:@"ResultView"];
    ResultView.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:ResultView animated:YES completion:nil];
    
}

-(void)finish{
    
    for (int i = 0; i < 15; i++) {
        
        flies[i].userInteractionEnabled = NO;
    }
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    UITouch *touch = [touches anyObject];
    
    if (count < 0) {
        
    }
    else if (flies[10].hidden == YES || flies[11].hidden == YES ||flies[12].hidden == YES || flies[13].hidden == YES ||
             flies[14].hidden == YES){
        
    }
    else{
        
        flies[touch.view.tag].image = [UIImage imageNamed:@"dead_fly.png"];
        
        tagNumber = touch.view.tag;
        
        [self performSelector:@selector(death) withObject:nil afterDelay:0.3];
        
        NSLog(@"%long",touch.view.tag);
        
    }
    
}

-(void)death{
    
    flies[tagNumber].hidden = YES;
    
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
