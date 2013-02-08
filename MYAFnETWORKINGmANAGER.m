//
//  MYAFnETWORKINGmANAGER.m
//  iRimes
//
//  Created by Administrator on 7/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
#import "NSData+Base64.h"
#import "SingletonForGlobalVariables.h"
@implementation MYAFnETWORKINGmANAGER
@synthesize delegate;
NSMutableArray *idsToRequestTheTimeline;
-(void)setSessionKey
{
    NSURL *url = [NSURL URLWithString:@"http://bileter.ru/api/?method=session_open&api_key=2408378c3530fdcefa5143e5a63c9ec1"];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:20000.0];
    [request setHTTPMethod:@"GET"];
    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
        dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0ul);
        dispatch_async(queue, ^{
            NSDictionary * dictionary = [[JSON JSONRepresentation]JSONValue];
            [SingletonForGlobalVariables sharedMySingleton].SESSION_KEY =[dictionary objectForKey:@"session_key"];
            dispatch_sync(dispatch_get_main_queue(), ^{
                SEL selector = @selector(sessionKeyIsSet);
                if (delegate && [delegate respondsToSelector:selector]) {
                    [delegate performSelector:selector];
                }
            });
        });
        

    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON){
        UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"Cannot ger session key" message:[NSString stringWithFormat:@"Report about error please %@",error] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alertView show];
        NSLog(@"1 %@,2 %@,3 %@" ,  response, error, [JSON JSONRepresentation]);
    }];
    [operation start];
}

-(void)closeSession
{
    NSURL *url = [NSURL URLWithString:[ NSString stringWithFormat:@"http://bileter.ru/api/?method=session_close&key=%@",[SingletonForGlobalVariables sharedMySingleton].SESSION_KEY]];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:20000.0];
    [request setHTTPMethod:@"GET"];
    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
        dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0ul);
        dispatch_async(queue, ^{
            NSLog(@"close session %@", [[JSON JSONRepresentation]JSONValue]);
            
        });
        
        
    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON){
        UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"Cannot close session" message:[NSString stringWithFormat:@"Report about error please %@",error] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alertView show];
        NSLog(@"1 %@,2 %@,3 %@" ,  response, error, [JSON JSONRepresentation]);
    }];
    [operation start];
}
-(void)registerAUserName:(NSString*)name surname:(NSString*)surname fatherName:(NSString*)fatherName password:(NSString*)password email:(NSString*)email phone:(NSString*)phone
{
    NSURL *url = [NSURL URLWithString:[ NSString stringWithFormat:@"http://bileter.ru/api/?method=user_register&key=%@&phone=%@&email=%@&name_f=%@&name_o=%@&name_i=%@&pass=%@",[SingletonForGlobalVariables sharedMySingleton].SESSION_KEY, phone, email, surname, fatherName, name, password] ];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:20000.0];
    [request setHTTPMethod:@"GET"];
    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
        NSLog(@"registration %@", [[JSON JSONRepresentation]JSONValue]);
        dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0ul);
        dispatch_async(queue, ^{
        dispatch_sync(dispatch_get_main_queue(), ^{
            
                SEL selector = @selector(registrationStatus: code:);
                if (delegate && [delegate respondsToSelector:selector]) {
                    [delegate performSelector:selector withObject:@"status" withObject:@"code"];
                }


        });
        });
        
        
        
    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON){
        UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"Cannot close session" message:[NSString stringWithFormat:@"Report about error please %@",error] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alertView show];
        NSLog(@"1 %@,2 %@,3 %@" ,  response, error, [JSON JSONRepresentation]);
    }];
    [operation start];
}

