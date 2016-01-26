//
//  CalendarioViewController.m
//  Congreso Universitario Movil
//
//  Created by julio.guzman on 28/07/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CalendarioViewController.h"
#import "CustomCell.h"
#import "DayCell.h"
#import "DetailsViewController.h"
#import "Reachability.h"
#define FEED @"http://www.congresouniversitariomovil.com/services/plist/dias"
#define PLISTNAME @"calendario"

#define DAYFEED @"http://www.congresouniversitariomovil.com/services/plist/eventos/"

@implementation CalendarioViewController

@synthesize tabBar, lunesItem, martesItem, miercolesItem, juevesItem, viernesItem;

@synthesize lunes, martes, miercoles, jueves, viernes;

@synthesize lunesTable, martesTable, miercolesTable, juevesTable, viernesTable;

NSTimer *timer;


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
    tabBar.selectedItem = lunesItem;   
    [self startRefreshingViews];
    [super viewDidLoad];
    ///////////////////
    ///////////////////
    
  
    
    [self fillDayArrays];
    NSLog(@"%@",day1Array);
    
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

#pragma mark - Actualiza Vistas

-(void)startRefreshingViews{
    timer = [NSTimer scheduledTimerWithTimeInterval:.0416
                                             target:self
                                           selector:@selector(actualizaVista)
                                           userInfo:tabBar
                                            repeats:YES];
}

-(void)actualizaVista
{
    if (tabBar.selectedItem == lunesItem){
        [lunes setHidden:NO];
        [martes setHidden:YES];
        [miercoles setHidden:YES];
        [jueves setHidden:YES];
        [viernes setHidden:YES];
        
    }
    else if (tabBar.selectedItem == martesItem){
        [lunes setHidden:YES];
        [martes setHidden:NO];
        [miercoles setHidden:YES];
        [jueves setHidden:YES];
        [viernes setHidden:YES];
        
    }
    else if (tabBar.selectedItem == miercolesItem){
        [lunes setHidden:YES];
        [martes setHidden:YES];
        [miercoles setHidden:NO];
        [jueves setHidden:YES];
        [viernes setHidden:YES];
        
    }
    else if (tabBar.selectedItem == juevesItem){
        [lunes setHidden:YES];
        [martes setHidden:YES];
        [miercoles setHidden:YES];
        [jueves setHidden:NO];
        [viernes setHidden:YES];
        
    }
    else if (tabBar.selectedItem == viernesItem){
        [lunes setHidden:YES];
        [martes setHidden:YES];
        [miercoles setHidden:YES];
        [jueves setHidden:YES];
        [viernes setHidden:NO];
        
    }
    
}

#pragma mark - Day Management

-(void)fillDayArrays
{
    @try {
        
        daysArray = [self getArrayFromFeed:FEED withName:PLISTNAME];
        
        day1Array = [self getArrayFromFeed:[DAYFEED stringByAppendingString:[[daysArray objectAtIndex:0] objectForKey:@"id"]] withName:@"day1"];
        day2Array = [self getArrayFromFeed:[DAYFEED stringByAppendingString:[[daysArray objectAtIndex:1] objectForKey:@"id"]] withName:@"day2"];
        day3Array = [self getArrayFromFeed:[DAYFEED stringByAppendingString:[[daysArray objectAtIndex:2] objectForKey:@"id"]] withName:@"day3"];
        day4Array = [self getArrayFromFeed:[DAYFEED stringByAppendingString:[[daysArray objectAtIndex:3] objectForKey:@"id"]] withName:@"day4"];
        day5Array = [self getArrayFromFeed:[DAYFEED stringByAppendingString:[[daysArray objectAtIndex:4] objectForKey:@"id"]] withName:@"day5"];
    
    }
    @catch (NSException *exception) {
        
        NSLog(@"Error in fillDayArrays");
        
    }

}

