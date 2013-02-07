//
//  NAAction.h
//  Bileter
//
//  Created by Admin on 1/25/13.
//  Copyright (c) 2013 Search Concepts AG. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NAAction : NSObject
{
    NSString* actionId;
    NSString* actionPlaceId;
    NSString* actionPriceMin;
    NSString* actexId;
    NSDate* actionDate;
    NSString* actionDuration;
    NSString* actionPriceMax;
    NSArray* actionCategories;
    NSString *acitonImageId;
    NSString *actionAnn;
    NSString *acitonKdmtp;
    NSString *actionTitle;
    NSString *actionGenreTitle;
    NSString *acitonHallId;
}

@property (nonatomic, retain) NSString* actionId;
@property (nonatomic, retain) NSString* actionPlaceId;
@property (nonatomic, retain) NSString* actionPriceMin;
@property (nonatomic, retain) NSString* actexId;
@property (nonatomic, retain) NSDate* actionDate;
@property (nonatomic, retain) NSString* actionDuration;
@property (nonatomic, retain) NSString* actionPriceMax;
@property (nonatomic, retain) NSArray* actionCategories;
@property (nonatomic, retain) NSString *actionImageId;
@property (nonatomic, retain) NSString *actionAnn;
@property (nonatomic, retain) NSString *actionKdmtp;
@property (nonatomic, retain) NSString *actionTitle;
@property (nonatomic, retain) NSString *actionGenreTitle;
@property (nonatomic, retain) NSString *actionHallId;

@end