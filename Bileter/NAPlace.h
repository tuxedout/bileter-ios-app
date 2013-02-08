//
//  NAPlace.h
//  Bileter
//
//  Created by Admin on 1/26/13.
//  Copyright (c) 2013 Search Concepts AG. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NAPlace : NSObject
{
    NSString *placeShortTitle;
    NSString *placeAddress;
    NSString *placeDistrictID;
    NSString *placeMetroId;
    NSString *placeLongitude;
    NSString *placeDetail;
    NSString *placeLatitude;
    NSString *placeWayTo;
    NSString *placeTitle;
    NSString *placeId;
}

@property (nonatomic, retain)NSString *placeShortTitle;
@property (nonatomic, retain)NSString *placeAddress;
@property (nonatomic, retain)NSString *placeDistrictID;
@property (nonatomic, retain)NSString *placeMetroId;
@property (nonatomic, retain)NSString *placeLongitude;
@property (nonatomic, retain)NSString *placeDetail;
@property (nonatomic, retain)NSString *placeLatitude;
@property (nonatomic, retain)NSString *placeWayTo;
@property (nonatomic, retain)NSString *placeTitle;
@property (nonatomic, retain)NSString *placeId;
@end
