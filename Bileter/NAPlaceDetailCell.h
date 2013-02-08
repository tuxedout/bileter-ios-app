//
//  NAActionDetailCell.h
//  Bileter
//
//  Created by Ruslan Ibrahimov on 30.01.13.
//  Copyright (c) 2013 Search Concepts AG. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NAPlace.h"

@interface NAPlaceDetailCell : UITableViewCell{
    IBOutlet UIImageView *mainImage;
    
    IBOutlet UIImageView *star1;
    IBOutlet UIImageView *star2;
    IBOutlet UIImageView *star3;
    IBOutlet UIImageView *star4;
    IBOutlet UIImageView *star5;
    
    IBOutlet UITextView *descriptionView;
    
    NAPlace *itemToShow;
}

- (void)setItemToShow:(NAPlace *)newItemToShow;

@end
