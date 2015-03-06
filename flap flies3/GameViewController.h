//
//  GameViewController.h
//  flap flies3
//
//  Created by 中山　貴仁 on 2015/01/26.
//  Copyright (c) 2015年 Nakayama Takahito. All rights reserved.
//

//タイマー変数
float count;

#import <UIKit/UIKit.h>
#import "ResultViewController.h"
#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface GameViewController : UIViewController{
    
    NSInteger tagNumber;
    
    //カウントダウン表示ラベル
    IBOutlet UILabel *countdownLabel;
    
    //カウントダウン
    NSTimer *countdownTimer;
    
    int countdown;
    
    //ゲームオーバーラベル
    IBOutlet UILabel *gameOverLabel;
    
    //タイマー
    NSTimer *timer;
    
    //秒数表示
    IBOutlet UILabel *timeLabel;
    
    //殺されたとき
    IBOutlet UILabel *backGround;
    
    //you were killed
    IBOutlet UILabel *killLabel;
    
    //効果音
//    AVAudioPlayer *audio;
    
    
    //最初の位置
    float x[25];
    float y[25];
    
    float vx[25];
    float vy[25];
    
    float angles[25];
    float rad[25];
        
    float speedX[25];
    float speedY[25];
    
    UIImage *flyNumber[25];
    UIImageView *flies[25];
    
    
}

-(void)death;

@end
