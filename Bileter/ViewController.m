//
//  ViewController.m
//  Bileter
//
//  Created by Admin on 1/15/13.
//  Copyright (c) 2013 Search Concepts AG. All rights reserved.
//

#import "ViewController.h"
#import "SettingsViewController.h"
@interface ViewController ()

@end

@implementation ViewController
@synthesize addAuthentificaitonEmailMobilePhoneTextField;
@synthesize addAuthentificationPasswordTextField;
@synthesize addAuthentificationView;
@synthesize addRegistrationView;
@synthesize addRegistrationViewEmail;
@synthesize addRegistrationViewFatherName;
@synthesize addRegistrationViewMobilePhone;
@synthesize addRegistrationViewName;
@synthesize addRegistrationViewNavigationBar;
@synthesize addRegistrationViewNavigationBarItem;
@synthesize addRegistrationViewPassword1;
@synthesize addRegistrationViewPassword2;
@synthesize addRegistrationViewSurname;
@synthesize addRegistrationViewSwitch;
@synthesize alertToDisplayRegistration;
@synthesize addMainViewOfInitialNavigatiionController;
@synthesize addSettingsInitialView;
@synthesize addTabBar;
@synthesize addMeropriyatiyaInitialView;
@synthesize addMeropriyatiyaViewDateLabel;
@synthesize addUITableView;
@synthesize addMeropriyatiyaViewSearchBar;
@synthesize addCategoryButton;
@synthesize addSearchBar;

NSArray *actionsLocal;
NSArray *placesLocal;
int indexOfCurrentController = 11;
- (void)viewDidLoad
{
  
    
    //locationManager.location.coordinate - to update data
    NSLog(@"%f , %f", locationManager.location.coordinate.latitude , locationManager.location.coordinate.longitude);
    // CLLocation *locA = [[CLLocation alloc] initWithLatitude:lat1 longitude:long1];
    
   // CLLocation *locB = [[CLLocation alloc] initWithLatitude:lat2 longitude:long2];
    
    //CLLocationDistance distance = [locA distanceFromLocation:locB];
    UIView * subView;
    NSArray * subViews = [addSearchBar subviews];
    
    for(subView in subViews)
    {
        if( [subView isKindOfClass:[UITextField class]] )
        {
            ((UITextField*)subView).delegate=self;
            ((UITextField*)subView).returnKeyType=UIReturnKeyDone;
            [(UITextField *)subView setEnablesReturnKeyAutomatically:NO];
            break;
        }
    }
    [super viewDidLoad];
    [[addSearchBar.subviews objectAtIndex:0]removeFromSuperview];

    CALayer *layer = addUITableView.layer;
    layer.borderWidth = 1;
    layer.borderColor = [[UIColor grayColor] CGColor];
    layer.cornerRadius = 10;
    layer.masksToBounds = YES;
    MYAFnETWORKINGmANAGER *manager = [[MYAFnETWORKINGmANAGER alloc]init];
    manager.delegate = self;
    [manager setSessionKey];
  
    self.navigationController.navigationBar.tintColor = [UIColor redColor];
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    NSString *login = [prefs objectForKey:@"login"];
    NSString *password = [prefs objectForKey:@"password"];
    NSLog(@"login pw %@ %@", login, password);
    if (login.length == 0 && password.length == 0) {
        [[[self navigationController] view] addSubview:addAuthentificationView];
    }
    [SingletonForGlobalVariables sharedMySingleton].mainController = self;
}


-(void)viewWillAppear:(BOOL)animated
{
    DNBSwipyNavigationController *c = (DNBSwipyNavigationController*)self.navigationController;
    NAMenuTableViewController *leftOne =[[NAMenuTableViewController alloc] initWithNibName:@"NAMenuTableViewController" bundle:nil];
    leftOne.centralControllerHere = self;
    self.navigationController.leftController = leftOne;
    c.bounceEnabled = NO;
    if (self == [c.viewControllers objectAtIndex:0]) {
        
        UIImage *sideMenuImage = [UIImage imageNamed:@"NavBarIconLauncher"];
        UIButton *sideMenuButton = [UIButton buttonWithType:UIButtonTypeCustom];
        sideMenuButton.bounds = CGRectMake( 0, 0, 30, 30);
        [sideMenuButton setImage:sideMenuImage forState:UIControlStateNormal];
        [sideMenuButton addTarget:self
                 action:@selector(showLeftController)
       forControlEvents:UIControlEventTouchUpInside];
        
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:sideMenuButton];
        self.navigationItem.leftBarButtonItem.enabled = YES;
    }
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)showLeftController {
    DNBSwipyNavigationController *c = (DNBSwipyNavigationController*)self.navigationController;
    if (c.currentPosition != ControllerPositionRight) {
        c.currentPosition = ControllerPositionRight;
    } else {
        c.currentPosition = ControllerPositionRegular;
    }
}

#pragma mark - DNBSwipyNavigationControllerDelegate

- (BOOL)rightControllerEnabled {
    return  NO;
}
- (IBAction)addAuthentificationViewMissButtonClick:(id)sender {
    [addAuthentificationView removeFromSuperview];
    [self pushAControllerWithIndex:11 source:1];
    [addTabBar setSelectedItem:[[addTabBar items]objectAtIndex:0]];
}

