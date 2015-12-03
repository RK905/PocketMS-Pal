//
//  RedTableViewController.m
//  PocketMS Pal
//
//  Created by Rayen Kamta on 11/26/15.
//  Copyright © 2015 Geeksdobyte. All rights reserved.
//

#import "RedTableViewController.h"
#import "AFNetworking.h"
#import "MSTableViewCell.h"
#import "redditViewController.h"

NSDictionary *myDictionary;
NSMutableArray *myMArrayCount;
NSMutableArray *myQALabels;
NSMutableArray *myQAURLS;
NSString * urlString;

@interface RedTableViewController ()

@end

@implementation RedTableViewController

- (BOOL)prefersStatusBarHidden {
    return YES;
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    [self downloadJson];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return myMArrayCount.count;
}


-(void)downloadJson{
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    
    NSURL *URL = [NSURL URLWithString:@"https://www.reddit.com/r/PocketMaplestory/new.json?sort=new"];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    
    NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:request completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
        if (error) {
            NSLog(@"Error: %@", error);
        } else {
            NSLog(@"%@ %@", response, responseObject);
            myDictionary = (NSDictionary*) responseObject;
            myMArrayCount = [[[myDictionary valueForKey:@"data"]objectForKey:@"children"]valueForKey:@"data"];
            myQALabels =[[[[myDictionary valueForKey:@"data"]objectForKey:@"children"]valueForKey:@"data"]valueForKey:@"title"];
            myQAURLS =[[[[myDictionary valueForKey:@"data"]objectForKey:@"children"]valueForKey:@"data"]valueForKey:@"url"];
            NSLog(@"count: %lu",(unsigned long)myMArrayCount.count);
            [self.tableView reloadData];
        }
    }];
    [dataTask resume];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MSTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"myCell" forIndexPath:indexPath];
    cell.myQALabel.text = [NSString stringWithFormat:@"%@",[ myQALabels objectAtIndex:indexPath.row]];
    
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
    redditViewController *secView = [segue destinationViewController];
    secView.webURLS = [NSString stringWithFormat:@"%@",[myQAURLS objectAtIndex:indexPath.row]];
    
}


@end
