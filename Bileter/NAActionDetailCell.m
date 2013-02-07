//
//  NAActionDetailCell.m
//  Bileter
//
//  Created by Ruslan Ibrahimov on 30.01.13.
//  Copyright (c) 2013 Search Concepts AG. All rights reserved.
//

#import "NAActionDetailCell.h"

@implementation NAActionDetailCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setItemToShow:(NAAction *)newItemToShow andDetailed:(NAActionDetailed *)newItemDetailedToShow{
    itemToShow = newItemToShow;
    itemDetailedToShow = newItemDetailedToShow;
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd MMMM yyyy 'в' HH:mm"];
    
    [dateLabel setText:[dateFormatter stringFromDate:itemToShow.actionDate]];
    
    int hours = floor( [itemToShow.actionDuration integerValue] / 3600);
    int minutes = ceil(([itemToShow.actionDuration integerValue] - hours * 3600) / 60);
    
    if (hours == 0){
        [durationLabel setText:[NSString stringWithFormat:@"%i минут", minutes]];
    }else if (hours == 1){
        [durationLabel setText:[NSString stringWithFormat:@"%i час %i минут", hours, minutes]];
    }else{
        [durationLabel setText:[NSString stringWithFormat:@"%i часа %i минут", hours, minutes]];
    }
    
    int rating = [itemDetailedToShow.actionRatingDtzk integerValue];
    
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
    }
    
    [genreLabel setText:itemToShow.actionGenreTitle];
    if (itemDetailedToShow.actionDirector != [NSNull null]){
        [directorLabel setText:itemDetailedToShow.actionDirector];
    }
    
    NSLog(@"Rating %@", itemDetailedToShow.actionRatingDtzk);
    
    mainImage.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString: [NSString stringWithFormat:@"http://www.bileter.ru/view_img.php?id=%@", itemToShow.actionImageId]]]];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
