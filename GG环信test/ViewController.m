//
//  ViewController.m
//  GG环信test
//
//  Created by heyudongfang on 16/3/17.
//  Copyright © 2016年 heyudongfang. All rights reserved.
//

#import "ViewController.h"
#import "EaseMessageViewController.h"
#import "ChatViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    DDLog(@"gaoxing");
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton *redButton = [ UIButton buttonWithType:UIButtonTypeCustom];
    redButton .frame = CGRectMake(100, 100, 100, 50);
    redButton.backgroundColor = [ UIColor redColor];
    [redButton addTarget:self action:@selector(redAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:redButton];

}
-(void)redAction
{
    
    EaseEmotionManager *manager = [[ EaseEmotionManager alloc] initWithType:EMEmotionDefault emotionRow:3 emotionCol:5 emotions:[EaseEmoji allEmoji]];
     DDLog(@"gaoxing");
//    EaseMessageViewController *messageVC = [[ EaseMessageViewController alloc] initWithConversationChatter:@"8001" conversationType:EMConversationTypeChat];
//    messageVC.title = @"8001";
    ChatViewController *messageVC = [[ ChatViewController alloc] initWithConversationChatter:@"8001" conversationType:EMConversationTypeChat];
  messageVC.title = @"gaoxing01";
    [messageVC.faceView setEmotionManagers:@[manager]];
   // UINavigationController *nc = [[ UINavigationController alloc] initWithRootViewController:messageVC];
    [self.navigationController pushViewController:messageVC animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
