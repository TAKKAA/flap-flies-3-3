//
//  ExplanationViewController.m
//  flap flies3
//
//  Created by 中山　貴仁 on 2015/03/05.
//  Copyright (c) 2015年 Nakayama Takahito. All rights reserved.
//

#import "ExplanationViewController.h"

@interface ExplanationViewController ()

@end

@implementation ExplanationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)back:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
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
