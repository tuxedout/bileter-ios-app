//
//  SingletonForGlobalVariables.h
//  iRimes
//
//  Created by Administrator on 7/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SingletonForGlobalVariables : NSObject <NSXMLParserDelegate>
{
    NSString* SESSION_KEY;
    NSString* NUMBER_TO_CALL;
    NSString* USER_ID;
    UIViewController *mainController;
    NSDictionary *SECTIONS;
    NSArray *CATEGORIES;
    NSDictionary *GENRELIST;
    NSDictionary *METROLIST;
    NSDictionary *DISTRICTLIST;
    NSString *CATEGORY_TO_SORT_PLACES;
    NSString *CATEGORY_TO_SORT_ACTIONS;
    NSString *PLACE_TO_SORT_ACTIONS;
}

@property (nonatomic, retain)NSDictionary *GENRELIST;
@property (nonatomic, retain)NSDictionary *METROLIST;
@property (nonatomic, retain)NSDictionary *DISTRICTLIST;
@property (nonatomic, retain) NSString *SESSION_KEY;
@property (nonatomic, retain) NSString *NUMBER_TO_CALL;
@property (nonatomic, retain) NSString *USER_ID;
@property (nonatomic, retain) UIViewController *mainController;
@property (nonatomic, retain) NSDictionary *SECTIONS;
@property (nonatomic, retain) NSArray *CATEGORIES;
@property (nonatomic, retain) NSString *CATEGORY_TO_SORT_PLACES;
@property (nonatomic, retain) NSString *CATEGORY_TO_SORT_ACTIONS;
@property (nonatomic, retain) NSString *PLACE_TO_SORT_ACTIONS;
+(SingletonForGlobalVariables *)sharedMySingleton;





@end
