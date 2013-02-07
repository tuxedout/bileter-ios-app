//
//  NACategoryViewController.h
//  Bileter
//
//  Created by Admin on 1/27/13.
//  Copyright (c) 2013 Search Concepts AG. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"
@interface NACategoryViewController : UIViewController
{
    int whatToSet;
}
@property (nonatomic) int whatToSet;
@property (weak, nonatomic) IBOutlet UITableView *addUITableView;

@end
