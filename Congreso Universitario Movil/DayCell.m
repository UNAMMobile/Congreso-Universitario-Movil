//
//  DayCell.m
//  Congreso Universitario Movil
//
//  Created by Julio César on 8/4/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "DayCell.h"


@implementation DayCell

@synthesize primaryLabel,secondaryLabel;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    [self setSelectionStyle:UITableViewCellEditingStyleNone];
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

- (id)initWithFrame:(CGRect)frame{
    if ((self = [super initWithFrame:frame])) {
        // Initialization code
        primaryLabel = [[UILabel alloc]init];
        primaryLabel.textAlignment = UITextAlignmentLeft;
        primaryLabel.font = [UIFont systemFontOfSize:17/*antes 40*/];
        
        [primaryLabel setBackgroundColor:[UIColor clearColor]];
        primaryLabel.textColor = [UIColor whiteColor];
        
        secondaryLabel = [[UILabel alloc]init];
        secondaryLabel.textAlignment = UITextAlignmentLeft;
        secondaryLabel.font = [UIFont systemFontOfSize:16];
        [self.contentView addSubview:primaryLabel];
        [self.contentView addSubview:secondaryLabel];
        
        [secondaryLabel setBackgroundColor:[UIColor clearColor]];
        secondaryLabel.textColor = [UIColor whiteColor];
        
        
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGRect contentRect = self.contentView.bounds;
    CGFloat boundsX = contentRect.origin.x;
    CGRect frame;
    frame= CGRectMake(boundsX+20 ,10, 290, 30);
    primaryLabel.frame = frame;
    frame= CGRectMake(boundsX+10,32, 300, 52);
    secondaryLabel.frame = frame;
    secondaryLabel.numberOfLines = 4;
    secondaryLabel.baselineAdjustment = UIBaselineAdjustmentAlignCenters;
}


- (void)dealloc
{
    [super dealloc];
}

@end
