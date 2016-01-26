//
//  DayCell.h
//  Congreso Universitario Movil
//
//  Created by Julio César on 8/4/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface DayCell : UITableViewCell {
    UILabel *primaryLabel;
    UILabel *secondaryLabel;
}

@property(nonatomic,retain)UILabel *primaryLabel;
@property(nonatomic,retain)UILabel *secondaryLabel;


@end