- (IBAction)addAutherntificationViewLoginButtonClick:(id)sender {
    if (addAuthentificationPasswordTextField.text.length == 0 || addAuthentificaitonEmailMobilePhoneTextField.text.length == 0) {
        UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"Ошибка" message:[NSString stringWithFormat:@"Введите логин и пароль"] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alertView show];
        
    }
    else
    {
        MYAFnETWORKINGmANAGER *afNetManager = [[MYAFnETWORKINGmANAGER alloc]init];
        afNetManager.delegate = self;
        [afNetManager loginAUser:addAuthentificaitonEmailMobilePhoneTextField.text password:addAuthentificationPasswordTextField.text];
    }
}

- (IBAction)addAuthentificationViewRegistrationButtonClick:(id)sender {
    [addRegistrationView removeFromSuperview];
    addRegistrationViewNavigationBar.tintColor = [UIColor redColor];
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithTitle:@"Coхранить"
                                                                    style:UIBarButtonSystemItemDone target:self action:@selector(saveButtonRegistrationNavigationBarClick)];
    addRegistrationViewNavigationBarItem.rightBarButtonItem = rightButton;
    [[[self navigationController] view] addSubview:addRegistrationView];
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithTitle:@"Отмена"
                                                                   style:UIBarButtonSystemItemDone target:self action:@selector(cancelButtonRegistrationNavigationBarClick)];
    addRegistrationViewNavigationBarItem.leftBarButtonItem = leftButton;
    [[[self navigationController] view] addSubview:addRegistrationView];

}

- (IBAction)addSettingsViewChangePasswordButtonClisk:(id)sender {
    SettingsViewController *controller = [[SettingsViewController alloc] initWithNibName:@"SettingsViewController" bundle:nil];
    [self.navigationController pushViewController:controller animated:YES];
}
#pragma mark Implementation UITextFieldDelegate
-(void)refreshAddTableView
{
    switch (indexOfCurrentController) {
        case 0:
        {
            locationManager = [[CLLocationManager alloc] init];
            locationManager.distanceFilter = kCLDistanceFilterNone; // whenever we move
            locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters; // 100 m
            [locationManager startUpdatingLocation];
            
            MYAFnETWORKINGmANAGER *afNetManager = [[MYAFnETWORKINGmANAGER alloc]init];
            afNetManager.delegate = self;
            [afNetManager searchPlacesByName:addSearchBar.text byCategory:[SingletonForGlobalVariables sharedMySingleton].CATEGORY_TO_SORT_PLACES byGenre:nil byMetro:nil byDistrict:nil byOfs:nil byLim:nil];
            alertToDisplayRegistration = [[UIAlertView alloc]initWithTitle:@"Поиск" message:[NSString stringWithFormat:@"Поиск данных"] delegate:nil cancelButtonTitle:nil otherButtonTitles:nil];
            [alertToDisplayRegistration show];
            
            if( alertToDisplayRegistration != nil) {
                UIActivityIndicatorView *indicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
                
                indicator.center = CGPointMake( alertToDisplayRegistration.bounds.size.width/2,  alertToDisplayRegistration.bounds.size.height-45);
                [indicator startAnimating];
                [ alertToDisplayRegistration addSubview:indicator];
            }

            break;
        }
          case 1:
        {
            MYAFnETWORKINGmANAGER *afNetManager = [[MYAFnETWORKINGmANAGER alloc]init];
            afNetManager.delegate = self;
            [afNetManager searchActionsByPlace:[SingletonForGlobalVariables sharedMySingleton].PLACE_TO_SORT_ACTIONS byName:addSearchBar.text byPeople:nil byCategory:[SingletonForGlobalVariables sharedMySingleton].CATEGORY_TO_SORT_ACTIONS byGenre:nil byOrder:nil bySdt:nil byEdt:nil byOfs:nil byLim:nil all:nil];
            NSLog(@"has to be here %@", [SingletonForGlobalVariables sharedMySingleton].CATEGORY_TO_SORT_ACTIONS);
            alertToDisplayRegistration = [[UIAlertView alloc]initWithTitle:@"Поиск мероприятий" message:[NSString stringWithFormat:@"Поиск данных"] delegate:nil cancelButtonTitle:nil otherButtonTitles:nil];
            [alertToDisplayRegistration show];
            
            if( alertToDisplayRegistration != nil) {
                UIActivityIndicatorView *indicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
                
                indicator.center = CGPointMake( alertToDisplayRegistration.bounds.size.width/2,  alertToDisplayRegistration.bounds.size.height-45);
                [indicator startAnimating];
                [ alertToDisplayRegistration addSubview:indicator];
            }

            break;
        }
        default:
            break;
    }
    }
