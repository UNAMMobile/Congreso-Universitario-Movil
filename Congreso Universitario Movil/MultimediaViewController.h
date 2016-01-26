//
//  MultimediaViewController.h
//  Congreso Universitario Movil
//
//  Created by julio.guzman on 28/07/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Vista.h"

@interface MultimediaViewController : Vista <UITableViewDataSource, UITableViewDelegate>{
    IBOutlet UITabBar *tabBar; 
    IBOutlet UITabBarItem *galeriaItem;
    IBOutlet UITabBarItem *videosItem;
    
    IBOutlet UIScrollView *galeria; 
    IBOutlet UIScrollView *videos;
    
    NSMutableArray *dictionaryArray;
    NSMutableArray *photoDictionaryArray;
}

@property(nonatomic,retain) IBOutlet UITabBar *tabBar;
@property(nonatomic,retain) IBOutlet UITabBarItem *galeriaItem;
@property(nonatomic,retain) IBOutlet UITabBarItem *videosItem;

@property(nonatomic,retain) IBOutlet UIScrollView *galeria;
@property(nonatomic,retain) IBOutlet UIScrollView *videos;

#pragma mark View Management

-(void)startRefreshingViews;

#pragma mark Galeria

-(void)construyeGaleria;

@end
