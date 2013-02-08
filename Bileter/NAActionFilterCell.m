//
//  NAActionFilterCell.m
//  Bileter
//
//  Created by Ruslan Ibrahimov on 05.02.13.
//  Copyright (c) 2013 Search Concepts AG. All rights reserved.
//

#import "NAActionFilterCell.h"

@implementation NAActionFilterCell

@synthesize categoryButton;
@synthesize dateButton;
@synthesize placeButton;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
