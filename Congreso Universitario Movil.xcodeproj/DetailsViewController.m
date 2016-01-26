//
//  DetailsViewController.m
//  Congreso Universitario Movil
//
//  Created by Julio César on 8/6/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "DetailsViewController.h"
#import "RegistroViewController.h"
#import "AcercaDeViewController.h"
#import "RedesSocialesViewController.h"
#import "AppCircusViewController.h"
#import "NoticiasViewController.h"
#import "SedeViewController.h"
#import "CalendarioViewController.h"
#import "MultimediaViewController.h"
#import "PatrocinadoresViewController.h"

@implementation DetailsViewController

@synthesize label, textView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(id)initWithTitle:(NSString *)title andText:(NSString *)text
{
    slabel = title;
    stextView = text;
    return [self initWithNibName:@"DetailsViewController" bundle:nil];
}

-(id)initWithTitle:(NSString *)title andText:(NSString *)text returnToNIB:(NSString *)nib
{
    nibName = nib;
    slabel = title;
    stextView = text;
    return [self initWithNibName:@"DetailsViewController" bundle:nil];
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
    textView.text = stextView;
    label.text = slabel;
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

-(IBAction)returnsToNIBWithName
{
        if (nibName == nil) {
            [self menuRaiz];
        }
        if ([nibName compare:@"registro"]==NSOrderedSame) {
            RegistroViewController *registroViewController = [[RegistroViewController alloc] initWithNibName:@"RegistroViewController" bundle:nil];
            registroViewController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
            [self presentModalViewController:registroViewController animated:YES];
            [registroViewController release];
        }
        else if ([nibName compare:@"redesSociales"]==NSOrderedSame) {
            RedesSocialesViewController *registroViewController = [[RedesSocialesViewController alloc] initWithNibName:@"RedesSocialesViewController" bundle:nil];
            registroViewController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
            [self presentModalViewController:registroViewController animated:YES];
            [registroViewController release];
        }
        else if ([nibName compare:@"appCircus"]==NSOrderedSame) {
            AppCircusViewController *registroViewController = [[AppCircusViewController alloc] initWithNibName:@"AppCircusViewController" bundle:nil];
            registroViewController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
            [self presentModalViewController:registroViewController animated:YES];
            [registroViewController release];
        }
        else if ([nibName compare:@"noticias"]==NSOrderedSame) {
            NoticiasViewController *registroViewController = [[NoticiasViewController alloc] initWithNibName:@"NoticiasViewController" bundle:nil];
            registroViewController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
            [self presentModalViewController:registroViewController animated:YES];
            [registroViewController release];
        }
        else if ([nibName compare:@"sede"]==NSOrderedSame) {
            SedeViewController *registroViewController = [[SedeViewController alloc] initWithNibName:@"SedeViewController" bundle:nil];
            registroViewController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
            [self presentModalViewController:registroViewController animated:YES];
            [registroViewController release];
        }
        else if ([nibName compare:@"calendario"]==NSOrderedSame) {
            CalendarioViewController *registroViewController = [[CalendarioViewController alloc] initWithNibName:@"CalendarioViewController" bundle:nil];
            registroViewController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
            [self presentModalViewController:registroViewController animated:YES];
            [registroViewController release];
        }
        else if ([nibName compare:@"multimedia"]==NSOrderedSame) {
            MultimediaViewController *registroViewController = [[MultimediaViewController alloc] initWithNibName:@"MultimediaViewController" bundle:nil];
            registroViewController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
            [self presentModalViewController:registroViewController animated:YES];
            [registroViewController release];
        }
        else if ([nibName compare:@"patrocinadores"]==NSOrderedSame) {
            PatrocinadoresViewController *registroViewController = [[PatrocinadoresViewController alloc] initWithNibName:@"PatrocinadoresViewController" bundle:nil];
            registroViewController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
            [self presentModalViewController:registroViewController animated:YES];
            [registroViewController release];
        }
        else if ([nibName compare:@"acercaDe"]==NSOrderedSame) {
            AcercaDeViewController *registroViewController = [[AcercaDeViewController alloc] initWithNibName:@"AcercaDeController" bundle:nil];
            registroViewController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
            [self presentModalViewController:registroViewController animated:YES];
            [registroViewController release];
        }

}

@end
