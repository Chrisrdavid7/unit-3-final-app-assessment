//
//  C4QCatsTableViewController.m
//  unit-3-final-assessment
//
//  Created by Michael Kavouras on 12/17/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import "C4QCatFactsTableViewController.h"
#import <AFNetworking/AFNetworking.h>
#import "Cell.h"
#import "C4QCatFactsDetailViewController.h"
#import "SavedCatsTableViewController.h"

#define CAT_API_URL @"http://catfacts-api.appspot.com/api/facts?number=100"

@interface C4QCatFactsTableViewController ()
@property (nonatomic) NSMutableArray *data;

@end

@implementation C4QCatFactsTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
               [self.tableView reloadData];
        
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 12.0;
    
    UINib *cellNib = [UINib nibWithNibName:@"Cell" bundle:nil];
    [self.tableView registerNib:cellNib forCellReuseIdentifier:@"CatFactIdentifier"];
    self.data = [[NSMutableArray alloc] init];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"application/javascript"];
    
    [manager GET:CAT_API_URL parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSError *error;
        NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:&error];
        
        NSArray *facts = [jsonDict objectForKey:@"facts"];
        
        for ( NSString* fact in facts ) {
            
            
            [self.data addObject:fact];
        }
        
        [self.tableView reloadData];
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"fail:%@", error);
    }];
    
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.data.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    Cell *cell = [tableView dequeueReusableCellWithIdentifier:@"CatFactIdentifier"];
    cell.catFact =[self.data objectAtIndex:indexPath.row];
    cell.factLabel.text= [self.data objectAtIndex:indexPath.row];
    cell.factLabel.textAlignment = NSTextAlignmentJustified;
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    C4QCatFactsDetailViewController *controller = (C4QCatFactsDetailViewController *)[self.storyboard instantiateViewControllerWithIdentifier: @"CatStory"];
    controller.story = [self.data objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:controller animated:YES];
    
}
- (IBAction)viewSavedCatFacts:(UIBarButtonItem *)sender {
    
    SavedCatsTableViewController *vc = (SavedCatsTableViewController *)[self.storyboard instantiateViewControllerWithIdentifier: @"SavedCat"];
    
    UINavigationController *navController = [[UINavigationController alloc]initWithRootViewController:vc];
    navController.navigationBar.topItem.title =  @"Saved Cat's";
    navController.navigationBar.topItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(dismissView:)];
    
    [self.navigationController presentViewController:navController animated:YES completion:nil];
    
}

- (void) dismissView:(id)sender {
    
    [self.presentedViewController dismissViewControllerAnimated:YES completion:nil];
}




@end