#pragma mark DoneButtonPressed
- (BOOL)textFieldShouldReturn:(UITextField *)doneButtonPressed {
    switch (indexOfCurrentController) {
        case 0:
        {
            locationManager = [[CLLocationManager alloc] init];
            locationManager.distanceFilter = kCLDistanceFilterNone; // whenever we move
            locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters; // 100 m
            [locationManager startUpdatingLocation];
            
            MYAFnETWORKINGmANAGER *afNetManager = [[MYAFnETWORKINGmANAGER alloc]init];
            afNetManager.delegate = self;
            [afNetManager searchPlacesByName:doneButtonPressed.text byCategory:[SingletonForGlobalVariables sharedMySingleton].CATEGORY_TO_SORT_PLACES byGenre:nil byMetro:nil byDistrict:nil byOfs:nil byLim:nil];
            alertToDisplayRegistration = [[UIAlertView alloc]initWithTitle:@"Поиск" message:[NSString stringWithFormat:@"Поиск по ключевому слову \"%@\"", doneButtonPressed.text] delegate:nil cancelButtonTitle:nil otherButtonTitles:nil];
            [alertToDisplayRegistration show];
            
            if( alertToDisplayRegistration != nil) {
                UIActivityIndicatorView *indicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
                
                indicator.center = CGPointMake( alertToDisplayRegistration.bounds.size.width/2,  alertToDisplayRegistration.bounds.size.height-45);
                [indicator startAnimating];
                [ alertToDisplayRegistration addSubview:indicator];
            }
            [doneButtonPressed resignFirstResponder];
            break;
        }
            
            case 1:
        {
            MYAFnETWORKINGmANAGER *afNetManager = [[MYAFnETWORKINGmANAGER alloc]init];
            afNetManager.delegate = self;
            [afNetManager searchActionsByPlace:nil byName:doneButtonPressed.text byPeople:nil byCategory:[SingletonForGlobalVariables sharedMySingleton].CATEGORY_TO_SORT_ACTIONS byGenre:nil byOrder:nil bySdt:nil byEdt:nil byOfs:nil byLim:nil all:nil];
            NSLog(@"has to be %@", [SingletonForGlobalVariables sharedMySingleton].CATEGORY_TO_SORT_ACTIONS);
            alertToDisplayRegistration = [[UIAlertView alloc]initWithTitle:@"Поиск мероприятий" message:[NSString stringWithFormat:@"Поиск по ключевому слову \"%@\"", doneButtonPressed.text] delegate:nil cancelButtonTitle:nil otherButtonTitles:nil];
            [alertToDisplayRegistration show];
            
            if( alertToDisplayRegistration != nil) {
                UIActivityIndicatorView *indicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
                
                indicator.center = CGPointMake( alertToDisplayRegistration.bounds.size.width/2,  alertToDisplayRegistration.bounds.size.height-45);
                [indicator startAnimating];
                [ alertToDisplayRegistration addSubview:indicator];
            }
            [doneButtonPressed resignFirstResponder];
        }
        default:
        {
            [doneButtonPressed resignFirstResponder];
            break;
        }
    }
   
    return YES;
}

#pragma mark -
#pragma mark RegistrationView Actions
-(void)saveButtonRegistrationNavigationBarClick
{
    if ([addRegistrationViewPassword1.text isEqualToString:addRegistrationViewPassword2.text]) {
        if (addRegistrationViewName.text.length == 0) {
            UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"Ошибка" message:[NSString stringWithFormat:@"Введите имя"] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alertView show];
        }
        else
        {
            if (addRegistrationViewSurname.text.length == 0) {
                UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"Ошибка" message:[NSString stringWithFormat:@"Введите  фамилию"] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                [alertView show];
            }
            else
            {
                if (addRegistrationViewEmail.text.length == 0 || addRegistrationViewMobilePhone.text.length == 0) {
                    UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"Ошибка" message:[NSString stringWithFormat:@"Введите  email и телефон"] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                    [alertView show];
                }
                else
                {
                    if (addRegistrationViewPassword1.text.length < 4) {
                        UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"Ошибка" message:[NSString stringWithFormat:@"Введите  пароль. Не менее 4 символов"] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                        [alertView show];
                    }
                    else
                    {
                        alertToDisplayRegistration = [[UIAlertView alloc]initWithTitle:@"Регистрация" message:@"Происходит регистрация нового пользователя" delegate:nil cancelButtonTitle:nil otherButtonTitles:nil];
                        [ alertToDisplayRegistration show];
                        
                        if( alertToDisplayRegistration != nil) {
                            UIActivityIndicatorView *indicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
                            
                            indicator.center = CGPointMake( alertToDisplayRegistration.bounds.size.width/2,  alertToDisplayRegistration.bounds.size.height-45);
                            [indicator startAnimating];
                            [ alertToDisplayRegistration addSubview:indicator];
                            
                            MYAFnETWORKINGmANAGER *afNetManager = [[MYAFnETWORKINGmANAGER alloc]init];
                            afNetManager.delegate = self;
                            [afNetManager registerAUserName:addRegistrationViewName.text surname:addRegistrationViewSurname.text fatherName:addRegistrationViewFatherName.text password:addRegistrationViewPassword1.text email:addRegistrationViewEmail.text phone:addRegistrationViewMobilePhone.text];
                        }
                    }
                }
            }
        }
    }
    else
    {
        UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"Ошибка" message:[NSString stringWithFormat:@"Пароли не совпадают"] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alertView show];
    }
    
}
-(void)cancelButtonRegistrationNavigationBarClick
{
    [addRegistrationView removeFromSuperview];
    [[[self navigationController] view] addSubview:addAuthentificationView];

}


