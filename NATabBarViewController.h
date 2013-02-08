//
//  NATabBarViewController.h
//  Bileter
//
//  Created by Admin on 2/7/13.
//  Copyright (c) 2013 Search Concepts AG. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"
@interface NATabBarViewController : UIViewController <UITabBarDelegate>
@property (weak, nonatomic) IBOutlet UITabBar *addTabBar;
-(void)setSelectedItem:(int)item;
@end
