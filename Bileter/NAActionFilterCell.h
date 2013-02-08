//
//  NAActionFilterCell.h
//  Bileter
//
//  Created by Ruslan Ibrahimov on 05.02.13.
//  Copyright (c) 2013 Search Concepts AG. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NAActionFilterCell : UITableViewCell{
    IBOutlet UIButton *categoryButton;
    IBOutlet UIButton *placeButton;
    IBOutlet UIButton *dateButton;
}

@property (strong, nonatomic) IBOutlet UIButton *categoryButton;
@property (strong, nonatomic) IBOutlet UIButton *placeButton;
@property (strong, nonatomic) IBOutlet UIButton *dateButton;

@end
