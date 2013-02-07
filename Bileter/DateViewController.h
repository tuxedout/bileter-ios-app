//
//  DateViewController.h
//  Bileter
//
//  Created by Admin on 1/25/13.
//  Copyright (c) 2013 Search Concepts AG. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DateViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *addSinceButton;
@property (weak, nonatomic) IBOutlet UIButton *addTillButton;
- (IBAction)addSinceButtonClick:(id)sender;
- (IBAction)addTillButtonClick:(id)sender;
- (IBAction)addTodayButtonClick:(id)sender;
- (IBAction)addTomorrowButtonClick:(id)sender;
- (IBAction)addDayOffsButtonClick:(id)sender;
- (IBAction)addNextWeekButtonClick:(id)sender;
@property (strong, nonatomic) IBOutlet UIDatePicker *addUIDatePicker;


@end