#pragma mark - delegates from my af networking

- (void)delegateFromMyAfNetworkingReturnsArrayOfActions:(NSArray *)actions
{
    actionsLocal = [[NSArray alloc]initWithArray:actions];
    [addUITableView reloadData];
    [alertToDisplayRegistration dismissWithClickedButtonIndex:0 animated:YES];
}
- (void)delegateFromMyAfNetworkingReturnsPlacesFoundObject:(NSArray *)places
{
    placesLocal = [[NSArray alloc]initWithArray:places];
    [alertToDisplayRegistration dismissWithClickedButtonIndex:0 animated:YES];
    [addUITableView reloadData];
}
- (void)registrationStatus:(NSString *)status code:(int)code
{
    [alertToDisplayRegistration dismissWithClickedButtonIndex:0 animated:YES];
    UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"Успех" message:[NSString stringWithFormat:@"Регистрация прошла успешно"] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alertView show];
    [addRegistrationView removeFromSuperview];
    [[[self navigationController] view] addSubview:addAuthentificationView];
}

-(void)sessionKeyIsSet
{
    NSLog(@"Session key is set");
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    NSString *login = [prefs objectForKey:@"login"];
    NSString *password = [prefs objectForKey:@"password"];
    MYAFnETWORKINGmANAGER *afNetManager = [[MYAFnETWORKINGmANAGER alloc]init];
    if (login.length != 0 && password.length != 0) {
        
        afNetManager.delegate = self;
        [afNetManager loginAUser:login password:password];
        
    }
    [afNetManager getListOfCategories];
    [afNetManager setMetroList];
    [afNetManager setDistrictList];
    [afNetManager setGenreList];
    
}
- (void)authentificationStatus:(NSString *)status code:(NSString*)code
{
    if ([code integerValue] == 0) {
        [alertToDisplayRegistration dismissWithClickedButtonIndex:0 animated:YES];
        UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"Ошибка" message:[NSString stringWithFormat:@"Неверный логин или парольX"] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alertView show];
    }
    else
    {
        if ([code integerValue] == 1) {
            [alertToDisplayRegistration dismissWithClickedButtonIndex:0 animated:YES];
            UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"Успех" message:[NSString stringWithFormat:@"Аутентификация прошла успешно"] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alertView show];
            NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
            NSString *login = [[NSString alloc]initWithString:addAuthentificaitonEmailMobilePhoneTextField.text];
            [prefs setObject:login forKey:@"login"];
            NSString *password = [[NSString alloc]initWithString:addAuthentificationPasswordTextField.text];
            [prefs setObject:password forKey:@"password"];
            [addAuthentificationView removeFromSuperview];
            [self pushAControllerWithIndex:11 source:1];
            addTabBar.selectedItem = 0;
        }
    }
    
    
}

