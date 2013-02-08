//
//  NAMapViewController.h
//  Bileter
//
//  Created by Admin on 1/27/13.
//  Copyright (c) 2013 Search Concepts AG. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NAMapViewController : UIViewController
<MKMapViewDelegate, UIGestureRecognizerDelegate>
{
    NAPlace *place;
}
@property (weak, nonatomic) IBOutlet MKMapView *addMapView;
@property (nonatomic, retain) NAPlace *place;
@end
