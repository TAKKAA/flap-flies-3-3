//
//  ViewController.h
//  flap flies3
//
//  Created by 中山　貴仁 on 2015/01/26.
//  Copyright (c) 2015年 Nakayama Takahito. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GameViewController.h"

@interface ViewController : UIViewController{
    
    IBOutlet UILabel *highScoreLabel;
    
    IBOutlet UIImageView *fly2;
    
    AVAudioPlayer *audio;

}

-(IBAction)reset:(id)sender;

-(IBAction)start:(id)sender;


@end

