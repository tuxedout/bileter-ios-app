//
//  NAActionDetailed.h
//  Bileter
//
//  Created by Admin on 1/26/13.
//  Copyright (c) 2013 Search Concepts AG. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NAActionDetailed : NSObject{
    NSString *actionTitle;
    NSString *actionAnnotate;
    NSString *actionDescription;
    NSString *actionPlaceId;
    NSDate   *actionHallId;
    NSString *actionDirector;
    NSString *actionDuration;
    NSString *actionKDMTP;
    NSString *actionRatingDtzk;
    NSString *acitonRatingUser;
    NSString *actionImageId;
    NSArray  *actionActor;
    NSArray  *actionAuthor;
}

@property (nonatomic, retain) NSString *actionTitle;
@property (nonatomic, retain) NSString *actionAnnotate;
@property (nonatomic, retain) NSString *actionDescription;
@property (nonatomic, retain) NSString *actionPlaceId;
@property (nonatomic, retain) NSDate   *actionHallId;
@property (nonatomic, retain) NSString *actionDirector;
@property (nonatomic, retain) NSString *actionDuration;
@property (nonatomic, retain) NSString *actionKDMTP;
@property (nonatomic, retain) NSString *actionRatingDtzk;
@property (nonatomic, retain) NSString *actionRatingUser;
@property (nonatomic, retain) NSString *actionImageId;
@property (nonatomic, retain) NSArray  *actionActor;
@property (nonatomic, retain) NSArray  *actionAuthor;

@end