-(void)loginAUser:(NSString*)login password:(NSString*)password
{
    NSURL *url = [NSURL URLWithString:[ NSString stringWithFormat:@"http://bileter.ru/api/?method=user_auth&key=%@&login=%@&pass=%@",[SingletonForGlobalVariables sharedMySingleton].SESSION_KEY, login, password]];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:20000.0];
    [request setHTTPMethod:@"GET"];
    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
        NSLog(@"registration %@", [[JSON JSONRepresentation]JSONValue]);
        dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0ul);
        dispatch_async(queue, ^{
            dispatch_sync(dispatch_get_main_queue(), ^{
                NSDictionary * dictionary = [[JSON JSONRepresentation]JSONValue];
                NSLog(@"%@", [dictionary objectForKey:@"is_auth"]);
                NSString *code  = [dictionary objectForKey:@"is_auth"];
                SEL selector = @selector(authentificationStatus: code:);
                if (delegate && [delegate respondsToSelector:selector]) {
                    [delegate performSelector:selector withObject:@"status" withObject:code];
                }
                
                
            });
        });
        
        
        
    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON){
        UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"Cannot close session" message:[NSString stringWithFormat:@"Report about error please %@",error] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alertView show];
        NSLog(@"Changed 1 %@,2 %@,3 %@" ,  response, error, [JSON JSONRepresentation]);
    }];
    
    
    
    
    
    [operation start];
}




-(void)getPlaceInfo:(NSString*)place
{
    NSURL *url = [NSURL URLWithString:[ NSString stringWithFormat:@"http://bileter.ru/api/?method=place_info&key=%@&place=%@",[SingletonForGlobalVariables sharedMySingleton].SESSION_KEY, place]];
    NSLog(@"url - %@", url);
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:20000.0];
    [request setHTTPMethod:@"GET"];
    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
        dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0ul);
        dispatch_async(queue, ^{
            NSLog(@"Needede %@", [JSON JSONRepresentation]);
            NAPlace *placeToReturn = [[NAPlace alloc]init];
            NSDictionary * dictionary = [[JSON JSONRepresentation]JSONValue];
            NSDictionary *placeD = [dictionary objectForKey:@"place"];
            placeToReturn.placeShortTitle = [placeD objectForKey:@"short_title"];
            placeToReturn.placeAddress = [placeD objectForKey:@"address"];
            placeToReturn.placeDistrictID = [placeD objectForKey:@"district_id"];
            placeToReturn.placeMetroId = [placeD objectForKey:@"metro_id"];
            placeToReturn.placeLongitude = [placeD objectForKey:@"longtitude"];
            placeToReturn.placeDetail = [placeD objectForKey:@"detail"];
            placeToReturn.placeLatitude = [placeD objectForKey:@"latitude"];
            placeToReturn.placeWayTo = [placeD objectForKey:@"way_to"];
            placeToReturn.placeTitle = [placeD objectForKey:@"title"];

            dispatch_sync(dispatch_get_main_queue(), ^{
                                SEL selector = @selector(delegateFromMyAfNetworkingReturnsPlaceInfoObject:);
                                if (delegate && [delegate respondsToSelector:selector]) {
                                    [delegate performSelector:selector withObject:placeToReturn];
                                }
            });
        });
        
        
    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON){
        UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"Cannot ger session key" message:[NSString stringWithFormat:@"Report about error please %@",error] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alertView show];
        NSLog(@"1 %@,2 %@,3 %@" ,  response, error, [JSON JSONRepresentation]);
    }];
    [operation start];
}

