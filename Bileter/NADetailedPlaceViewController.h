//
//  NADetailedPlaceViewController.h
//  Bileter
//
//  Created by Admin on 1/28/13.
//  Copyright (c) 2013 Search Concepts AG. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NAMapViewController.h"
#import "NAPlaceDetailCell.h"
#import "NATabBarViewController.h"
@interface NADetailedPlaceViewController : UIViewController
{
    NAPlaceFound *place;
    NAPlace *placeDetailed;
    IBOutlet CLLocationManager *locationManager;
    UIAlertView *progressAlert;
}

@property (weak, nonatomic) IBOutlet UITableView *addUITableView;
@property (nonatomic, retain) NAPlaceFound *place;
@property (nonatomic, retain) NAPlace      *placeDetailed;
@end
