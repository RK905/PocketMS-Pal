//
//  redditViewController.m
//  PocketMS Pal
//
//  Created by Rayen Kamta on 11/26/15.
//  Copyright © 2015 Geeksdobyte. All rights reserved.
//

#import "redditViewController.h"


@interface redditViewController ()

@end

@implementation redditViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.webURLS = [self.webURLS stringByReplacingOccurrencesOfString:@"www." withString:@"m."];
    [self.myWebview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.webURLS]]];
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
