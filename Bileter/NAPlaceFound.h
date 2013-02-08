//
//  NAPlaceFound.h
//  Bileter
//
//  Created by Admin on 1/28/13.
//  Copyright (c) 2013 Search Concepts AG. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NAPlaceFound : NSObject
{
    int placeSortOrder;
    NSString *placeId;
    NSString *placeTitle;
    NSString *placeMetroId;
    NSArray *placeGenres;
    NSString *placeAddress;
    NSString *placeDistrictID;
    NSString *placeShortTitle;
    NSString *placeLatitude;
    NSString *placeLongitude;
    NSArray *placeCategories;
}

@property (nonatomic) int placeSortOrder;
@property (nonatomic, retain)NSString *placeId;
@property (nonatomic, retain)NSString *placeTitle;
@property (nonatomic, retain)NSString *placeMetroId;
@property (nonatomic, retain)NSArray *placeGenres;
@property (nonatomic, retain)NSString *placeAddress;
@property (nonatomic, retain)NSString *placeDistrictID;
@property (nonatomic, retain)NSString *placeShortTitle;
@property (nonatomic, retain)NSString *placeLatitude;
@property (nonatomic, retain)NSString *placeLongitude;
@property (nonatomic, retain)NSArray *placeCategories;

@end
