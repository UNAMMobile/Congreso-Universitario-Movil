//
//  Vista.h
//  Congreso Universitario Movil
//
//  Created by julio.guzman on 28/07/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface Vista : UIViewController {
    
}

#pragma mark - View IBActions

-(IBAction)menuRaiz;

#pragma mark - Plist Management

-(NSMutableArray *)buildArrayFromURL:(NSString *)url;

-(NSMutableArray *)buildArrayFromPlist:(NSString *)plistName;

- (void)savePlist:(NSString*)url name:(NSString*)plistName;

- (void)removePlist:(NSString*)plistName;

- (NSMutableArray*)loadPlist:(NSString*)plistName;

-(BOOL)searchPlist:(NSString*)plistName;

-(BOOL)needsRefreshPlist:(NSString *)plistName feed:(NSString *)feed;

-(NSMutableArray*)getArrayFromFeed:(NSString*)feed withName:(NSString*)plistName;

-(BOOL)dataOnPlistArray:(NSMutableArray*)array;

#pragma mark - Alerts

-(void)callAlert:(NSString *)title withMessage:(NSString *)message;

#pragma mark - Appeareance

-(void)setBackgroundFromImage:(NSString*)image;

@end
