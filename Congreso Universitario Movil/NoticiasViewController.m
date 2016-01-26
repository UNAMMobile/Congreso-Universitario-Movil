//
//  NoticiasViewController.m
//  Congreso Universitario Movil
//
//  Created by julio.guzman on 28/07/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "NoticiasViewController.h"
#import "CustomCell.h"
#import "DetailsViewController.h"
#import <Foundation/NSException.h>
#import "Reachability.h"
#define FEED @"http://www.congresouniversitariomovil.com/services/plist/noticias/cum"
#define PLISTNAME @"noticias"


@implementation NoticiasViewController

@synthesize tableView;

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
    
    dictionaryArray = [self getArrayFromFeed:FEED withName:PLISTNAME];
    

    
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

#pragma mark - Table View Delegate

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    CustomCell *cell;
    
    cell = nil;
    
    cell = [[[CustomCell alloc] initWithFrame:CGRectZero] autorelease];
    
  
        
    @try {
        
        cell.primaryLabel.text = [[dictionaryArray objectAtIndex:indexPath.row ] objectForKey:@"titulo"];
        
    }
    
    @catch (NSException *exception) {}
    
    @try {
        
        cell.secondaryLabel.text = [[[[dictionaryArray objectAtIndex:indexPath.row] objectForKey:@"fecha"] stringByAppendingString:@" | "] stringByAppendingString:[[dictionaryArray objectAtIndex:indexPath.row] objectForKey:@"descripcion"]];
        
    }
    
    @catch (NSException *exception) {
        
        @try {
            
            cell.secondaryLabel.text = [[dictionaryArray objectAtIndex:indexPath.row] objectForKey:@"fecha"];
            
        }
        
        @catch (NSException *exception) {
            
            cell.secondaryLabel.text = [[dictionaryArray objectAtIndex:indexPath.row] objectForKey:@"descripcion"];
            
        }
        
    }
        
    @try {
        //Obtener la imagen de Internet
        cell.myImageView.image = [[UIImage alloc] initWithData:[[NSData alloc] initWithContentsOfURL:[[NSURL alloc] initWithString:[[dictionaryArray objectAtIndex:indexPath.row] objectForKey:@"imagen"]]]]; 
            
        Reachability* wifiReach = [[Reachability reachabilityWithHostName: @"www.apple.com"] retain];
        NetworkStatus netStatus = [wifiReach currentReachabilityStatus];
        
        switch (netStatus)
        {
            case NotReachable:
            {
                cell.myImageView.image =  [UIImage imageNamed:@"imagen_vacia.png"];
                break;
            }
                
            case ReachableViaWWAN:
            {
                break;
            }
            case ReachableViaWiFi:
            {
                break;
            }
        }
    } @catch ( NSException *e ) {
            
        cell.myImageView.image =  [UIImage imageNamed:@"imagen_vacia.png"];
            
    }    
        
    
    return cell;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [dictionaryArray count] - 1;
}



#pragma mark - Table View Data Source

@end
