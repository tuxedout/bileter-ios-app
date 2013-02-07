//
//  SingletonForGlobalVariables.m
//  iRimes
//
//  Created by Administrator on 7/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SingletonForGlobalVariables.h"

@implementation SingletonForGlobalVariables


@synthesize SESSION_KEY;
@synthesize USER_ID;
@synthesize mainController;
@synthesize SECTIONS;
@synthesize NUMBER_TO_CALL;
@synthesize CATEGORIES;
@synthesize GENRELIST;
@synthesize METROLIST;
@synthesize DISTRICTLIST;
@synthesize CATEGORY_TO_SORT_PLACES;
@synthesize CATEGORY_TO_SORT_ACTIONS;
@synthesize PLACE_TO_SORT_ACTIONS;

static SingletonForGlobalVariables * sharedMySingleton = NULL;

+(SingletonForGlobalVariables *)sharedMySingleton {
    if (!sharedMySingleton || sharedMySingleton == NULL) {
		sharedMySingleton = [SingletonForGlobalVariables new];
        sharedMySingleton.SESSION_KEY=
        @"";
        sharedMySingleton.USER_ID=@"";
        sharedMySingleton.NUMBER_TO_CALL = @"+78123808050";
        sharedMySingleton.SECTIONS = [[NSArray alloc] initWithObjects:@"Площадки",@"Мероприятия",@"Кассы",@"Заказы",@"Избранное",@"Настройки",@"Билетёр",@"Площадки",@"Акции",@"Новости",@"Популярное",@"Анонс",@"Полезная информация",@"Правила заказа",@"Контакты",@"О билетере", nil];
        sharedMySingleton.CATEGORIES = [[NSArray alloc]init];
        sharedMySingleton.DISTRICTLIST = [[NSDictionary alloc]init];
        sharedMySingleton.METROLIST =[[NSDictionary alloc]init];
        sharedMySingleton.GENRELIST = [[NSDictionary alloc]init];
        sharedMySingleton.CATEGORY_TO_SORT_PLACES = nil;
        sharedMySingleton.CATEGORY_TO_SORT_ACTIONS = nil;
        sharedMySingleton.PLACE_TO_SORT_ACTIONS = nil;
	}
	return sharedMySingleton;
}



@end
