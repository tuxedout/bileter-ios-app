//
//  NAActionDetailCell.m
//  Bileter
//
//  Created by Ruslan Ibrahimov on 30.01.13.
//  Copyright (c) 2013 Search Concepts AG. All rights reserved.
//

#import "NAPlaceDetailCell.h"

@implementation NAPlaceDetailCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setItemToShow:(NAPlace *)newItemToShow{
    itemToShow = newItemToShow;
    
    /*int rating = [itemToShow.pl integerValue];
    
    UIImage *star = [UIImage imageNamed:@"starEnabled"];
    
    switch (rating) {
        case 1:{
            [star1 setImage:star];
        }break;
        case 2:{
            [star1 setImage:star];
            [star2 setImage:star];
        }break;
        case 3:{
            [star1 setImage:star];
            [star2 setImage:star];
            [star3 setImage:star];
        }break;
        case 4:{
            [star1 setImage:star];
            [star2 setImage:star];
            [star3 setImage:star];
            [star4 setImage:star];
        }break;
        case 5:{
            [star1 setImage:star];
            [star2 setImage:star];
            [star3 setImage:star];
            [star4 setImage:star];
            [star5 setImage:star];
        }break;
        default:
        break;
    }*/
    
    descriptionView.text = itemToShow.placeDetail;
    
    CGSize textSize = [itemToShow.placeDetail sizeWithFont:[UIFont systemFontOfSize:14.0f] constrainedToSize:CGSizeMake(228, 1000)];
    
    CGRect frame = descriptionView.frame;
    frame.size = textSize;
    
    [descriptionView setFrame: frame];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

@end
