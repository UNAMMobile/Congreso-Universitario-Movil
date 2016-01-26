//
//  PatrocinadoresViewController.m
//  Congreso Universitario Movil
//
//  Created by julio.guzman on 28/07/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "PatrocinadoresViewController.h"
#import "WebViewController.h"

@implementation PatrocinadoresViewController

-(IBAction)telcel{
    WebViewController *acercaDeViewController = [[WebViewController alloc] initWithMyURL:@"http://www.telcel.com/"  returnToNIB:@"patrocinadores"];
    acercaDeViewController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentModalViewController:acercaDeViewController animated:YES];
    [acercaDeViewController release];
    
    
}

-(IBAction)windowsphone{
    WebViewController *acercaDeViewController = [[WebViewController alloc] initWithMyURL:@"http://www.microsoft.com/windowsphone/" returnToNIB:@"patrocinadores"];
    acercaDeViewController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentModalViewController:acercaDeViewController animated:YES];
    [acercaDeViewController release];
}

-(IBAction)google{
    WebViewController *acercaDeViewController = [[WebViewController alloc] initWithMyURL:@"http://www.android.com/" returnToNIB:@"patrocinadores"];
    acercaDeViewController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentModalViewController:acercaDeViewController animated:YES];
    [acercaDeViewController release];
}

-(IBAction)blackberry{
    WebViewController *acercaDeViewController = [[WebViewController alloc] initWithMyURL:@"http://mx.blackberry.com/" returnToNIB:@"patrocinadores"];
    acercaDeViewController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentModalViewController:acercaDeViewController animated:YES];
    [acercaDeViewController release];
}


-(IBAction)nokia{
    WebViewController *acercaDeViewController = [[WebViewController alloc] initWithMyURL:@"http://www.nokia.com.mx/" returnToNIB:@"patrocinadores"];
    acercaDeViewController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentModalViewController:acercaDeViewController animated:YES];
    [acercaDeViewController release];
}

-(IBAction)samsung{
    WebViewController *acercaDeViewController = [[WebViewController alloc] initWithMyURL:@"http://www.samsung.com/mx/" returnToNIB:@"patrocinadores"];
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
