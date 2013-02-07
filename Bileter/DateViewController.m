//
//  DateViewController.m
//  Bileter
//
//  Created by Admin on 1/25/13.
//  Copyright (c) 2013 Search Concepts AG. All rights reserved.
//

#import "DateViewController.h"

@interface DateViewController ()

@end

@implementation DateViewController
@synthesize addSinceButton;
@synthesize addTillButton;
@synthesize addUIDatePicker;
NSDate *since;
NSDate *till;
bool changedSince;
bool changedTill;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (void)viewWillAppear:(BOOL)animated {
    since =  (NSDate *)[[NSUserDefaults standardUserDefaults] objectForKey:@"sinceDateMeropriyatiya"];
    till =  (NSDate *)[[NSUserDefaults standardUserDefaults] objectForKey:@"tillDateMeropriyatiya"];
    if (since == nil) {
        since = [NSDate date];
    }
    if (till == nil) {
        till = [NSDate dateWithTimeInterval:(24*60*60) sinceDate:[NSDate date]];
    }
    addUIDatePicker.date = since;
    
    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd.MM.yy hh.mm"];
    [addSinceButton setTitle:[NSString stringWithFormat:@"С %@", [dateFormatter stringFromDate:since]] forState: UIControlStateNormal];
    [addTillButton setTitle:[NSString stringWithFormat:@"До %@", [dateFormatter stringFromDate:till]] forState:UIControlStateNormal];
   
    
}
- (void)viewDidLoad
{
    [super viewDidLoad];
     
}
- (void)viewWillDisappear:(BOOL)animated
{
    [[NSUserDefaults standardUserDefaults] setObject:since forKey:@"sinceDateMeropriyatiya"];
    [[NSUserDefaults standardUserDefaults] setObject:till forKey:@"tillDateMeropriyatiya"];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)addSinceButtonClick:(id)sender {
    addUIDatePicker.minimumDate = nil;
    [addUIDatePicker setDate:since animated:YES];
    addUIDatePicker.frame = CGRectMake(0, self.view.frame.origin.y+self.view.frame.size.height - addUIDatePicker.frame.size.height, addUIDatePicker.frame.size.width, addUIDatePicker.frame.size.height);
    [self.view addSubview:addUIDatePicker];
    
}

- (IBAction)addTillButtonClick:(id)sender {
    since = addUIDatePicker.date;
    addUIDatePicker.minimumDate = since;
    [addUIDatePicker setDate:till animated:YES];
    addUIDatePicker.frame = CGRectMake(0, self.view.frame.origin.y+self.view.frame.size.height - addUIDatePicker.frame.size.height, addUIDatePicker.frame.size.width, addUIDatePicker.frame.size.height);
    [self.view addSubview:addUIDatePicker];
}

- (IBAction)addTodayButtonClick:(id)sender {
    [addUIDatePicker removeFromSuperview];
    since = [NSDate date];
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSDateComponents *components = [cal components:( NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit ) fromDate:[[NSDate alloc] init]];
    [components setHour:23];
    [components setMinute:59];
    [components setSecond:59];
    till =  [cal dateByAddingComponents:components toDate: since options:0];
    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd.MM.yy hh.mm"];
    [addSinceButton setTitle:[NSString stringWithFormat:@"С %@", [dateFormatter stringFromDate:since]] forState: UIControlStateNormal];
    [addTillButton setTitle:[NSString stringWithFormat:@"До %@", [dateFormatter stringFromDate:till]] forState:UIControlStateNormal];
    [self.navigationController popViewControllerAnimated:YES];
    
}

- (IBAction)addTomorrowButtonClick:(id)sender {
    [addUIDatePicker removeFromSuperview];
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSDateComponents *components = [cal components:( NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit ) fromDate:[[NSDate alloc] init]];
    [components setHour:00];
    [components setMinute:00];
    [components setSecond:01];
    since =  [cal dateByAddingComponents:components toDate: [NSDate dateWithTimeInterval:(24*60*60) sinceDate:[NSDate date]] options:0];
    
    
    NSCalendar *cal2 = [NSCalendar currentCalendar];
    NSDateComponents *components2 = [cal2 components:( NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit ) fromDate:[[NSDate alloc] init]];
    [components2 setHour:23];
    [components2 setMinute:59];
    [components2 setSecond:59];
    till =  [cal2 dateByAddingComponents:components2 toDate:since options:0];
    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd.MM.yy hh.mm"];
    [addSinceButton setTitle:[NSString stringWithFormat:@"С %@", [dateFormatter stringFromDate:since]] forState: UIControlStateNormal];
    [addTillButton setTitle:[NSString stringWithFormat:@"До %@", [dateFormatter stringFromDate:till]] forState:UIControlStateNormal];
}

- (IBAction)addDayOffsButtonClick:(id)sender {
    [addUIDatePicker removeFromSuperview];
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSDateComponents *components = [cal components:(NSWeekdayCalendarUnit| NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit ) fromDate:[[NSDate alloc] init]];
    [components setWeekday:7];
    [components setHour:00];
    [components setMinute:00];
    [components setSecond:01];
    since =  [cal dateByAddingComponents:components toDate:[NSDate date] options:0];
    
    
    NSCalendar *cal2 = [NSCalendar currentCalendar];
    NSDateComponents *components2 = [cal2 components:(NSWeekdayCalendarUnit| NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit ) fromDate:[[NSDate alloc] init]];
    [components2 setWeekday:1];
    [components2 setHour:23];
    [components2 setMinute:59];
    [components2 setSecond:59];
    till =  [cal2 dateByAddingComponents:components2 toDate:since options:0];
    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd.MM.yy hh.mm"];
    [addSinceButton setTitle:[NSString stringWithFormat:@"С %@", [dateFormatter stringFromDate:since]] forState: UIControlStateNormal];
    [addTillButton setTitle:[NSString stringWithFormat:@"До %@", [dateFormatter stringFromDate:till]] forState:UIControlStateNormal];
}

- (IBAction)addNextWeekButtonClick:(id)sender {
    [addUIDatePicker removeFromSuperview];
}
-(NSDate *)getStartTime:(int)nOfDays fromDate:(NSDate*)now
{
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSDateComponents *components = [cal components:( NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit ) fromDate:[[NSDate alloc] init]];
    [components setHour:-24*nOfDays];
    [components setMinute:0];
    [components setSecond:0];
    return [cal dateByAddingComponents:components toDate: now options:0];
}

@end
