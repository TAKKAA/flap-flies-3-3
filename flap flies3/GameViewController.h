//
//  GameViewController.h
//  flap flies3
//
//  Created by 中山　貴仁 on 2015/01/26.
//  Copyright (c) 2015年 Nakayama Takahito. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GameViewController : UIViewController{
    
    //カウントダウン表示ラベル
    IBOutlet UILabel *countdownLabel;
    
    //カウントダウン
    NSTimer *countdownTimer;
    
    int countdown;
    
    //タイマー
    NSTimer *timer;
    
    //秒数表示
    IBOutlet UILabel *timeLabel;
    
    //タイマー変数
    float count;
    
    //最初の位置
    float x[10];
    float y[10];
    
    float vx[10];
    float vy[10];
    
    float angles[10];
    float rad[10];
    
    float speedX[10];
    float speedY[10];
    
    UIImage *flyNumber[10];
    UIImageView *flies[10];
    
}

@end