-(void)getActionInfo:(NSString*)action
{
    NSURL *url = [NSURL URLWithString:[ NSString stringWithFormat:@"http://bileter.ru/api/?method=action&key=%@&actex_id=%@",[SingletonForGlobalVariables sharedMySingleton].SESSION_KEY, action]];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:20000.0];
    [request setHTTPMethod:@"GET"];
    
    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
        dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0ul);
        dispatch_async(queue, ^{
            NAActionDetailed *actionToReturn = [[NAActionDetailed alloc]init];
            NSDictionary * dictionary = [[JSON JSONRepresentation]JSONValue];
            NSDictionary *actionD = [dictionary objectForKey:@"action"];
            actionToReturn.actionKDMTP = [actionD objectForKey:@"kdmtp"];
            actionToReturn.actionImageId = [actionD objectForKey:@"image_id"];
            actionToReturn.actionActor = [actionD objectForKey:@"actor"];
            actionToReturn.actionAnnotate = [actionD objectForKey:@"annotate"];
            actionToReturn.actionAuthor = [actionD objectForKey:@"author"];
            actionToReturn.actionDescription = [actionD objectForKey:@"description"];
            actionToReturn.actionDirector = [actionD objectForKey:@"director"];
            actionToReturn.actionDuration = [actionD objectForKey:@"duration"];
            actionToReturn.actionHallId = [actionD objectForKey:@"hall_id"];
            actionToReturn.actionImageId = [actionD objectForKey:@"image_id"];
            actionToReturn.actionPlaceId = [actionD objectForKey:@"place_id"];
            actionToReturn.actionRatingDtzk = [actionD objectForKey:@"rating_dtzk"];
            actionToReturn.actionRatingUser = [actionD objectForKey:@"rating_user"];
            actionToReturn.actionTitle = [actionD objectForKey:@"title"];
            
            dispatch_sync(dispatch_get_main_queue(), ^{
                SEL selector = @selector(delegateFromMyAfNetworkingReturnsActionDetailedInfoObject:);
                if (delegate && [delegate respondsToSelector:selector]) {
                    [delegate performSelector:selector withObject:actionToReturn];
                }
            });
        });
        
        
    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON){
        UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"Cannot ger session key" message:[NSString stringWithFormat:@"Report about error please %@",error] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alertView show];
        NSLog(@"1 %@,2 %@,3 %@" ,  response, error, [JSON JSONRepresentation]);
    }];
    [operation start];
}

