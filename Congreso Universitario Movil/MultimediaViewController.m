//
//  MultimediaViewController.m
//  Congreso Universitario Movil
//
//  Created by julio.guzman on 28/07/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "MultimediaViewController.h"
#import "CustomCell.h"
#import "DetailsViewController.h"
#import "WebViewController.h"
#import "Reachability.h"
#define FEED @"http://www.congresouniversitariomovil.com/services/plist/contenidos/video"
#define PLISTNAME @"video"

#define PHOTOFEED @"http://www.congresouniversitariomovil.com/services/plist/contenidos/galeria"
#define PHOTOPLISTNAME @"photos"

@implementation MultimediaViewController

@synthesize tabBar, galeriaItem, videosItem;

@synthesize galeria,videos;

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
    
    tabBar.selectedItem = galeriaItem;
    [self startRefreshingViews];
    dictionaryArray = [self getArrayFromFeed:FEED withName:PLISTNAME];
    photoDictionaryArray = [self getArrayFromFeed:PHOTOFEED withName:PHOTOPLISTNAME];
    NSLog(@"PHOTODICTARRAY %@",photoDictionaryArray);
    [self construyeGaleria];
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

-(void)startRefreshingViews{
    timer = [NSTimer scheduledTimerWithTimeInterval:.0416
                                             target:self
                                           selector:@selector(actualizaVista)
                                           userInfo:tabBar
                                            repeats:YES];
}

-(void)actualizaVista
{
    if (tabBar.selectedItem == galeriaItem){
        [videos setHidden:YES];
        [galeria setHidden:NO];
    }
    else if (tabBar.selectedItem == videosItem){
        [videos setHidden:NO];
        [galeria setHidden:YES];
    }
    
    
}

#pragma mark - Table View Delegate

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    CustomCell *cell;
    
    cell = nil;
    
    cell = /*[*/[[CustomCell alloc] initWithFrame:CGRectZero] /*autorelease*//*]*/;
    
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
        cell.myImageView.image = [[UIImage alloc] initWithData:[[NSData alloc] initWithContentsOfURL:[[NSURL alloc] initWithString:[[dictionaryArray objectAtIndex:indexPath.row] objectForKey:@"miniatura"]]]]; 
        
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

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 75;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    WebViewController *appCircusViewController = [[WebViewController alloc] initWithMyURL:[[dictionaryArray objectAtIndex:indexPath.row] objectForKey:@"url"]  returnToNIB:@"multimedia"];
    appCircusViewController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentModalViewController:appCircusViewController animated:YES];
    
}

#pragma mark - Galeria

-(void)construyeGaleria
{
    NSMutableArray *_thumbs;
    
    UIButton * button;
    
    //button = nil;
    
    //_thumbs = nil;
        
    UIImage *thumb;
    
    thumb = [[UIImage alloc] init];
    _thumbs = [[NSMutableArray alloc] init] ; 
    
    NSLog(@"entro a construye galeria");
    
    if ([photoDictionaryArray count]==1 || [photoDictionaryArray count]==0) {
        return;
    }
    for (int i=0; i< [photoDictionaryArray count]-1 ; i++) {
        [_thumbs addObject:[[photoDictionaryArray objectAtIndex:i] objectForKey:@"miniatura"]];
    }
    
	int row = 0;
    
	int column = 0;
    
	for(int i = 0; i < _thumbs.count; i++) {
        
        button = [UIButton buttonWithType:UIButtonTypeCustom];

        id path = [_thumbs objectAtIndex:i];
        NSURL *url = [NSURL URLWithString:path];
        NSData *data = [NSData dataWithContentsOfURL:url];
        thumb = [[UIImage alloc] initWithData:data];
        
        
        NSLog(@"i = %d", i);
        
		button.frame = CGRectMake(column*100+24, row*80+10, 64, 64);
        
		[button setImage:thumb forState:UIControlStateNormal];

		[button addTarget:self 
				   action:@selector(buttonClicked:) 
		 forControlEvents:UIControlEventTouchUpInside];
        
		button.tag = i;
        
		[galeria addSubview:button];
        
		if (column == 2) {
		
            column = 0;
			row++;
            
		} else {
			
            column++;
		
        }
        
	}
	[galeria setContentSize:CGSizeMake(320, (row+1) * 80 + 10)];
    
    
}


- (IBAction)buttonClicked:(id)sender {
    UIButton *button = (UIButton *)sender;
	//UIImage *selectedImage = [_images objectAtIndex:button.tag];
    
    WebViewController *appCircusViewController = [[WebViewController alloc] initWithMyURL:[ [photoDictionaryArray objectAtIndex:button.tag] objectForKey:@"url"] returnToNIB:@"multimedia"];
    appCircusViewController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentModalViewController:appCircusViewController animated:YES];
    
	// Do something with image!
}
@end
