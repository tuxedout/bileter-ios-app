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
        sharedMySingleton.SECTIONS = [[NSDictionary alloc] initWithObjectsAndKeys:   @"Площадки",@"0",
                                      @"Мероприятия",@"1",
                                      @"Кассы",@"2",
                                      @"Заказы",@"3",
                                      @"Избранное",@"4",
                                      @"Настройки",@"5",
                                      @"Билетёр",@"6",
                                      @"Акции",@"7",
                                      @"Новости",@"8",
                                      @"Популярное",@"9",
                                      @"Анонсы",@"10",
                                      @"Полезная информация",@"11",
                                      @"Правила заказа",@"12",
                                      @"Контакты",@"13",
                                      @"О билетере",@"14",
                                      nil];
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
