//
//  NADetailedPlaceViewController.m
//  Bileter
//
//  Created by Admin on 1/28/13.
//  Copyright (c) 2013 Search Concepts AG. All rights reserved.
//

#import "NADetailedPlaceViewController.h"

@interface NADetailedPlaceViewController ()

@end

@implementation NADetailedPlaceViewController
@synthesize place;
@synthesize placeDetailed;
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
    [manager getPlaceInfo:place.placeId];
    
    addUITableView.frame = CGRectMake(self.view.frame.origin.x + 6, self.view.frame.origin.y + 6, self.view.frame.size.width - 12, self.view.frame.size.height -12 - 46);
    CALayer *layer = addUITableView.layer;
    layer.borderWidth = 1;
    layer.borderColor = [[UIColor grayColor] CGColor];
    layer.cornerRadius = 10;
    layer.masksToBounds = YES;
    locationManager = [[CLLocationManager alloc] init];
    locationManager.distanceFilter = kCLDistanceFilterNone; // whenever we move
    locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters; // 100 m
    [locationManager startUpdatingLocation];
    // Do any additional setup after loading the view from its nib.
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
    return 4;//[[SingletonForGlobalVariables sharedMySingleton].CATEGORIES count] + 1;
}
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 0:{
            cell.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"titleBG.png"]];
        }break;
        case 2:{
            cell.backgroundColor = [UIColor colorWithRed:238.0f/255.0f green:238.0f/255.0f blue:238.0f/255.0f alpha:1.0f];
        }break;
        default:
            cell.backgroundColor = [UIColor whiteColor];
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
            cell.textLabel.text = place.placeTitle;
            cell.textLabel.font = [UIFont systemFontOfSize:14.0f];
            cell.textLabel.textAlignment = NSTextAlignmentCenter;
            break;
        }
        case 1:
        {
            cell.imageView.image =[UIImage imageNamed:@"loc.png"];
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            CLLocation *locA = [[CLLocation alloc] initWithLatitude:locationManager.location.coordinate.latitude longitude:locationManager.location.coordinate.longitude];
            
            CLLocation *locB = [[CLLocation alloc] initWithLatitude:[place.placeLatitude doubleValue]   longitude:[place.placeLongitude doubleValue]];
            
            CLLocationDistance distance = [locA distanceFromLocation:locB];
            
            NSString *addressString = [NSString stringWithFormat:@"%@   %.1f м",place.placeAddress, distance];
            CGSize textSize2  = [addressString sizeWithFont:[UIFont systemFontOfSize:13.0f] constrainedToSize:CGSizeMake(self.view.frame.size.width - 14 - 60, 1000.0f)];
            UILabel *address = [[UILabel alloc] initWithFrame:CGRectMake(40, cell.frame.origin.y +6, self.view.frame.size.width - 14 - 60, textSize2.height)];
            address.backgroundColor = [UIColor clearColor];
            address.font = [UIFont systemFontOfSize:13.0f];
            address.lineBreakMode = NSLineBreakByWordWrapping;
            address.text = addressString;
            address.numberOfLines = 0;
            
            
            [cell addSubview:address];
            break;
        }
        case 2:
        {
            NAPlaceDetailCell *cell = (NAPlaceDetailCell *)[tableView dequeueReusableCellWithIdentifier:@"NAActionDetailCell"];
            
            if (cell == nil) {
                NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"NAPlaceDetailCell" owner:self options:nil];
                cell = (NAPlaceDetailCell *)[nib objectAtIndex:0];
                [cell setItemToShow: self.placeDetailed];
            }
            
            return cell;
            
            break;
        }
        case 3:
        {
            UIButton *dateButton = [[UIButton alloc] initWithFrame:CGRectMake(17, 8, 273, 28)];
            
            [dateButton setImage:[UIImage imageNamed:@"dateButton"] forState:UIControlStateNormal];
            
            [cell addSubview:dateButton];
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
        case 1:
        {
            NAMapViewController *controller = [[NAMapViewController alloc] initWithNibName:@"NAMapViewController" bundle:nil];
            controller.place = placeDetailed;
            [self.navigationController pushViewController:controller animated:YES];
            break;
        }
        default:
        break;
    }
    if (indexPath.row == 0) {
//        [SingletonForGlobalVariables sharedMySingleton].CATEGORY_TO_SORT_PLACES = nil;
//        [self.navigationController popViewControllerAnimated:YES];
    }
    else
    {
//        NACategory *category = [[SingletonForGlobalVariables sharedMySingleton].CATEGORIES objectAtIndex:indexPath.row -1];
//        [SingletonForGlobalVariables sharedMySingleton].CATEGORY_TO_SORT_PLACES = category.categoryId;
//        [self.navigationController popViewControllerAnimated:YES];
//        ViewController *controller =(ViewController*)[SingletonForGlobalVariables sharedMySingleton].mainController;
//        [controller refreshAddTableView];
    }
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 2:{
          CGSize textSize = [placeDetailed.placeDetail sizeWithFont:[UIFont systemFontOfSize:14.0f] constrainedToSize:CGSizeMake(228, 1000)];
            
            return textSize.height+12;
        }break;
        default:
            return 44;
        break;
    }
}

- (void)delegateFromMyAfNetworkingReturnsPlaceInfoObject:(NAPlace *)placeInMethod
{
    [self setPlaceDetailed: placeInMethod];
    [addUITableView reloadData];
    [progressAlert dismissWithClickedButtonIndex:0 animated:YES];
}
@end
