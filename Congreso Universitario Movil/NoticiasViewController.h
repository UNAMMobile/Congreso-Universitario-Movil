//
//  NoticiasViewController.h
//  Congreso Universitario Movil
//
//  Created by julio.guzman on 28/07/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Vista.h"

@interface NoticiasViewController : Vista <UITableViewDataSource, UITableViewDelegate>  {
    
    IBOutlet UITableView *tableView;
    
    NSMutableArray *dictionaryArray;
    
}

@property(nonatomic,retain) IBOutlet UITableView *tableView;


@end
