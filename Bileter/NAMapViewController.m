//
//  NAMapViewController.m
//  Bileter
//
//  Created by Admin on 1/27/13.
//  Copyright (c) 2013 Search Concepts AG. All rights reserved.
//

#import "NAMapViewController.h"

@interface NAMapViewController ()

@end

@implementation NAMapViewController
@synthesize place;
@synthesize addMapView;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    CLLocationCoordinate2D zoomLevel1CenterCoordinate = {[place.placeLatitude floatValue],[place.placeLongitude floatValue]}; //46.983251,7.602539 - Switzerland - Center of the World
    [addMapView setCenterCoordinate:zoomLevel1CenterCoordinate];
    MKCoordinateRegion region;
    region.center=zoomLevel1CenterCoordinate;   // location
    MKCoordinateSpan span; //A structure that defines the area spanned by a map region.
    span.latitudeDelta=0.008;               //  0.001 to 120
    span.longitudeDelta=0.008;
    region.span=span;
    [addMapView setRegion:region animated:YES];
    MKPointAnnotation *pa = [[MKPointAnnotation alloc] init];
    pa.coordinate = addMapView.centerCoordinate;
    pa.title = @"Map Center";
    pa.subtitle = [NSString stringWithFormat:@"%f, %f", pa.coordinate.latitude, pa.coordinate.longitude];
    [addMapView addAnnotation:pa];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - mapViewDelegate methods



@end
