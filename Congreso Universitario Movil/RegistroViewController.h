//
//  RegistroViewController.h
//  Congreso Universitario Movil
//
//  Created by julio.guzman on 28/07/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Vista.h"

@interface RegistroViewController : Vista {
    
    IBOutlet UITextField *textField;
    IBOutlet UILabel *label;
    IBOutlet UIPickerView *picker;
    NSMutableArray *pickerArray;
    
    NSString *mail;
    NSString *tipo;
    
}


-(BOOL)itIsAMail;

@end
