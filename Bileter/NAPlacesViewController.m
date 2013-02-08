//
//  NACategoryViewController.m
//  Bileter
//
//  Created by Admin on 1/27/13.
//  Copyright (c) 2013 Search Concepts AG. All rights reserved.
//

#import "NAPlacesViewController.h"

@interface NAPlacesViewController ()

@end

@implementation NAPlacesViewController
@synthesize addUITableView;

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
    
    MYAFnETWORKINGmANAGER *afNetManager = [[MYAFnETWORKINGmANAGER alloc]init];
    afNetManager.delegate = self;
    [afNetManager searchPlacesByName:@"" byCategory:nil byGenre:nil byMetro:nil byDistrict:nil byOfs:nil byLim:nil];
    progressAlert = [[UIAlertView alloc]initWithTitle:@"Поиск" message:[NSString stringWithFormat:@"Поиск данных"] delegate:nil cancelButtonTitle:nil otherButtonTitles:nil];
    [progressAlert show];
    
    if( progressAlert != nil) {
        UIActivityIndicatorView *indicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
        
        indicator.center = CGPointMake( progressAlert.bounds.size.width/2,  progressAlert.bounds.size.height-45);
        [indicator startAnimating];
        [progressAlert addSubview:indicator];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)delegateFromMyAfNetworkingReturnsPlacesFoundObject:(NSArray *)places
{
    placesLocal = [[NSArray alloc] initWithArray:places];
    [progressAlert dismissWithClickedButtonIndex:0 animated:YES];
    //[addUITableView reloadData];
    [addUITableView reloadSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationFade];
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
    return [placesLocal count] + 1;
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
         NAPlace *place = [placesLocal objectAtIndex:indexPath.row -1];
         cell.textLabel.text = place.placeShortTitle;
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
        if (indexPath.row == 0) {
            [SingletonForGlobalVariables sharedMySingleton].PLACE_TO_SORT_ACTIONS = nil;
        }
        else
        {
            NAPlaceFound *place = [placesLocal objectAtIndex:indexPath.row - 1];
            [SingletonForGlobalVariables sharedMySingleton].PLACE_TO_SORT_ACTIONS = place.placeId;
           
        }
        [self.navigationController popViewControllerAnimated:YES];
        ViewController *controller =(ViewController*)[SingletonForGlobalVariables sharedMySingleton].mainController;
        [controller refreshAddTableView];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40;
    
}
@end
