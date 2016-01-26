//
//  Vista.m
//  Congreso Universitario Movil
//
//  Created by julio.guzman on 28/07/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Vista.h"
#import "Congreso_Universitario_MovilViewController.h"
#import "Reachability.h"

@implementation Vista

#pragma mark - IBActions

-(IBAction)menuRaiz
{
    Congreso_Universitario_MovilViewController *congreso_Universitario_MovilViewController = [[Congreso_Universitario_MovilViewController alloc] initWithNibName:nil bundle:nil];
    congreso_Universitario_MovilViewController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentModalViewController:congreso_Universitario_MovilViewController animated:YES];
    [congreso_Universitario_MovilViewController release];
}

#pragma mark - Plist Management

-(NSMutableArray *)buildArrayFromURL:(NSString *)url
{
    
    NSURL *_url = [[NSURL alloc ] initWithString:url];
    
    NSMutableArray *array = [[NSMutableArray alloc] initWithContentsOfURL:_url];
    
    return array;
}

-(NSMutableArray *)buildArrayFromPlist:(NSString *)plistName
{
    return [self loadPlist:plistName];
}

- (void)savePlist:(NSString*)url name:(NSString*)plistName {
    
    NSURL *_url = [[NSURL alloc ] initWithString:url];
    
    NSData *_plist = [[NSData alloc] initWithContentsOfURL:_url];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];//create instance of NSFileManager
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES); //create an array and store result of our search for the documents directory in it
    
    NSString *documentsDirectory = [paths objectAtIndex:0]; //create NSString object, that holds our exact path to the documents directory
    
    NSString *fullPath = [documentsDirectory stringByAppendingPathComponent:[NSString stringWithFormat:@"%@", plistName]]; //add our image to the path
    
    [fileManager createFileAtPath:fullPath contents:_plist attributes:nil]; //finally save the path (image)
    
    
}


- (void)removePlist:(NSString*)plistName{
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    NSString *documentsDirectory = [paths objectAtIndex:0];
    
    NSString *fullPath = [documentsDirectory stringByAppendingPathComponent:[NSString stringWithFormat:@"%@", plistName]];
    
    [fileManager removeItemAtPath: fullPath error:NULL];
    
    
}


- (NSMutableArray*)loadPlist:(NSString*)plistName {
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    NSString *documentsDirectory = [paths objectAtIndex:0];
    
    NSString *fullPath = [documentsDirectory stringByAppendingPathComponent:[NSString stringWithFormat:@"%@", plistName]];
    
    return [[NSMutableArray alloc] initWithContentsOfFile:fullPath];
    
}

-(BOOL)searchPlist:(NSString*)plistName
{
    NSString* documentsPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    
    if ([[NSFileManager defaultManager] fileExistsAtPath:[documentsPath stringByAppendingPathComponent:plistName]]) {
        
        return YES;
        
    } 
    
    return NO;
    
}

-(BOOL)needsRefreshPlist:(NSString *)plistName feed:(NSString *)feed
{
    
    if ([self searchPlist:plistName]) {
        
        @try {
            
            NSMutableArray *array = [self loadPlist:plistName];
            
            NSString *number = [array objectAtIndex:(array.count-1)];
            
            NSString *newfeed = [[feed stringByAppendingString:@"/?date="] stringByAppendingString:number];
                        
            array = [self buildArrayFromURL:newfeed];
            
            if ([array objectAtIndex:0]==nil) {
                
                return NO;
                
            }
            
            else{
                
                [self savePlist:newfeed name:plistName];
                
                return YES;
                
            }

        }
        @catch (NSException *exception) {
            
            Reachability* wifiReach = [[Reachability reachabilityWithHostName: @"www.apple.com"] retain];
            NetworkStatus netStatus = [wifiReach currentReachabilityStatus];
            
            switch (netStatus)
            {
                case NotReachable:
                {
                    [self callAlert:@"Oh no! Necesitas una conexión a internet." withMessage:nil];
                    return YES;
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
            
            [self savePlist:feed name:plistName];
 
            return YES;
        }
        
    }
    
    else{
        
        [self savePlist:feed name:plistName];
        
        Reachability* wifiReach = [[Reachability reachabilityWithHostName: @"www.apple.com"] retain];
        NetworkStatus netStatus = [wifiReach currentReachabilityStatus];
        
        switch (netStatus)
        {
            case NotReachable:
            {
                [self callAlert:@"Oh no! Necesitas una conexión a internet." withMessage:nil];
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
        
        return YES;
    
    }
    
}


-(NSMutableArray*)getArrayFromFeed:(NSString*)feed withName:(NSString*)plistName
{
    
    if ([self needsRefreshPlist:plistName feed:feed]) {
        
        return [self buildArrayFromURL:feed];
    
    }
    
    else{
    
        return [self loadPlist:plistName];
        
    }
    
}


-(BOOL)dataOnPlistArray:(NSMutableArray*)dictionaryArray{
    
    if([[dictionaryArray objectAtIndex:0] isKindOfClass:[NSString class]/*NSCFString*/]){
        
        return NO;

    }
    
    else{
        
        return YES;
        
    }
    
}

#pragma mark - Alerts

-(void)callAlert:(NSString *)title withMessage:(NSString *)message
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title 
                                                    message:message
                                                   delegate:nil 
                                          cancelButtonTitle:@"OK" 
                                          otherButtonTitles: nil];
    
    [alert show];
    
    [alert release];

}

#pragma mark - Appeareance

-(void)setBackgroundFromImage:(NSString*)image
{
  
    UIColor *background = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:image]];
    
    self.view.backgroundColor = background;
    
    [background release];
}


@end
