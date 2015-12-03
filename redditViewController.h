//
//  redditViewController.h
//  PocketMS Pal
//
//  Created by Rayen Kamta on 11/26/15.
//  Copyright © 2015 Geeksdobyte. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface redditViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIWebView *myWebview;
@property (nonatomic, strong) NSString *webURLS;
@end
