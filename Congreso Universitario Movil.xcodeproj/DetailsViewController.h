//
//  DetailsViewController.h
//  Congreso Universitario Movil
//
//  Created by Julio César on 8/6/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Vista.h"

@interface DetailsViewController : Vista {
    IBOutlet UITextView *textView;
   IBOutlet UITextView *label;
    NSString *stextView;
    NSString *slabel;
    NSString *nibName;
}

@property(nonatomic,retain) IBOutlet UITextView *textView;
@property(nonatomic,retain) IBOutlet UITextView *label;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil;
-(id)initWithTitle:(NSString *)title andText:(NSString *)text;
-(id)initWithTitle:(NSString *)title andText:(NSString *)text returnToNIB:(NSString *)nib;
@end
