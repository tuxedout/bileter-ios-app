//
//  MYAFnETWORKINGmANAGER.h
//  iRimes
//
//  Created by Administrator on 7/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFJSONRequestOperation.h"
#import "SBJson.h"
#import "NACategory.h"
#import "NAAction.h"
#import "NAActionDetailed.h"
#import "NAPlace.h"
#import "NAPlaceFound.h"
@protocol MyAFNetworkingProtocolDelegate<NSObject>
- (void)registrationStatus:(NSString *)status code:(int)code;
- (void)authentificationStatus:(NSString *)status code:(NSString*)code;
- (void)sessionKeyIsSet;
- (void)delegateFromMyAfNetworkingReturnsArrayOfActions:(NSArray *)actions;
- (void)delegateFromMyAfNetworkingReturnsPlacesFoundObject:(NSArray *)placesFound;
@end

@interface MYAFnETWORKINGmANAGER : NSObject
@property (nonatomic, assign)id <MyAFNetworkingProtocolDelegate> delegate;
-(void)setSessionKey;
-(void)registerAUserName:(NSString*)name surname:(NSString*)surname fatherName:(NSString*)fatherName password:(NSString*)password email:(NSString*)email phone:(NSString*)phone;
-(void)loginAUser:(NSString*)login password:(NSString*)password;
-(void)getListOfCategories;
-(void)searchActionsByPlace:(NSString *)place byName:(NSString*)name byPeople:(NSString*)people byCategory:(NSString*)category byGenre:(NSString*)genre byOrder:(NSString*)order bySdt:(NSString*)std byEdt:(NSString*)edt byOfs:(NSString*)ofs byLim:(NSString*)lim all:(NSString*)all;
-(void)searchPlacesByName:(NSString *)name byCategory:(NSString*)category byGenre:(NSString*)genre byMetro:(NSString*)metro byDistrict:(NSString*)district byOfs:(NSString*)ofs byLim:(NSString*)lim;
-(void)getPlaceInfo:(NSString*)place;
-(void)getActionInfo:(NSString*)action;

-(void)setDistrictList;
-(void)setMetroList;
-(void)setGenreList;
@end
