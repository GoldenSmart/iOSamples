//
//  ViewController.m
//  HelloSocial
//
//  Created by Rex Chen on 12/10/9.
//  Copyright (c) 2012年 Huijun.org. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)Post:(id)sender {
    if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook]) {
        rexPost = [[SLComposeViewController alloc] init];
        rexPost = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
        [rexPost setInitialText:@"iOS學習筆記，第1天: Social Framework"];
        [rexPost addURL: [[NSURL alloc] initWithString:@"http://blog.huijun.org/post/33227612245/1-social-framework"]];
        [self presentViewController:rexPost animated:YES completion:nil];
    }
    [rexPost setCompletionHandler: ^(SLComposeViewControllerResult result){
         NSString *output = [[NSString alloc] init];
         switch (result) {
             case SLComposeViewControllerResultCancelled:
                 output = @"取消送出";
                 break;
             case SLComposeViewControllerResultDone:
                 output = @"送出成功";
                 break;
             default:
                 break;
         }
         UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Facebook" message:output delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
         [alert show];
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