-(void)getListOfCategories
{
    NSURL *url = [NSURL URLWithString:[ NSString stringWithFormat:@"http://bileter.ru/api/?method=categories&key=%@",[SingletonForGlobalVariables sharedMySingleton].SESSION_KEY]];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:20000.0];
    [request setHTTPMethod:@"GET"];
    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
        dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0ul);
        dispatch_async(queue, ^{
            NSMutableArray *categoriesToAddToJson = [[NSMutableArray alloc]init];
            NSDictionary * dictionary = [[JSON JSONRepresentation]JSONValue];
            NSDictionary *categories = [dictionary objectForKey:@"category_tree"];
            for(NSString * key in categories){
                NACategory *category = [[NACategory alloc]init];
                category.categoryId = key;
                category.categoryTitle = [[categories objectForKey:key] objectForKey:@"title"];
                if ([[categories objectForKey:key] objectForKey:@"childNodes"]) {
                    NSDictionary *childNodes = [[categories objectForKey:key] objectForKey:@"childNodes"];
                    NSMutableArray *childNodesToAdd = [[NSMutableArray alloc] init];
                    for(NSString * key2 in childNodes){
                        NACategory *childCategory = [[NACategory alloc]init];
                        childCategory.categoryId = key2;
                        childCategory.categoryTitle = [[childNodes objectForKey:key2] objectForKey:@"title"];
                        [childNodesToAdd addObject:childCategory];
                    }
                    category.childNodes = [[NSArray alloc]initWithArray:childNodesToAdd];
                }
                [categoriesToAddToJson addObject:category];
            };
            [SingletonForGlobalVariables sharedMySingleton].CATEGORIES = categoriesToAddToJson;
//            for (NACategory *category in [SingletonForGlobalVariables sharedMySingleton].CATEGORIES) {
//                NSLog(@"%@, %@", category.categoryId, category.categoryTitle);
//                for (NACategory *child in category.childNodes) {
//                    NSLog(@"child %@ %@",child.categoryId, child.categoryTitle);
//                }
//            }
            NSLog(@"%@", [JSON JSONRepresentation]);
            dispatch_sync(dispatch_get_main_queue(), ^{
//                SEL selector = @selector(sessionKeyIsSet);
//                if (delegate && [delegate respondsToSelector:selector]) {
//                    [delegate performSelector:selector];
//                }
            });
        });
        
        
    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON){
        UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"Cannot ger session key" message:[NSString stringWithFormat:@"Report about error please %@",error] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alertView show];
        NSLog(@"1 %@,2 %@,3 %@" ,  response, error, [JSON JSONRepresentation]);
    }];
    [operation start];
}
#pragma mark RESPOND_TO_SELECTOR 
-(void)searchActionsByPlace:(NSString *)place byName:(NSString*)name byPeople:(NSString*)people byCategory:(NSString*)category byGenre:(NSString*)genre byOrder:(NSString*)order bySdt:(NSString*)std byEdt:(NSString*)edt byOfs:(NSString*)ofs byLim:(NSString*)lim all:(NSString*)all
{
    NSLog(@"search mer");
    NSString *urlNSString = [ NSString stringWithFormat:@"http://bileter.ru/api/?method=search&key=%@",[SingletonForGlobalVariables sharedMySingleton].SESSION_KEY];
    if (place) {
        urlNSString = [NSString stringWithFormat:@"%@%@%@", urlNSString,@"&place=" , place];
    }
    if (name) {
        urlNSString = [NSString stringWithFormat:@"%@%@%@", urlNSString,@"&name=" , name];
    }
    if(category)
    {
        urlNSString = [NSString stringWithFormat:@"%@%@%@", urlNSString,@"&cat=" , category];
    }
    NSLog(@"SearchActions %@", urlNSString);
    urlNSString = [urlNSString stringByAddingPercentEscapesUsingEncoding:
    NSUTF8StringEncoding];
    NSURL *url = [NSURL URLWithString:urlNSString];

    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:20000.0];
    [request setHTTPMethod:@"GET"];
    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
        dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0ul);
        NSMutableArray *arrayOfItemsToReturn = [[NSMutableArray alloc]init];
        dispatch_async(queue, ^{
            NSDictionary * dictionary = [[JSON JSONRepresentation]JSONValue];
            NSLog(@"Actions %@", [JSON JSONRepresentation]);
            NSArray *actions = [dictionary objectForKey:@"actions"];
            for (NSDictionary *action in actions) {
                NAAction *actionToAdd = [[NAAction alloc] init];
                actionToAdd.actionId = [action objectForKey:@"id"];
                actionToAdd.actionPlaceId = [action objectForKey:@"place_id"];
                actionToAdd.actionPriceMin = [action objectForKey:@"price_min"];
                actionToAdd.actexId = [action objectForKey:@"actex_id"];
                NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
                [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:SS"];
                actionToAdd.actionDate = [dateFormatter dateFromString:[action objectForKey:@"date"]];
                actionToAdd.actionDuration = [action objectForKey:@"duration"];
                actionToAdd.actionPriceMax = [action objectForKey:@"price_max"];
                actionToAdd.actionCategories = [[action objectForKey:@"categories"]  componentsSeparatedByString:@","];
                actionToAdd.actionImageId = [action objectForKey:@"image_id"];
                actionToAdd.actionAnn = [action objectForKey:@"action_ann"];
                actionToAdd.actionTitle = [action objectForKey:@"action_title"];
                actionToAdd.actionHallId = [action objectForKey:@"hall_id"];
                actionToAdd.actionGenreTitle = [action objectForKey:@"genre_title"];
                [arrayOfItemsToReturn addObject:actionToAdd];
            }
            NSLog(@"count %i", [arrayOfItemsToReturn count]);
            dispatch_sync(dispatch_get_main_queue(), ^{
                SEL selector = @selector(delegateFromMyAfNetworkingReturnsArrayOfActions:);
                                if (delegate && [delegate respondsToSelector:selector]) {
                                    [delegate performSelector:selector withObject:arrayOfItemsToReturn];
                               }
            });
        });
        
        
    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON){
        UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"Cannot ger session key" message:[NSString stringWithFormat:@"Report about error please %@",error] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alertView show];
        NSLog(@"1 %@,2 %@,3 %@" ,  response, error, [JSON JSONRepresentation]);
    }];
    [operation start];
}