-(void)pushAControllerWithIndex:(int)index source:(int)source
{
    for(UIView *view in addMainViewOfInitialNavigatiionController.subviews)
    {
        [view removeFromSuperview];
    }
    [self.view addSubview:addTabBar];
    switch (source) {
        case 0: //from left uiTableView
        {
            for (int i = 0; i < [addTabBar items].count; i++) {
                if ([[[[addTabBar items] objectAtIndex:i] title] isEqualToString:[[SingletonForGlobalVariables sharedMySingleton].SECTIONS objectAtIndex:index]]) {
                    NSLog(@"coincides");
                    [addTabBar setSelectedItem:[[addTabBar items] objectAtIndex:i]];
                    break;
                }
                else
                {
                    [addTabBar setSelectedItem:nil];
                }
            }
        [self showLeftController];
            ;
           break;  
        }
            case 1: // from the tabbar
        {
            break;
        }
        default:
            break;
    }
    switch (index) {
            case 0:
        {
            indexOfCurrentController = 0;
            [addMainViewOfInitialNavigatiionController addSubview:addSearchBar];
            self.navigationItem.title = @"Площадки";
            addCategoryButton.frame = CGRectMake(addMainViewOfInitialNavigatiionController.frame.origin.x +11, addMainViewOfInitialNavigatiionController.frame.origin.y + addSearchBar.frame.size.height, addCategoryButton.frame.size.width, addCategoryButton.frame.size.height);
            
            [addCategoryButton addTarget:self
                     action:@selector(pushCategorySelector)
           forControlEvents:UIControlEventTouchUpInside];
            [addMainViewOfInitialNavigatiionController addSubview:addCategoryButton];
            addUITableView.frame = CGRectMake(addMainViewOfInitialNavigatiionController.frame.origin.x + 7,addCategoryButton.frame.origin.y+ addCategoryButton.frame.size.height + 6, addMainViewOfInitialNavigatiionController.frame.size.width -14, addMainViewOfInitialNavigatiionController.frame.size.height - addSearchBar.frame.size.height - addCategoryButton.frame.size.height -16);
            [addMainViewOfInitialNavigatiionController addSubview:addUITableView];
            alertToDisplayRegistration = [[UIAlertView alloc]initWithTitle:@"Загрузка данных" message:@"" delegate:nil cancelButtonTitle:nil otherButtonTitles:nil];
            [alertToDisplayRegistration show];
            if(alertToDisplayRegistration != nil) {
                UIActivityIndicatorView *indicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
                
                indicator.center = CGPointMake(alertToDisplayRegistration.bounds.size.width/2,alertToDisplayRegistration.bounds.size.height-45);
                [indicator startAnimating];
                [alertToDisplayRegistration addSubview:indicator];
            }
            MYAFnETWORKINGmANAGER *afNetManager = [[MYAFnETWORKINGmANAGER alloc]init];
            afNetManager.delegate = self;
            [afNetManager searchPlacesByName:nil byCategory:[SingletonForGlobalVariables sharedMySingleton].CATEGORY_TO_SORT_PLACES byGenre:nil byMetro:nil byDistrict:nil byOfs:nil byLim:nil];
            break;
        }
        case 1:
        {
            indexOfCurrentController = 1;
            addMeropriyatiyaInitialView.frame = addMainViewOfInitialNavigatiionController.frame;
            [addMeropriyatiyaInitialView addSubview:addSearchBar];[addMainViewOfInitialNavigatiionController addSubview:addMeropriyatiyaInitialView];
            addUITableView.frame = CGRectMake(addMeropriyatiyaInitialView.frame.origin.x + 7, addMeropriyatiyaInitialView.frame.origin.y + addSearchBar.frame.size.height, addMeropriyatiyaInitialView.frame.size.width -14, addMeropriyatiyaInitialView.frame.size.height - 7);
            [addMeropriyatiyaInitialView addSubview:addUITableView];
            UIImage *faceImage = [UIImage imageNamed:@"callButton.png"];
            UIButton *face = [UIButton buttonWithType:UIButtonTypeCustom];
            face.bounds = CGRectMake( 0, 0, 30, 30);
            [face setImage:faceImage forState:UIControlStateNormal];
            [face addTarget:self
                          action:@selector(callTheNumber)
                forControlEvents:UIControlEventTouchUpInside];
            UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithCustomView:face];
            self.navigationItem.rightBarButtonItem = rightButton;
            self.navigationItem.title = @"Мероприятия";
            addMeropriyatiyaViewDateLabel.backgroundColor = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"dateBG"]];
            MYAFnETWORKINGmANAGER *afNetManager = [[MYAFnETWORKINGmANAGER alloc]init];
            afNetManager.delegate = self;
            [afNetManager searchActionsByPlace:nil byName:addSearchBar.text byPeople:nil byCategory:[SingletonForGlobalVariables sharedMySingleton].CATEGORY_TO_SORT_ACTIONS byGenre:nil byOrder:nil bySdt:nil byEdt:nil byOfs:nil byLim:nil all:nil];
            alertToDisplayRegistration = [[UIAlertView alloc]initWithTitle:@"Загрузка данных" message:@"" delegate:nil cancelButtonTitle:nil otherButtonTitles:nil];
            [alertToDisplayRegistration show];
            if(alertToDisplayRegistration != nil) {
                UIActivityIndicatorView *indicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
                
                indicator.center = CGPointMake(alertToDisplayRegistration.bounds.size.width/2,alertToDisplayRegistration.bounds.size.height-45);
                [indicator startAnimating];
                [alertToDisplayRegistration addSubview:indicator];
            }
            break;
        }
            case 2:
        {
            indexOfCurrentController = 2;
            break;
        }
            case 5:
        {
            indexOfCurrentController = 5;
            addSettingsInitialView.frame = addMainViewOfInitialNavigatiionController.frame;
            [addMainViewOfInitialNavigatiionController addSubview:addSettingsInitialView];
            UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithTitle:@"Coхранить"
                                                                            style:UIBarButtonSystemItemDone target:nil action:nil];
            self.navigationItem.rightBarButtonItem = rightButton;
            
            break;
        }
            case 11:
        {
            indexOfCurrentController = 11;
            NSLog(@"ANONS");
            UIImage *faceImage = [UIImage imageNamed:@"callButton.png"];
            UIButton *face = [UIButton buttonWithType:UIButtonTypeCustom];
            face.bounds = CGRectMake( 0, 0, 30, 30);
            [face setImage:faceImage forState:UIControlStateNormal];
            [face addTarget:self
                     action:@selector(callTheNumber)
           forControlEvents:UIControlEventTouchUpInside];
            UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithCustomView:face];
            self.navigationItem.rightBarButtonItem = rightButton;
            self.navigationItem.title = @"Анонс";
            
            addUITableView.frame = CGRectMake(addMainViewOfInitialNavigatiionController.frame.origin.x + 6, addMainViewOfInitialNavigatiionController.frame.origin.y + 6, addMainViewOfInitialNavigatiionController.frame.size.width - 12, addMainViewOfInitialNavigatiionController.frame.size.height -12);
            [addMainViewOfInitialNavigatiionController addSubview:addUITableView];
            
            MYAFnETWORKINGmANAGER *afNetManager = [[MYAFnETWORKINGmANAGER alloc]init];
            afNetManager.delegate = self;
            [afNetManager searchActionsByPlace:nil byName:nil byPeople:nil byCategory:nil byGenre:nil byOrder:nil bySdt:nil byEdt:nil byOfs:nil byLim:nil all:nil];
            alertToDisplayRegistration = [[UIAlertView alloc]initWithTitle:@"Загрузка данных" message:@"" delegate:nil cancelButtonTitle:nil otherButtonTitles:nil];
            [alertToDisplayRegistration show];
            
            if(alertToDisplayRegistration != nil) {
                UIActivityIndicatorView *indicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
                
                indicator.center = CGPointMake(alertToDisplayRegistration.bounds.size.width/2,alertToDisplayRegistration.bounds.size.height-45);
                [indicator startAnimating];
                [alertToDisplayRegistration addSubview:indicator];
            }
            break;
        }
        default:
            break;
    }
    

}
-(void)removeAllSubviews
{
    
        [addSettingsInitialView removeFromSuperview];
    self.navigationItem.rightBarButtonItem = nil;
    [self showLeftController];
}
#pragma mark UITabBarDelegateMethods
- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item
{
    
    
    NSLog(@"%i %@ %i" , [[tabBar items] indexOfObject:item], item.title, [[SingletonForGlobalVariables sharedMySingleton].SECTIONS indexOfObject:item.title]);
    [self pushAControllerWithIndex:[[SingletonForGlobalVariables sharedMySingleton].SECTIONS indexOfObject:item.title] source:1];
}



