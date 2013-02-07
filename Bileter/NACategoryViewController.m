//
//  NACategoryViewController.m
//  Bileter
//
//  Created by Admin on 1/27/13.
//  Copyright (c) 2013 Search Concepts AG. All rights reserved.
//

#import "NACategoryViewController.h"

@interface NACategoryViewController ()

@end

@implementation NACategoryViewController
@synthesize addUITableView;
@synthesize whatToSet;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    addUITableView.frame = CGRectMake(self.view.frame.origin.x + 6, self.view.frame.origin.y + 6, self.view.frame.size.width - 12, self.view.frame.size.height -12 - 46);
    CALayer *layer = addUITableView.layer;
    layer.borderWidth = 1;
    layer.borderColor = [[UIColor grayColor] CGColor];
    layer.cornerRadius = 10;
    layer.masksToBounds = YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark UITableViewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return nil;
}
-(NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    return nil;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[SingletonForGlobalVariables sharedMySingleton].CATEGORIES count] + 1;
}
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row % 2) {
    } else {
        cell.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"cellBG.png"]];
    }
}

UITableViewCell *cell;
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
   
    static NSString *CellIdentifier = @"CountryCell";
    cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
   
   

    if (indexPath.row == 0) {
        cell.textLabel.text = @"Все";
    }
    else
    {
         NACategory *category = [[SingletonForGlobalVariables sharedMySingleton].CATEGORIES objectAtIndex:indexPath.row -1];
         cell.textLabel.text = category.categoryTitle;
    }
   

    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (whatToSet) {
        case 0:
        {
            NSLog(@"Set [SingletonForGlobalVariables sharedMySingleton].CATEGORY_TO_SORT_ACTIONS");
            if (indexPath.row == 0) {
                [SingletonForGlobalVariables sharedMySingleton].CATEGORY_TO_SORT_ACTIONS = nil;
            }
            else
            {
                NACategory *category = [[SingletonForGlobalVariables sharedMySingleton].CATEGORIES objectAtIndex:indexPath.row -1];
                [SingletonForGlobalVariables sharedMySingleton].CATEGORY_TO_SORT_ACTIONS = category.categoryId;
            }
            [self.navigationController popViewControllerAnimated:YES];
            ViewController *controller =(ViewController*)[SingletonForGlobalVariables sharedMySingleton].mainController;
            [controller refreshAddTableView];
            break;
        }
        case 1:
        {
            NSLog(@"Set [SingletonForGlobalVariables sharedMySingleton].CATEGORY_TO_SORT_PLACES");
            if (indexPath.row == 0) {
                [SingletonForGlobalVariables sharedMySingleton].CATEGORY_TO_SORT_PLACES = nil;
            }
            else
            {
                NACategory *category = [[SingletonForGlobalVariables sharedMySingleton].CATEGORIES objectAtIndex:indexPath.row -1];
                [SingletonForGlobalVariables sharedMySingleton].CATEGORY_TO_SORT_PLACES = category.categoryId;
               
            }
            [self.navigationController popViewControllerAnimated:YES];
            ViewController *controller =(ViewController*)[SingletonForGlobalVariables sharedMySingleton].mainController;
            [controller refreshAddTableView];
            break;
        }
        default:
            break;
    }
       
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40;
    
}
@end
