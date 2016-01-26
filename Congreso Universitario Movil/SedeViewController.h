//
//  SedeViewController.h
//  Congreso Universitario Movil
//
//  Created by julio.guzman on 28/07/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "Vista.h"

@interface SedeViewController : Vista {
    IBOutlet UITabBar *tabBar; 
    IBOutlet UITabBarItem *mapItem;
    IBOutlet UITabBarItem *sedeItem;
    
    IBOutlet MKMapView *map; 
    IBOutlet UIImageView *sede;
   
}

@property(nonatomic,retain) IBOutlet UITabBar *tabBar;
@property(nonatomic,retain) IBOutlet UITabBarItem *mapItem;
@property(nonatomic,retain) IBOutlet UITabBarItem *sedeItem;

@property(nonatomic,retain) IBOutlet MKMapView *map;
@property(nonatomic,retain) IBOutlet UIImageView *sede;

@end
