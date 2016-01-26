//
//  Congreso_Universitario_MovilAppDelegate.h
//  Congreso Universitario Movil
//
//  Created by julio.guzman on 27/07/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Congreso_Universitario_MovilViewController;

@interface Congreso_Universitario_MovilAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet Congreso_Universitario_MovilViewController *viewController;

@end