- (IBAction)addMeropriyatiyaViewDateButtonClick:(id)sender {
    DateViewController *controller = [[DateViewController alloc] initWithNibName:@"DateViewController" bundle:nil];
    
    self.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:controller animated:YES];
    self.hidesBottomBarWhenPushed = NO;
}
-(void)callTheNumber
{
    UIDevice *device = [UIDevice currentDevice];
    if ([[device model] isEqualToString:@"iPhone"] ) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"tel:%@", [SingletonForGlobalVariables sharedMySingleton].NUMBER_TO_CALL]]];
    } else {
        UIAlertView *Notpermitted=[[UIAlertView alloc] initWithTitle:@"Внимание" message:@"Данная функция не поддерживается." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [Notpermitted show];
    }
}
-(void)pushCategorySelector
{
    NACategoryViewController *controller = [[NACategoryViewController alloc] initWithNibName:@"NACategoryViewController" bundle:nil];
    controller.whatToSet = 1;
    [self.navigationController pushViewController:controller animated:YES];
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
    if (indexOfCurrentController == 0) {
        return [placesLocal count];
    }
    else
    {
    return [actionsLocal count] + 1;//Место для фильтров
    }
}
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row % 2) {
    } else {
        cell.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"cellBG.png"]];
    }
    
    if ((indexOfCurrentController == 1) && (indexPath.row == 0)){
        cell.backgroundColor = [UIColor lightGrayColor];
    }
}

