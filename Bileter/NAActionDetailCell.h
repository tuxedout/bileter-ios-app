//
//  NAActionDetailCell.h
//  Bileter
//
//  Created by Ruslan Ibrahimov on 30.01.13.
//  Copyright (c) 2013 Search Concepts AG. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NAAction.h"
#import "NAActionDetailCell.h"

@interface NAActionDetailCell : UITableViewCell{
    IBOutlet UIImageView *mainImage;
    
    IBOutlet UIImageView *star1;
    IBOutlet UIImageView *star2;
    IBOutlet UIImageView *star3;
    IBOutlet UIImageView *star4;
    IBOutlet UIImageView *star5;
    
    IBOutlet UILabel *dateLabel;
    IBOutlet UILabel *genreLabel;
    IBOutlet UILabel *directorLabel;
    IBOutlet UILabel *durationLabel;
    
    NAAction *itemToShow;
    NAActionDetailed *itemDetailedToShow;
}

- (void)setItemToShow:(NAAction *)newItemToShow andDetailed:(NAActionDetailed *)newItemDetailedToShow;

@end
