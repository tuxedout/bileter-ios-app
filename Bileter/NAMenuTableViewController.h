//
//  NAMenuTableViewController.h
//  Bileter
//
//  Created by Admin on 1/15/13.
//  Copyright (c) 2013 Search Concepts AG. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DNBSwipyNavigationController.h"
#import "ViewController.h"
#import "SettingsViewController.h"
@interface NAMenuTableViewController : UITableViewController <DNBSwipyNavigationControllerDelegate>
{
UIViewController *centralControllerHere;
}
@property (nonatomic, assign) UIViewController *centralControllerHere;
@end
