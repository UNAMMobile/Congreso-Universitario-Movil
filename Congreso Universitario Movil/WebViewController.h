//
//  WebViewController.h
//  Congreso Universitario Movil
//
//  Created by Julio César on 8/6/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Vista.h"

@interface WebViewController : Vista {
    IBOutlet UIWebView *webView;
     NSString *nibName;
}

@property(nonatomic,retain) UIWebView *webView;

-(id)initWithMyURL:(NSString *)webPageUrl;

-(id)initWithMyURL:(NSString *)webPageUrl returnToNIB:(NSString *)nib;

@end
