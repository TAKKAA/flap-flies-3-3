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
    
    countdownTimer = [NSTimer scheduledTimerWithTimeInterval:1
                                                      target:self
                                                    selector:@selector(countDown)
                                                    userInfo:nil
                                                    repeats:YES];
    countdown = 7;
    [countdownTimer fire];
    
    timer = [NSTimer scheduledTimerWithTimeInterval:0.1
                                             target:self
                                           selector:@selector(count)
                                           userInfo:nil
                                            repeats:YES];
    
    count = -7;
    [timer fire];
    
    [self display];
    
    
    for (int i = 0; i<10; i++) {
     
    //位置
    x[i] = arc4random() % 261 + 20;
    y[i] = arc4random() % 529 + 20;
        
    //スピード
    speedX[i] = arc4random() % 10 + 5;
    speedY[i] = arc4random() % 10 + 5;
        
    //初期角度
    angles[i] = arc4random() % 360;
    //初期角度（π）
    rad[i] =(angles[i] * M_PI / 180.0);
       
    //実際に進む距離
    vx[i] = cos(rad[i]) * speedX[i];
    vy[i] = sin(rad[i]) * speedY[i];
    
        
    }
    
    
    [self makeFly];
    
    
    
}

-(void)display{
    
    countdownLabel.hidden = NO;
    
    timeLabel.hidden = YES;
    
}

-(void)makeFly{
    
    for (int i = 0; i < 10; i++) {
    
    flyNumber[i] = [UIImage imageNamed:@"fly1.png"];
    flies[i] = [[UIImageView alloc] initWithImage:flyNumber[i]];
    flies[i].transform = CGAffineTransformMakeRotation(M_PI_2);
    flies[i].tag = i;
    flies[i].frame = CGRectMake(x[i], y[i], 40, 40);
    flies[i].transform = CGAffineTransformRotate(flies[i].transform, angles[i] * M_PI / 180.0);
    [self.view addSubview:flies[i]];
        
    }
    
    
}

-(void)countDown{
    
    countdown -= 1;
    
    
    if (countdown >= 4) {
        
        countdownLabel.text = @"できるだけ早くハエを駆除しろ";
        countdownLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:40];
        
    }
    
    if (countdown >= 1 && countdown <= 3) {
        
        countdownLabel.text = [NSString stringWithFormat:@"%d",countdown];
        countdownLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:200];
        
    }
    
    if (countdown == 0) {
        
        countdownLabel.text = @"スタート";
        countdownLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:50];
    }
    
    if (countdown == -1) {
        
        countdownLabel.hidden = YES;
        
        [countdownTimer invalidate];
        
       
        
        
        countdownLabel.hidden = YES;
        
        timeLabel.hidden = NO;
        
        
    }
    
}

-(void)change{
    
    for (int i = 0; i < 10 ; i++) {
        
     flies[i].transform = CGAffineTransformRotate(flies[i].transform, 45.0 * M_PI / 180);
    //flies[i].transform = CGAffineTransformMakeRotation(M_PI_2);

      //  flies[i].transform = CGAffineTransformRotate(flies[i].transform,M_PI / 2);


        vx[i] = cos(rad[i] + M_PI_2) * speedX[i];
        vy[i] = sin(rad[i] + M_PI_2) * speedY[i];
        
        
    }
    
}

-(void)count{
    
    
    count += 0.1;
    
    timeLabel.text = [NSString stringWithFormat:@"%.1f",count];
    
    if (count < 0) {
        
        for (int i = 0; i < 10; i++) {
            
            flies[i].userInteractionEnabled = NO;
        }
        
    }else{
        
        for (int i = 0; i<10; i++) {
            
            flies[i].userInteractionEnabled = YES;
        }
        
    }

   
    
    //float amari = fmod(count, 3.0f);
    
    
    
       for (int i = 0; i < 10; i++) {
        
        float wx = flies[i].center.x + vx[i];
        float wy = flies[i].center.y + vy[i];
           
        if (count >= 3.0 && count <= 3.1){
            
        [self change];
            
            
            
 //  flies[i].transform = CGAffineTransformMakeRotation(angles[i] * M_PI / 180.0 + M_PI_2);
            
//               flies[i].transform = CGAffineTransformRotate(flies[i].transform, M_PI_2);
//               vx[i] = cos(rad[i] + M_PI_2) ;
//               vy[i] = sin(rad[i] + M_PI_2) ;
//               float wx = flies[i].center.x + vx[i];
//               float wy = flies[i].center.y + vy[i];
//               flies[i].center = CGPointMake(wx, wy);

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
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    UITouch *touch = [touches anyObject];
    
    switch (touch.view.tag) {
        case 0:
            flies[0].hidden = YES;
            break;
            
        case 1:
            flies[1].hidden = YES;
            break;

            
        case 2:
            flies[2].hidden = YES;
            break;

            
        case 3:
            flies[3].hidden = YES;
            break;
            
            
        case 4:
            flies[4].hidden = YES;
            break;
            
            
        case 5:
            flies[5].hidden = YES;
            break;
            

        case 6:
            flies[6].hidden = YES;
            break;
            

        case 7:
            flies[7].hidden = YES;
            break;
            

        case 8:
            flies[8].hidden = YES;
            break;
            

        case 9:
            flies[9].hidden = YES;
            break;

            
        default:
            break;
    }
    
    
    
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