UITableViewCell *cell;
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"CountryCell";
    cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];

    switch (indexOfCurrentController) {
         case 0:
        {
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            NAPlaceFound *place = (NAPlaceFound*)[placesLocal objectAtIndex:indexPath.row];
            
            CGSize textSize  = [place.placeShortTitle sizeWithFont:[UIFont systemFontOfSize:14.0f] constrainedToSize:CGSizeMake(cell.frame.size.width - 20, 1000.0f)];
            
            UILabel *title = [[UILabel alloc]initWithFrame:CGRectMake(cell.frame.origin.x + 15,cell.frame.origin.y + 6, cell.frame.size.width - 20, textSize.height)];
            title.backgroundColor = [UIColor clearColor];
            title.numberOfLines = 2;
            title.font = [title.font fontWithSize:14];
            title.text = place.placeShortTitle;
            [cell addSubview:title];
            
            UIImageView *addressImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"9x12map.png"]];
            addressImage.frame =CGRectMake(title.frame.origin.x, title.frame.origin.y + title.frame.size.height + 3, 9, 12);
                       [cell addSubview:addressImage];
            UILabel *address = [[UILabel alloc]initWithFrame:CGRectMake(title.frame.origin.x+ 20, title.frame.origin.y + title.frame.size.height + 3-12, title.frame.size.width, cell.frame.size.height - title.frame.size.height + 10)];
            address.numberOfLines = 0;
            address.font = [address.font fontWithSize:10];
            address.backgroundColor = [UIColor clearColor];
            address.text = place.placeAddress;
            [cell addSubview:address];
            
            UIImageView *metroImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"14x12metro.png"]];
            metroImage.frame =CGRectMake(title.frame.origin.x, addressImage.frame.origin.y + addressImage.frame.size.height +5, 9, 12);
            [cell addSubview:metroImage];
            UILabel *metro = [[UILabel alloc]initWithFrame:CGRectMake(title.frame.origin.x+ 20, address.frame.origin.y + address.frame.size.height + 3-22, address.frame.size.width, cell.frame.size.height - title.frame.size.height + 10)];
            metro.numberOfLines = 0;
            metro.font = [metro.font fontWithSize:10];
            metro.backgroundColor = [UIColor clearColor];
            metro.text = [[SingletonForGlobalVariables sharedMySingleton].METROLIST objectForKey:place.placeMetroId];
            [cell addSubview:metro];

            
            UIImageView *distImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"82x23guyToPlace.png"]];
            distImage.frame =CGRectMake(title.frame.origin.x, metroImage.frame.origin.y + metroImage.frame.size.height +5, 50, 14);
            [cell addSubview:distImage];
            UILabel *dist = [[UILabel alloc]initWithFrame:CGRectMake(distImage.frame.size.width + distImage.frame.origin.x + 5, metro.frame.origin.y + metro.frame.size.height + 3-22,metro.frame.size.width, cell.frame.size.height - title.frame.size.height + 10)];
            dist.numberOfLines = 0;
            dist.font = [metro.font fontWithSize:10];
            dist.backgroundColor = [UIColor clearColor];
            
          
             CLLocation *locA = [[CLLocation alloc] initWithLatitude:locationManager.location.coordinate.latitude longitude:locationManager.location.coordinate.longitude];
            
             CLLocation *locB = [[CLLocation alloc] initWithLatitude:[place.placeLatitude doubleValue]   longitude:[place.placeLongitude doubleValue]];
            
            CLLocationDistance distance = [locA distanceFromLocation:locB];
            
            dist.text = [NSString stringWithFormat:@"%.1f м", distance];
            [cell addSubview:dist];
            break;
        }
        case 1:
        {   
            if (indexPath.row == 0){
                NAActionFilterCell *cell = (NAActionFilterCell *)[tableView dequeueReusableCellWithIdentifier:@"NAActionFilterCell"];
                
                if (cell == nil) {
                    NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"NAActionFilterCell" owner:self options:nil];
                    cell = (NAActionFilterCell *)[nib objectAtIndex:0];
                }
                
                if ([SingletonForGlobalVariables sharedMySingleton].CATEGORY_TO_SORT_ACTIONS != nil){
                    
                    int  cat_id = [[SingletonForGlobalVariables sharedMySingleton].CATEGORY_TO_SORT_ACTIONS integerValue];
                    
                    NACategory *cat;
                    
                    for (int i=0; i < [[SingletonForGlobalVariables sharedMySingleton].CATEGORIES count]; i++){
                        cat = (NACategory *)[[SingletonForGlobalVariables sharedMySingleton].CATEGORIES objectAtIndex:i];
                        if (cat_id == [cat.categoryId integerValue]){
                            break;
                        }
                    }
                    
                    [cell.categoryButton setTitle:cat.categoryTitle forState:UIControlStateNormal];
                }else{
                    [cell.categoryButton setTitle:@"категория" forState:UIControlStateNormal];
                }
                
                return cell;
            }
            
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            NAAction *action = (NAAction*)[actionsLocal objectAtIndex:indexPath.row - 1];
            CGSize textSize  = [action.actionTitle sizeWithFont:[UIFont systemFontOfSize:12.0f] constrainedToSize:CGSizeMake(210, 1000.0f)];
//            UIView *labelBG = [[UIView alloc]initWithFrame:CGRectMake(cell.frame.origin.x + 6, cell.frame.origin.y + 20,cell.frame.size.width - 12, textSize.height)];
//            labelBG.backgroundColor = [UIColor yellowColor];
//            [labelBG.layer setCornerRadius:5.0];
//            [labelBG.layer setMasksToBounds:YES];
//            [cell addSubview:labelBG];

            //cell.imageView.image = [UIImage imageNamed:@"aboutS"];
            UILabel *title = [[UILabel alloc]initWithFrame:CGRectMake(cell.frame.origin.x + 6,cell.frame.origin.y + 6, cell.frame.size.width - 12, textSize.height)];
            title.backgroundColor = [UIColor clearColor];
            title.numberOfLines = 2;
            title.font = [title.font fontWithSize:12];
            title.text = action.actionTitle;
            [cell addSubview:title];
            UIImageView *dateImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"dateRed.png"]];
            dateImage.frame =CGRectMake(30, 50, 14, 14);
            [cell addSubview:dateImage];
            UILabel *date = [[UILabel alloc] initWithFrame:CGRectMake(cell.frame.origin.x + 60, dateImage.frame.origin.y + 3 , 200, 12)];
            
            NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
            [dateFormatter setDateFormat:@"dd.MM.yyyy"];
            NSString *dateString = [dateFormatter stringFromDate:action.actionDate];
            date.text = dateString;
            date.font = [date.font fontWithSize:10];
            date.backgroundColor = [UIColor clearColor];
            [cell addSubview:date];
            UILabel *place = [[UILabel alloc]initWithFrame:CGRectMake(cell.frame.origin.x + 6,cell.frame.origin.y + 25, cell.frame.size.width - 12, textSize.height)];
            place.backgroundColor = [UIColor clearColor];
            place.numberOfLines = 2;
            place.font = [title.font fontWithSize:12];
            place.text = action.actionPlaceId;
            [cell addSubview:place];
            
