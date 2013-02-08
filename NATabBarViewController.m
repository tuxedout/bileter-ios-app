//
//  NATabBarViewController.m
//  Bileter
//
//  Created by Admin on 2/7/13.
//  Copyright (c) 2013 Search Concepts AG. All rights reserved.
//

#import "NATabBarViewController.h"

@interface NATabBarViewController ()

@end

@implementation NATabBarViewController
@synthesize addTabBar;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(void)setSelectedItem:(int)item
{
    [addTabBar setSelectedItem:[[addTabBar items] objectAtIndex:item]];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    [addTabBar setSelectedImageTintColor:[UIColor whiteColor]];
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item
{
       ViewController *view = (ViewController *)[SingletonForGlobalVariables sharedMySingleton].mainController;
    NSArray *temp = [[SingletonForGlobalVariables sharedMySingleton].SECTIONS allKeysForObject:[NSString stringWithFormat:@"%@", item.title]];
    NSString *key = [temp objectAtIndex:0];
    [view pushAControllerWithIndex:[key integerValue] source:1];

}

@end