#pragma mark - Table View Delegate

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 0) {
        
        DayCell *cell;
        
        cell = nil;
        
        cell = [[[DayCell alloc] initWithFrame:CGRectZero] autorelease];
        
        NSDictionary *day;
        
        switch (tableView.tag) {
                
            case 1:
                day = [daysArray objectAtIndex:0] ;
                break;
                
            case 2:
                day = [daysArray objectAtIndex:1] ;
                break;
                
            case 3:
                day = [daysArray objectAtIndex:2] ;
                break;
                
            case 4:
                day = [daysArray objectAtIndex:3] ;
                break;
                
            case 5:
                day = [daysArray objectAtIndex:4] ;
                break;
                
            default:
                return cell;
                break;
        }
        
        /*cell.primaryLabel.text = [day objectForKey:@"titulo"];
        
        cell.secondaryLabel.text = [[[day objectForKey:@"fecha"] stringByAppendingString:@" | "] stringByAppendingString:[day objectForKey:@"descripcion"]];*/
        
        @try {
            cell.primaryLabel.text = [day objectForKey:@"titulo"];
        }
        @catch (NSException *exception) {}
        
        @try {
            cell.secondaryLabel.text = [[[day objectForKey:@"fecha"] stringByAppendingString:@" | "] stringByAppendingString: [day objectForKey:@"descripcion"]];
        }
        @catch (NSException *exception) {
            @try {
                
                cell.secondaryLabel.text = [day objectForKey:@"fecha"];
                
            }
            @catch (NSException *exception) {
                
                cell.secondaryLabel.text = [day objectForKey:@"descripcion"];
                
            }
        }
        
        return cell;
        
    }
    else{
        
        CustomCell *cell;
        
        cell = nil;
        
        cell = [[[CustomCell alloc] initWithFrame:CGRectZero] autorelease];
    
        NSMutableArray *variableDayArray;
    
        switch (tableView.tag) {
            case 1:
                variableDayArray = day1Array;
                break;
            
            case 2:
                variableDayArray = day2Array;
                break;
            
            case 3:
                variableDayArray = day3Array;
                break;
            
            case 4:
                variableDayArray = day4Array;
                break;
            
            case 5:
                variableDayArray = day5Array;
                break;
            
            default:
                return cell;
                break;
        }
        
        @try {
            cell.primaryLabel.text = [[variableDayArray objectAtIndex:indexPath.row-1] objectForKey:@"titulo"];
        }
        @catch (NSException *exception) {}
        
        @try {
            cell.secondaryLabel.text = [[[[variableDayArray objectAtIndex:indexPath.row-1] objectForKey:@"fecha"] stringByAppendingString:@" | "] stringByAppendingString:[[variableDayArray objectAtIndex:indexPath.row-1] objectForKey:@"descripcion"]];
        }
        @catch (NSException *exception) {
            @try {
                
                cell.secondaryLabel.text = [[variableDayArray objectAtIndex:indexPath.row-1] objectForKey:@"fecha"];
            
            }
            @catch (NSException *exception) {
                
                cell.secondaryLabel.text = [[variableDayArray objectAtIndex:indexPath.row-1] objectForKey:@"descripcion"];
            
            }
        }
        
        @try {
            
            //Obtener la imagen de Internet
            cell.myImageView.image = [[UIImage alloc] initWithData:[[NSData alloc] initWithContentsOfURL:[[NSURL alloc] initWithString:[[variableDayArray objectAtIndex:indexPath.row-1] objectForKey:@"imagen"]]]]; 
        
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
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    NSMutableArray *variableDayArray;
    
    switch (tableView.tag) {
        case 1:
            variableDayArray = day1Array;
            break;
            
        case 2:
            variableDayArray = day2Array;
            break;
            
        case 3:
            variableDayArray = day3Array;
            break;
            
        case 4:
            variableDayArray = day4Array;
            break;
            
        case 5:
            variableDayArray = day5Array;
            break;
            
        default:
            return 0;
            break;
    }
    
    return [variableDayArray count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row==0) {
        return 75;
    }
    return 75;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row==0) {
        return;
    }
    if (tableView.tag == 1) {
        DetailsViewController *appCircusViewController = [[DetailsViewController alloc] initWithTitle:[[day1Array objectAtIndex:indexPath.row-1] objectForKey:@"titulo"] andText:[[day1Array objectAtIndex:indexPath.row-1] objectForKey:@"descripcion"] returnToNIB:@"calendario" ];
        appCircusViewController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
        [self presentModalViewController:appCircusViewController animated:YES];
    } 
    
    if (tableView.tag == 2) {
        DetailsViewController *appCircusViewController = [[DetailsViewController alloc] initWithTitle:[[day2Array objectAtIndex:indexPath.row-1] objectForKey:@"titulo"] andText:[[day2Array objectAtIndex:indexPath.row-1] objectForKey:@"descripcion"] returnToNIB:@"calendario"];
        appCircusViewController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
        [self presentModalViewController:appCircusViewController animated:YES];
    } 
    
    if (tableView.tag == 3) {
        DetailsViewController *appCircusViewController = [[DetailsViewController alloc] initWithTitle:[[day3Array objectAtIndex:indexPath.row-1] objectForKey:@"titulo"] andText:[[day3Array objectAtIndex:indexPath.row-1] objectForKey:@"descripcion"] returnToNIB:@"calendario"];
        appCircusViewController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
        [self presentModalViewController:appCircusViewController animated:YES];
    } 
    
    
    if (tableView.tag == 4) {
        DetailsViewController *appCircusViewController = [[DetailsViewController alloc] initWithTitle:[[day4Array objectAtIndex:indexPath.row-1] objectForKey:@"titulo"] andText:[[day4Array objectAtIndex:indexPath.row-1] objectForKey:@"descripcion"] returnToNIB:@"calendario"];
        appCircusViewController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
        [self presentModalViewController:appCircusViewController animated:YES];
    } 

    else if (tableView.tag == 5) {
        DetailsViewController *appCircusViewController = [[DetailsViewController alloc] initWithTitle:[[day5Array objectAtIndex:indexPath.row-1] objectForKey:@"titulo"] andText:[[day5Array objectAtIndex:indexPath.row-1] objectForKey:@"descripcion"] returnToNIB:@"calendario"];
        appCircusViewController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
        [self presentModalViewController:appCircusViewController animated:YES];
    } 
    
}


@end
