//
//  NADetailedActionViewController.h
//  Bileter
//
//  Created by Admin on 1/26/13.
//  Copyright (c) 2013 Search Concepts AG. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NAAction.h"
#import "NAActionDetailCell.h"
#import "NAMapViewController.h"
#import "NATabBarViewController.h"
@interface NADetailedActionViewController : UIViewController <MyAFNetworkingProtocolDelegate>
{
    NAAction *action;
    NAActionDetailed *actionDetailed;
    NAPlace *place;
    UIAlertView *progressAlert;
}
@property (weak, nonatomic) IBOutlet UITableView *addUITableView;
@property (nonatomic, retain) NAAction *action;
@property (nonatomic, retain) NAActionDetailed *actionDetailed;
@property (nonatomic, retain) NAPlace *place;
@end
