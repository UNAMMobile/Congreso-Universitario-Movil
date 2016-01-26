//
//  Congreso_Universitario_MovilViewController.m
//  Congreso Universitario Movil
//
//  Created by julio.guzman on 27/07/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Congreso_Universitario_MovilViewController.h"
#import "RegistroViewController.h"
#import "AcercaDeViewController.h"
#import "RedesSocialesViewController.h"
#import "AppCircusViewController.h"
#import "NoticiasViewController.h"
#import "SedeViewController.h"
#import "CalendarioViewController.h"
#import "MultimediaViewController.h"
#import "PatrocinadoresViewController.h"

#define RADIANS(degrees) ((degrees * M_PI) / 180.0)

@implementation Congreso_Universitario_MovilViewController

@synthesize label1,label2,label3,label4,label5,label6,label7, label8, label9;

-(IBAction)cambiaVista:(id)sender
{
    UIButton *button = (UIButton *)sender;
    
    if ([button.titleLabel.text compare:@"registro"]==NSOrderedSame) {
        
        [self callWobbleThreadWithLabel:label1];
        RegistroViewController *registroViewController = [[RegistroViewController alloc] initWithNibName:@"RegistroViewController" bundle:nil];
        registroViewController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
        [self presentModalViewController:registroViewController animated:YES];
        [self stopWobble:label1];
        [registroViewController release];
    }
    else if ([button.titleLabel.text compare:@"redesSociales"]==NSOrderedSame) {
        [self callWobbleThreadWithLabel:label2];
        RedesSocialesViewController *redesSocialesViewController = [[ RedesSocialesViewController alloc] initWithNibName:@"RedesSocialesViewController" bundle:nil];
        redesSocialesViewController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
        [self presentModalViewController:redesSocialesViewController animated:YES];
        [self stopWobble:label2];
        [redesSocialesViewController release];
    }
    else if ([button.titleLabel.text compare:@"appCircus"]==NSOrderedSame) {
        [self callWobbleThreadWithLabel:label3];
        AppCircusViewController *appCircusViewController = [[AppCircusViewController alloc] initWithNibName:@"AppCircusViewController" bundle:nil];
        appCircusViewController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
        [self presentModalViewController:appCircusViewController animated:YES];
        [self stopWobble:label3];
        [appCircusViewController release];
    }
    else if ([button.titleLabel.text compare:@"noticias"]==NSOrderedSame) {
        [self callWobbleThreadWithLabel:label4];
        NoticiasViewController *appCircusViewController = [[NoticiasViewController alloc] initWithNibName:@"NoticiasViewController" bundle:nil];
        appCircusViewController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
        [self presentModalViewController:appCircusViewController animated:YES];
        [self stopWobble:label4];
        [appCircusViewController release];
    }
    else if ([button.titleLabel.text compare:@"sede"]==NSOrderedSame) {
        [self callWobbleThreadWithLabel:label5];
        SedeViewController *appCircusViewController = [[SedeViewController alloc] initWithNibName:@"SedeViewController" bundle:nil];
        appCircusViewController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
        [self presentModalViewController:appCircusViewController animated:YES];
        [self stopWobble:label5];
        [appCircusViewController release];
    }
    else if ([button.titleLabel.text compare:@"calendario"]==NSOrderedSame) {
        [self callWobbleThreadWithLabel:label6];
        CalendarioViewController *appCircusViewController = [[CalendarioViewController alloc] initWithNibName:@"CalendarioViewController" bundle:nil];
        appCircusViewController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
        [self presentModalViewController:appCircusViewController animated:YES];
        [self stopWobble:label6];
        [appCircusViewController release];
    }
    else if ([button.titleLabel.text compare:@"multimedia"]==NSOrderedSame) {
       [self callWobbleThreadWithLabel:label7];
        MultimediaViewController *appCircusViewController = [[MultimediaViewController alloc] initWithNibName:@"MultimediaViewController" bundle:nil];
        appCircusViewController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
        [self presentModalViewController:appCircusViewController animated:YES];
        [self stopWobble:label7];
        [appCircusViewController release];
    }
    else if ([button.titleLabel.text compare:@"patrocinadores"]==NSOrderedSame) {
        [self callWobbleThreadWithLabel:label8];
        PatrocinadoresViewController *appCircusViewController = [[PatrocinadoresViewController alloc] initWithNibName:@"PatrocinadoresViewController" bundle:nil];
        appCircusViewController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
        [self presentModalViewController:appCircusViewController animated:YES];
        [self stopWobble:label8];
        [appCircusViewController release];
    }
    else if ([button.titleLabel.text compare:@"acercaDe"]==NSOrderedSame) {
        [self callWobbleThreadWithLabel:label9];
        AcercaDeViewController *acercaDeViewController = [[AcercaDeViewController alloc] initWithNibName:@"AcercaDeViewController" bundle:nil];
        acercaDeViewController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
        [self presentModalViewController:acercaDeViewController animated:YES];
        [self stopWobble:label9];
        [acercaDeViewController release];
    }
    
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

#pragma mark - Wobble Methods

- (void)startWobble:(UILabel *)label {
    
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    
    label.transform = CGAffineTransformRotate(CGAffineTransformIdentity, RADIANS(-5));
    
    [UIView animateWithDuration:0.25 
                          delay:0.0 
                        options:(UIViewAnimationOptionAllowUserInteraction | UIViewAnimationOptionRepeat | UIViewAnimationOptionAutoreverse)
                     animations:^ {
                         label.transform = CGAffineTransformRotate(CGAffineTransformIdentity, RADIANS(5));
                     }
                     completion:NULL
     ];
    
    [pool drain];
}

- (void)stopWobble:(UILabel *)label {
    [UIView animateWithDuration:0.25
                          delay:0.0 
                        options:(UIViewAnimationOptionAllowUserInteraction | UIViewAnimationOptionBeginFromCurrentState | UIViewAnimationOptionCurveLinear)
                     animations:^ {
                         label.transform = CGAffineTransformIdentity;
                     }
                     completion:NULL
     ];
}

-(void)callWobbleThreadWithLabel:(UILabel *)label
{
    [NSThread detachNewThreadSelector:@selector(startWobble:) 
                             toTarget:self 
                           withObject:label];    
}

#pragma mark - View lifecycle


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleBlackOpaque animated:YES];
    [super viewDidLoad];
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
