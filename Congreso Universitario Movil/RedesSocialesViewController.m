//
//  RedesSocialesViewController.m
//  Congreso Universitario Movil
//
//  Created by julio.guzman on 28/07/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "RedesSocialesViewController.h"
#import "WebViewController.h"

@implementation RedesSocialesViewController

-(IBAction)twitter{
    WebViewController *acercaDeViewController = [[WebViewController alloc] initWithMyURL:@"http://twitter.com/CUM_MX"  returnToNIB:@"redesSociales"];
    acercaDeViewController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentModalViewController:acercaDeViewController animated:YES];
    [acercaDeViewController release];
    
    
}

-(IBAction)facebook{
    WebViewController *acercaDeViewController = [[WebViewController alloc] initWithMyURL:@"http://m.facebook.com/pages/Congreso-Universitario-M%C3%B3vil-Telcel-2011/247463825269754" returnToNIB:@"redesSociales"];
    acercaDeViewController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentModalViewController:acercaDeViewController animated:YES];
    [acercaDeViewController release];
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
