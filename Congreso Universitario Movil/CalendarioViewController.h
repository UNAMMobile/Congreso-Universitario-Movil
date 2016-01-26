//
//  CalendarioViewController.h
//  Congreso Universitario Movil
//
//  Created by julio.guzman on 28/07/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Vista.h"

@interface CalendarioViewController : Vista <UITableViewDataSource, UITableViewDelegate> {
    IBOutlet UITabBar *tabBar; 
    IBOutlet UITabBarItem *lunesItem;
    IBOutlet UITabBarItem *martesItem;
    IBOutlet UITabBarItem *miercolesItem;
    IBOutlet UITabBarItem *juevesItem;
    IBOutlet UITabBarItem *viernesItem;
    
    IBOutlet UIScrollView *lunes; 
    IBOutlet UIScrollView *martes;
    IBOutlet UIScrollView *miercoles;
    IBOutlet UIScrollView *jueves;
    IBOutlet UIScrollView *viernes;
    
    IBOutlet UITableView *lunesTable; 
    IBOutlet UITableView *martesTable;
    IBOutlet UITableView *miercolesTable;
    IBOutlet UITableView *juevesTable;
    IBOutlet UITableView *viernesTable;
    
    NSMutableArray *daysArray;
    NSMutableArray *day1Array;
    NSMutableArray *day2Array;
    NSMutableArray *day3Array;
    NSMutableArray *day4Array;
    NSMutableArray *day5Array;
}

@property(nonatomic,retain) IBOutlet UITabBar *tabBar;
@property(nonatomic,retain) IBOutlet UITabBarItem *lunesItem;
@property(nonatomic,retain) IBOutlet UITabBarItem *martesItem;
@property(nonatomic,retain) IBOutlet UITabBarItem *miercolesItem;
@property(nonatomic,retain) IBOutlet UITabBarItem *juevesItem;
@property(nonatomic,retain) IBOutlet UITabBarItem *viernesItem;

@property(nonatomic,retain) IBOutlet UIScrollView *lunes;
@property(nonatomic,retain) IBOutlet UIScrollView *martes;
@property(nonatomic,retain) IBOutlet UIScrollView *miercoles;
@property(nonatomic,retain) IBOutlet UIScrollView *jueves;
@property(nonatomic,retain) IBOutlet UIScrollView *viernes;


@property(nonatomic,retain) IBOutlet UITableView *lunesTable; 
@property(nonatomic,retain) IBOutlet UITableView *martesTable;
@property(nonatomic,retain) IBOutlet UITableView *miercolesTable;
@property(nonatomic,retain) IBOutlet UITableView *juevesTable;
@property(nonatomic,retain) IBOutlet UITableView *viernesTable;


#pragma mark View Management

-(void)startRefreshingViews;

-(void)fillDayArrays;

@end