//            UILabel *description = [[UILabel alloc]initWithFrame:CGRectMake(title.frame.origin.x, labelBG.frame.origin.y + labelBG.frame.size.height + 3, title.frame.size.width, cell.frame.size.height - labelBG.frame.size.height + 10)];
//            description.numberOfLines = 0;
//            description.font = [description.font fontWithSize:10];
//            description.backgroundColor = [UIColor clearColor];
//            description.text = action.actionAnn;
//            [cell addSubview:description];
            
            
            break;
        }
        case 11://Анонсы
        {
            NAAction *action = (NAAction*)[actionsLocal objectAtIndex:indexPath.row];
            
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            
            UIImageView *tmpImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"aboutS"]];
            [cell addSubview:tmpImageView];
            [tmpImageView setCenter:CGPointMake(43, 43)];
            
            cell.imageView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString: [NSString stringWithFormat:@"http://www.bileter.ru/view_img.php?id=%@", action.actionImageId]]]];
            UILabel *date = [[UILabel alloc] initWithFrame:CGRectMake(cell.frame.origin.x + 90, cell.frame.origin.y+7, 180, 12)];
            [cell addSubview:cell.imageView];
            
            NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
            [dateFormatter setDateFormat:@"dd.MM.yyyy HH.mm"];
            
            NSString *dateString = [dateFormatter stringFromDate:action.actionDate];
            date.text = dateString;
            date.font = [UIFont boldSystemFontOfSize:10.0];
            date.backgroundColor = [UIColor clearColor];
            [cell addSubview:date];
            
            CGSize textSize  = [action.actionTitle sizeWithFont:[UIFont systemFontOfSize:12.0f] constrainedToSize:CGSizeMake(185, 1000.0f)];
            UIView *labelBG = [[UIView alloc]initWithFrame:CGRectMake(cell.frame.origin.x + 90, cell.frame.origin.y + 20, textSize.width + 10, textSize.height + 6)];
            labelBG.backgroundColor = [UIColor colorWithRed:253.0f/255.0f green:217.0f/255.0f blue:17.0f/255.0f alpha:1.0f];
            [labelBG.layer setCornerRadius:5.0];
            [labelBG.layer setMasksToBounds:YES];
            [cell addSubview:labelBG];
            
            UILabel *title = [[UILabel alloc]initWithFrame:CGRectMake(labelBG.frame.origin.x + 5,labelBG.frame.origin.y, labelBG.frame.size.width - 5, labelBG.frame.size.height)];
            title.backgroundColor = [UIColor clearColor];
            title.numberOfLines = 2;
            title.font = [title.font fontWithSize:12];
            title.text = action.actionTitle;
            [cell addSubview:title];
            
            UILabel *description = [[UILabel alloc]initWithFrame:CGRectMake(title.frame.origin.x, labelBG.frame.origin.y + labelBG.frame.size.height + 3, title.frame.size.width, cell.frame.size.height - labelBG.frame.size.height + 10)];
            description.numberOfLines = 0;
            description.font = [description.font fontWithSize:10];
            description.backgroundColor = [UIColor clearColor];
            description.text = action.actionAnn;
            [cell addSubview:description];
            

            break;
        }
            
            
        default:
            break;
    }
    return cell;
    }

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexOfCurrentController) {
        case 0:
        {
            NSLog(@"here");
            NADetailedPlaceViewController *controller = [[NADetailedPlaceViewController alloc] initWithNibName:@"NADetailedPlaceViewController" bundle:nil];
            controller.place = [placesLocal objectAtIndex:indexPath.row];
            [self.navigationController pushViewController:controller animated:YES];
            break;
        }
            case 1:
        {
            NADetailedActionViewController *controller = [[NADetailedActionViewController alloc] initWithNibName:@"NADetailedActionViewController" bundle:nil];
            controller.action = [actionsLocal objectAtIndex:indexPath.row - 1];
            [self.navigationController pushViewController:controller animated:YES];
            
            break;
        }
            case 11:
        {
            NADetailedActionViewController *controller = [[NADetailedActionViewController alloc] initWithNibName:@"NADetailedActionViewController" bundle:nil];
            controller.action = [actionsLocal objectAtIndex:indexPath.row];
            [self.navigationController pushViewController:controller animated:YES];
            break;
        }
            
            
        default:
            break;
    }
 
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ((indexOfCurrentController == 1) && (indexPath.row == 0)){
        return 130;
    }
    return 86;
}

#pragma mark Search Bar


- (void)searchBar:(UISearchBar *)theSearchBar textDidChange:(NSString *)searchText {
        }


- (IBAction)addActionCategorySortButtonClick:(id)sender {
    NACategoryViewController *controller = [[NACategoryViewController alloc] initWithNibName:@"NACategoryViewController" bundle:nil];
    controller.whatToSet =0;
    [self.navigationController pushViewController:controller animated:YES];
}

- (IBAction)addActionPlaceSortButtonClick:(id)sender {
    NAPlacesViewController *controller = [[NAPlacesViewController alloc] initWithNibName:@"NAPlacesViewController" bundle:nil];
    controller.whatToSet = 0;
    [self.navigationController pushViewController:controller animated:YES];
}
@end
