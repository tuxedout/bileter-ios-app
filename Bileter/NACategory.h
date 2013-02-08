//
//  NACategory.h
//  Bileter
//
//  Created by Admin on 1/25/13.
//  Copyright (c) 2013 Search Concepts AG. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NACategory : NSObject
{
    NSString* categoryId;
    NSString* categoryTitle;
    NSArray *childNodes;
}
@property (nonatomic, retain) NSString *categoryId;
@property (nonatomic, retain) NSString *categoryTitle;
@property (nonatomic, retain) NSArray *childNodes;
@end
