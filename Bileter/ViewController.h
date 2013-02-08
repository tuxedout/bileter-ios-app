//
//  ViewController.h
//  Bileter
//
//  Created by Admin on 1/15/13.
//  Copyright (c) 2013 Search Concepts AG. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DNBSwipyNavigationController.h"
#import "NAMenuTableViewController.h"

#import "DateViewController.h"
#import "NADetailedActionViewController.h"
#import "NACategoryViewController.h"
#import "NAPlacesViewController.h"
#import "NADetailedPlaceViewController.h"
#import "NAActionFilterCell.h"
#import "NATabBarViewController.h"
@interface ViewController : UIViewController <DNBSwipyNavigationControllerDelegate, MyAFNetworkingProtocolDelegate,UITextFieldDelegate, UITabBarDelegate,UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate>
{
     UIAlertView *alertToDisplayRegistration;
    IBOutlet CLLocationManager *locationManager;
}
@property (weak, nonatomic) IBOutlet UISearchBar *addMeropriyatiyaViewSearchBar;
@property (strong, nonatomic) IBOutlet UISearchBar *addSearchBar;
@property (strong, nonatomic) IBOutlet UIButton *addCategoryButton;

- (IBAction)addAuthentificationViewMissButtonClick:(id)sender;
- (IBAction)addAutherntificationViewLoginButtonClick:(id)sender;
- (IBAction)addAuthentificationViewRegistrationButtonClick:(id)sender;
- (IBAction)addSettingsViewChangePasswordButtonClisk:(id)sender;

@property (weak, nonatomic) IBOutlet UITextField *addRegistrationViewSurname;
- (IBAction)addActionCategorySortButtonClick:(id)sender;
- (IBAction)addActionPlaceSortButtonClick:(id)sender;
@property (weak, nonatomic) IBOutlet UINavigationBar *addRegistrationViewNavigationBar;
@property (weak, nonatomic) IBOutlet UINavigationItem *addRegistrationViewNavigationBarItem;
@property (weak, nonatomic) IBOutlet UITextField *addRegistrationViewFatherName;
@property (weak, nonatomic) IBOutlet UITextField *addRegistrationViewPassword1;
@property (weak, nonatomic) IBOutlet UITextField *addRegistrationViewMobilePhone;
@property (weak, nonatomic) IBOutlet UISwitch *addRegistrationViewSwitch;
@property (weak, nonatomic) IBOutlet UITextField *addRegistrationViewPassword2;
@property (weak, nonatomic) IBOutlet UITextField *addRegistrationViewEmail;
@property (weak, nonatomic) IBOutlet UITextField *addRegistrationViewName;
@property (weak, nonatomic) IBOutlet UITextField *addAuthentificationPasswordTextField;
@property (strong, nonatomic) IBOutlet UIView *addAuthentificationView;
@property (strong, nonatomic) IBOutlet UIView *addRegistrationView;
@property (weak, nonatomic) IBOutlet UITextField *addAuthentificaitonEmailMobilePhoneTextField;
@property (strong, nonatomic) IBOutlet UIView *addMainViewOfInitialNavigatiionController;
@property (strong, nonatomic) IBOutlet UIView *addSettingsInitialView;
- (IBAction)addMeropriyatiyaViewDateButtonClick:(id)sender;

@property (strong, nonatomic) IBOutlet UIView *addMeropriyatiyaInitialView;
@property (weak, nonatomic) IBOutlet UILabel *addMeropriyatiyaViewDateLabel;
@property (nonatomic, retain) UIAlertView *alertToDisplayRegistration;
@property (strong, nonatomic) IBOutlet UITableView *addUITableView;

-(void)pushAControllerWithIndex:(int)index source:(int)source;
-(void)removeAllSubviews;
-(void)refreshAddTableView;
@end