-(void)searchPlacesByName:(NSString *)name byCategory:(NSString*)category byGenre:(NSString*)genre byMetro:(NSString*)metro byDistrict:(NSString*)district byOfs:(NSString*)ofs byLim:(NSString*)lim
{
    NSString *urlNSString = [NSString stringWithFormat:@"http://bileter.ru/api/?method=place_search&key=%@",[SingletonForGlobalVariables sharedMySingleton].SESSION_KEY];
    if (name) {
        urlNSString = [NSString stringWithFormat:@"%@%@%@", urlNSString,@"&name=" , name];
    }
    if(category)
    {
        urlNSString = [NSString stringWithFormat:@"%@%@%@", urlNSString,@"&category=" , category];
    }
    NSLog(@"SearchPlaces %@", urlNSString);
    urlNSString = [urlNSString stringByAddingPercentEscapesUsingEncoding:
                   NSUTF8StringEncoding];
    NSURL *url = [NSURL URLWithString:urlNSString];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:20000.0];
    [request setHTTPMethod:@"GET"];
    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
        dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0ul);
        NSMutableArray *arrayOfItemsToReturn = [[NSMutableArray alloc]init];
        dispatch_async(queue, ^{
            NSDictionary * dictionary = [[JSON JSONRepresentation]JSONValue];
            NSLog(@"SearchPlaces %@", [JSON JSONRepresentation]);
          
            NSArray *arrayOfPlaces = [dictionary objectForKey:@"places"];
            for (NSDictionary *place in arrayOfPlaces) {
                NAPlaceFound *placeFound = [[NAPlaceFound alloc]init];
                placeFound.placeSortOrder = [[place objectForKey:@"sort_order"] integerValue];
                placeFound.placeId = [place objectForKey:@"id"];
                placeFound.placeTitle = [place objectForKey:@"place_title"];
                placeFound.placeMetroId = [place objectForKey:@"metro_id"];
                placeFound.placeGenres = [[place objectForKey:@"genres"]  componentsSeparatedByString:@","];
                placeFound.placeAddress = [place objectForKey:@"address"];
                placeFound.placeDistrictID = [place objectForKey:@"district_id"];
                placeFound.placeShortTitle = [place objectForKey:@"place_short"];
                placeFound.placeLatitude = [place objectForKey:@"latitude"];
                placeFound.placeLongitude = [place objectForKey:@"longtitude"];
                placeFound.placeCategories = [[place objectForKey:@"categories"]  componentsSeparatedByString:@","];
                [arrayOfItemsToReturn addObject:placeFound];
                
                
            }
            NSLog(@"found %i", [arrayOfItemsToReturn count]);
            NSSortDescriptor *sorter = [[NSSortDescriptor alloc] initWithKey:@"placeSortOrder" ascending:YES];
            [arrayOfItemsToReturn sortUsingDescriptors:[NSArray arrayWithObject:sorter]];
            dispatch_sync(dispatch_get_main_queue(), ^{
                                SEL selector = @selector(delegateFromMyAfNetworkingReturnsPlacesFoundObject:);
                                if (delegate && [delegate respondsToSelector:selector]) {
                                    [delegate performSelector:selector withObject:arrayOfItemsToReturn];
                                }
            });
        });
        
        
    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON){
        UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"Cannot ger session key" message:[NSString stringWithFormat:@"Report about error please %@",error] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alertView show];
        NSLog(@"1 %@,2 %@,3 %@" ,  response, error, [JSON JSONRepresentation]);
    }];
    [operation start];
}
-(void)setMetroList
{
    NSString *urlNSString = [NSString stringWithFormat:@"http://bileter.ru/api/?method=lists&key=%@&type=metro",[SingletonForGlobalVariables sharedMySingleton].SESSION_KEY];
    NSURL *url = [NSURL URLWithString:urlNSString];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:20000.0];
    [request setHTTPMethod:@"GET"];
    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
        dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0ul);
        dispatch_async(queue, ^{
            NSMutableDictionary *dictionaryForSingleton = [[NSMutableDictionary alloc]init];
            NSDictionary * dictionary = [[JSON JSONRepresentation]JSONValue];
            NSLog(@"MetroList %@", [JSON JSONRepresentation]);
            NSArray *array = [dictionary objectForKey:@"list"];
            for (NSDictionary*dictionaryIDTitle in array){
                [dictionaryForSingleton setObject:[dictionaryIDTitle objectForKey:@"title"] forKey:[dictionaryIDTitle objectForKey:@"id"]];
            }
            [SingletonForGlobalVariables sharedMySingleton].METROLIST = dictionaryForSingleton;
        });
    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON){
        UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"MetroListLoadingError" message:[NSString stringWithFormat:@"Report about error please %@",error] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alertView show];
        NSLog(@"1 %@,2 %@,3 %@" ,  response, error, [JSON JSONRepresentation]);
    }];
    [operation start];
}
-(void)setDistrictList
{
    NSString *urlNSString = [NSString stringWithFormat:@"http://bileter.ru/api/?method=lists&key=%@&type=district",[SingletonForGlobalVariables sharedMySingleton].SESSION_KEY];
    NSURL *url = [NSURL URLWithString:urlNSString];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:20000.0];
    [request setHTTPMethod:@"GET"];
    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
        dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0ul);
        dispatch_async(queue, ^{
            NSMutableDictionary *dictionaryForSingleton = [[NSMutableDictionary alloc]init];
            NSDictionary * dictionary = [[JSON JSONRepresentation]JSONValue];
            NSArray *array = [dictionary objectForKey:@"list"];
            for (NSDictionary*dictionaryIDTitle in array){
                [dictionaryForSingleton setObject:[dictionaryIDTitle objectForKey:@"title"] forKey:[dictionaryIDTitle objectForKey:@"id"]];
            }
            [SingletonForGlobalVariables sharedMySingleton].DISTRICTLIST = dictionaryForSingleton;
        });
    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON){
        UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"DistrinctListLoadingError" message:[NSString stringWithFormat:@"Report about error please %@",error] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alertView show];
        NSLog(@"1 %@,2 %@,3 %@" ,  response, error, [JSON JSONRepresentation]);
    }];
    [operation start];
}
-(void)setGenreList
{
    NSString *urlNSString = [NSString stringWithFormat:@"http://bileter.ru/api/?method=lists&key=%@&type=genre",[SingletonForGlobalVariables sharedMySingleton].SESSION_KEY];
    NSURL *url = [NSURL URLWithString:urlNSString];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:20000.0];
    [request setHTTPMethod:@"GET"];
    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
        dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0ul);
        dispatch_async(queue, ^{
            NSMutableDictionary *dictionaryForSingleton = [[NSMutableDictionary alloc]init];
            NSDictionary * dictionary = [[JSON JSONRepresentation]JSONValue];
            NSArray *array = [dictionary objectForKey:@"list"];
            for (NSDictionary*dictionaryIDTitle in array){
                [dictionaryForSingleton setObject:[dictionaryIDTitle objectForKey:@"title"] forKey:[dictionaryIDTitle objectForKey:@"id"]];
            }
            [SingletonForGlobalVariables sharedMySingleton].GENRELIST = dictionaryForSingleton;
        });
    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON){
        UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"GenreListLoadingError" message:[NSString stringWithFormat:@"Report about error please %@",error] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alertView show];
        NSLog(@"1 %@,2 %@,3 %@" ,  response, error, [JSON JSONRepresentation]);
    }];
    [operation start];
}
@end
