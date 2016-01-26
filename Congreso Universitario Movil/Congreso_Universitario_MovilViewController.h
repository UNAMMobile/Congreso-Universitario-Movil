//
//  Congreso_Universitario_MovilViewController.h
//  Congreso Universitario Movil
//
//  Created by julio.guzman on 27/07/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Vista.h"

@interface Congreso_Universitario_MovilViewController : Vista {
    IBOutlet UILabel *label1;
    IBOutlet UILabel *label2;
    IBOutlet UILabel *label3;
    IBOutlet UILabel *label4;
    IBOutlet UILabel *label5;
    IBOutlet UILabel *label6;
    IBOutlet UILabel *label7;
    IBOutlet UILabel *label8;
    IBOutlet UILabel *label9;
}

@property(nonatomic,retain) IBOutlet UILabel *label1;
@property(nonatomic,retain) IBOutlet UILabel *label2;
@property(nonatomic,retain) IBOutlet UILabel *label3;
@property(nonatomic,retain) IBOutlet UILabel *label4;
@property(nonatomic,retain) IBOutlet UILabel *label5;
@property(nonatomic,retain) IBOutlet UILabel *label6;
@property(nonatomic,retain) IBOutlet UILabel *label7;
@property(nonatomic,retain) IBOutlet UILabel *label8;
@property(nonatomic,retain) IBOutlet UILabel *label9;

-(IBAction)cambiaVista:(id)sender;
- (void)startWobble:(UILabel *)label; 
- (void)stopWobble:(UILabel *)label; 
-(void)callWobbleThreadWithLabel:(UILabel *)label;
@end
