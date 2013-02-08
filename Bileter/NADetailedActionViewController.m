//
//  NADetailedActionViewController.m
//  Bileter
//
//  Created by Admin on 1/26/13.
//  Copyright (c) 2013 Search Concepts AG. All rights reserved.
//

#import "NADetailedActionViewController.h"
#import "NAActionDetailCell.h"

@interface NADetailedActionViewController ()

@end

@implementation NADetailedActionViewController
@synthesize action;
@synthesize place;
@synthesize addUITableView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    progressAlert = [[UIAlertView alloc]initWithTitle:@"Загрузка данных" message:@"" delegate:nil cancelButtonTitle:nil otherButtonTitles:nil];
    [progressAlert show];
    if(progressAlert != nil) {
        UIActivityIndicatorView *indicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
        
        indicator.center = CGPointMake(progressAlert.bounds.size.width/2,progressAlert.bounds.size.height-45);
        [indicator startAnimating];
        [progressAlert addSubview:indicator];
    }
    
    MYAFnETWORKINGmANAGER *manager = [[MYAFnETWORKINGmANAGER alloc] init];
    manager.delegate = self;
    [manager getPlaceInfo:action.actionPlaceId];
    addUITableView.frame = CGRectMake(self.view.frame.origin.x + 6, self.view.frame.origin.y + 6, self.view.frame.size.width - 12, self.view.frame.size.height -12 - 46);
    CALayer *layer = addUITableView.layer;
    layer.borderWidth = 1;
    layer.borderColor = [[UIColor grayColor] CGColor];
    layer.cornerRadius = 10;
    layer.masksToBounds = YES;
    
    NATabBarViewController *tabBar = [[NATabBarViewController alloc] initWithNibName:@"NATabBarViewController" bundle:nil];
    tabBar.view.frame = CGRectMake(0,self.view.frame.size.height - 2, tabBar.view.frame.size.width, tabBar.view.frame.size.height);
    [self.view addSubview:tabBar.view];
    [tabBar didMoveToParentViewController:self];
    [self addChildViewController:tabBar];
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
    return 4;
}
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 0:
        {
            cell.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"titleBG.png"]];
            break;
        }
        default:
            break;
    }
}

UITableViewCell *cell;

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"CountryCell";
    cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    
    switch (indexPath.row) {
        case 0:
        {
            CGSize textSize  = [action.actionTitle sizeWithFont:[UIFont systemFontOfSize:16.0f] constrainedToSize:CGSizeMake(self.view.frame.size.width - 14, 1000.0f)];
                UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(cell.frame.origin.x + 7, cell.frame.origin.y+7, cell.frame.size.width -14, textSize.height)];
            title.backgroundColor = [UIColor clearColor];
            title.font = [UIFont systemFontOfSize:16.0f];
            title.lineBreakMode = NSLineBreakByWordWrapping;
            title.text = action.actionTitle;
            title.numberOfLines = 0;
            [cell addSubview:title];
            break;
        }
            case 1:
        {
            cell.imageView.image =[UIImage imageNamed:@"loc.png"];
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            CGSize textSize  = [place.placeTitle sizeWithFont:[UIFont systemFontOfSize:14.0f] constrainedToSize:CGSizeMake(self.view.frame.size.width - 14 - 45, 1000.0f)];
            UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(40, cell.frame.origin.y+7, self.view.frame.size.width - 14 - 45, textSize.height)];
            title.backgroundColor = [UIColor clearColor];
            title.font = [UIFont systemFontOfSize:14.0f];
            title.lineBreakMode = NSLineBreakByWordWrapping;
            title.text = place.placeShortTitle;
            title.numberOfLines = 0;
            [cell addSubview:title];
            CGSize textSize2  = [place.placeAddress sizeWithFont:[UIFont systemFontOfSize:12.0f] constrainedToSize:CGSizeMake(self.view.frame.size.width - 14 - 60, 1000.0f)];
            UILabel *address = [[UILabel alloc] initWithFrame:CGRectMake(40, title.frame.origin.y + title.frame.size.height, self.view.frame.size.width - 14 - 60, textSize2.height)];
            address.backgroundColor = [UIColor clearColor];
            address.font = [UIFont systemFontOfSize:12.0f];
            address.lineBreakMode = NSLineBreakByWordWrapping;
            address.text = place.placeAddress;
            address.numberOfLines = 0;
            [cell addSubview:address];
            break;
        }
            case 2:
        {
            NAActionDetailCell *cell = (NAActionDetailCell *)[tableView dequeueReusableCellWithIdentifier:@"NAActionDetailCell"];
            if (cell == nil) {
                NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"NAActionDetailCell" owner:self options:nil];
                cell = (NAActionDetailCell *)[nib objectAtIndex:0];
                [cell setItemToShow: self.action andDetailed:self.actionDetailed];
            }
            
            return cell;
            
            break;
        }
            case 3:
        {
            CGSize textSize  = [action.actionAnn sizeWithFont:[UIFont systemFontOfSize:16.0f] constrainedToSize:CGSizeMake(self.view.frame.size.width - 28, 1000.0f)];
            UITextView *title = [[UITextView alloc] initWithFrame:CGRectMake(cell.frame.origin.x + 7, cell.frame.origin.y+7, cell.frame.size.width - 28, textSize.height + 14)];
            title.backgroundColor = [UIColor clearColor];
            title.font = [UIFont systemFontOfSize:16.0f];
            title.text = action.actionAnn;
            NSLog(@"%@", action.actionAnn);
            [cell addSubview:title];
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            break;
        }
          
        default:
        break;
    }

  
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 0:
            break;
            case 1:
        {
            NAMapViewController *controller = [[NAMapViewController alloc] initWithNibName:@"NAMapViewController" bundle:nil];
            controller.place = place;
            [self.navigationController pushViewController:controller animated:YES];
            break;
        }
            
        default:
            break;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 0:
        {
            CGSize textSize  = [action.actionTitle sizeWithFont:[UIFont systemFontOfSize:16.0f] constrainedToSize:CGSizeMake(self.view.frame.size.width - 14, 1000.0f)];
           
            return textSize.height + 14;
        }
        case 1:
        {
            return 72;
        }
        case 2:
        {
            return 241;
        }
        case 3:
        {
            CGSize textSize  = [action.actionAnn sizeWithFont:[UIFont systemFontOfSize:16.0f] constrainedToSize:CGSizeMake(self.view.frame.size.width - 28, 1000.0f)];
            
            return textSize.height + 28;
        }
        default:
        return 86;
    }
    
}

#pragma mark MYAFNETWORKINGPROTOCOL delegate
- (void)delegateFromMyAfNetworkingReturnsPlaceInfoObject:(NAPlace *)placeInMethod
{
    [self setPlace:placeInMethod];
    MYAFnETWORKINGmANAGER *manager = [[MYAFnETWORKINGmANAGER alloc] init];
    manager.delegate = self;
    [manager getActionInfo:action.actexId];
    //[addUITableView reloadData];
}

- (void)delegateFromMyAfNetworkingReturnsActionDetailedInfoObject:(NAActionDetailed *)actionInMethod
{
    [self setActionDetailed: actionInMethod];
    [addUITableView reloadSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationFade];
    //[addUITableView reloadData];
    [progressAlert dismissWithClickedButtonIndex:0 animated:YES];
}

@end
