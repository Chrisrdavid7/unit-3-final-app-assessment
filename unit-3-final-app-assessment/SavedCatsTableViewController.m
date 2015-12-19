//
//  SavedCatsTableViewController.m
//  unit-3-final-app-assessment
//
//  Created by Chris David on 12/19/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import "SavedCatsTableViewController.h"

@interface SavedCatsTableViewController ()
@property (nonatomic) NSArray* savedCatFacts;
@end

@implementation SavedCatsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 12.0;
    
    
    self.savedCatFacts = [[NSUserDefaults standardUserDefaults] objectForKey:@"savedFacts"];
    
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
    return self.savedCatFacts.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"catStory" forIndexPath:indexPath];
    
    cell.textLabel.text = [self.savedCatFacts objectAtIndex:indexPath.row];
    
    return cell;
}

@end