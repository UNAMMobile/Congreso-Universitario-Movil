//
//  SedeViewController.m
//  Congreso Universitario Movil
//
//  Created by julio.guzman on 28/07/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "SedeViewController.h"


@implementation SedeViewController

@synthesize tabBar, mapItem, sedeItem;

@synthesize map,sede;

NSTimer *timer;

-(void)actualizavistas
{
    if (tabBar.selectedItem == mapItem){
        [sede setHidden:YES];
        [map setHidden:NO];
    }
    else if (tabBar.selectedItem == sedeItem){
        [sede setHidden:NO];
        [map setHidden:YES];
    }
    
  
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)dealloc
{
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    tabBar.selectedItem = mapItem;
      
    CLLocationCoordinate2D coord = {.latitude =  19.331500, .longitude =  -99.184500};
    MKCoordinateSpan span = {.latitudeDelta =  0.001, .longitudeDelta =  0.001};
    MKCoordinateRegion region = {coord, span};
    
    [map setRegion:region];
    
    timer = [NSTimer scheduledTimerWithTimeInterval:.0416
                                     target:self
                                   selector:@selector(actualizavistas)
                                   userInfo:tabBar
                                    repeats:YES];
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
