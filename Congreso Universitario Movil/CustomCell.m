//
//  CustomCell.m
//  Congreso Universitario Movil
//
//  Created by Julio César on 7/31/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CustomCell.h"
#import <QuartzCore/QuartzCore.h>

@implementation CustomCell

@synthesize primaryLabel,secondaryLabel,myImageView;

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
        primaryLabel.font = [UIFont systemFontOfSize:14];
        [primaryLabel setBackgroundColor:[UIColor clearColor]];
        primaryLabel.textColor = [UIColor whiteColor];
        
        secondaryLabel = [[UILabel alloc]init];
        secondaryLabel.textAlignment = UITextAlignmentLeft;
        secondaryLabel.font = [UIFont systemFontOfSize:12];
        [secondaryLabel setBackgroundColor:[UIColor clearColor]];
        secondaryLabel.textColor = [UIColor whiteColor];
        
        myImageView = [[UIImageView alloc]init];
        [self.contentView addSubview:primaryLabel];
        [self.contentView addSubview:secondaryLabel];
        [self.contentView addSubview:myImageView];
        
   }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGRect contentRect = self.contentView.bounds;
    CGFloat boundsX = contentRect.origin.x;
    CGRect frame;
    frame= CGRectMake(boundsX+10 ,10, 40, 40);
    myImageView.frame = frame;
    
    frame= CGRectMake(boundsX+60 ,5, 250, 25);
    primaryLabel.frame = frame;
    
    frame= CGRectMake(boundsX+ 60,25, 250, 30);
    secondaryLabel.frame = frame;
    secondaryLabel.numberOfLines = 1;
    secondaryLabel.baselineAdjustment = UIBaselineAdjustmentAlignCenters;
}


- (void)dealloc
{
    [super dealloc];
}

@end
