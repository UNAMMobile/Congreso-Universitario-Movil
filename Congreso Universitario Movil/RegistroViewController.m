//
//  RegistroViewController.m
//  Congreso Universitario Movil
//
//  Created by julio.guzman on 28/07/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "RegistroViewController.h"
#import "Reachability.h"
#define POSTURL @"http://www.congresouniversitariomovil.com/services/user"

@implementation RegistroViewController




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
    tipo = @"asistente";
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

- (BOOL)textFieldShouldReturn:(UITextField *)textField_ { // When the return button is pressed on a textField.
	[textField_ resignFirstResponder]; // Remove the keyboard from the view.
	return YES; // Set the BOOL to YES.
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)thePickerView { // This method needs to be used. It asks how many columns will be used in the UIPickerView
	return 1; // We only need one column so we will return 1.
}

- (NSInteger)pickerView:(UIPickerView *)thePickerView numberOfRowsInComponent:(NSInteger)component { // This method also needs to be used. This asks how many rows the UIPickerView will have.
	return 2; // We will need the amount of rows that we used in the pickerViewArray, so we will return the count of the array.
}

- (NSString *)pickerView:(UIPickerView *)thePickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component { // This method asks for what the title or label of each row will be.
	if (row==0) {
        return @"Asistente al evento";
    }
    return @"Prensa";// We will set a new row for every string used in the array.
}

- (void)pickerView:(UIPickerView *)thePickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component { // And 
    if (row==0) {
        tipo = @"asistente";
       
    }
    else{
    tipo = @"medio";
    }
    
}
#pragma mark - POST

-(IBAction)post
{

    mail = textField.text;

    Reachability* wifiReach = [[Reachability reachabilityWithHostName: @"www.apple.com"] retain];
    NetworkStatus netStatus = [wifiReach currentReachabilityStatus];
    
    switch (netStatus)
    {
        case NotReachable:
        {
            [self callAlert:@"Es necesaria una conexión a internet para completar tu registro." withMessage:nil];
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
    
    if ( [self itIsAMail]) {
        
        
        
        NSString *post =[[NSString alloc] initWithFormat:@"mail=%@&tipo=%@&",mail,tipo];
        
        NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding  allowLossyConversion:YES];
        
        NSString *postLength = [NSString stringWithFormat:@"%d", [postData length]];
        
        NSMutableURLRequest *request = [[[NSMutableURLRequest alloc] init] autorelease];
        
        [request setURL:[[NSURL alloc] initWithString:POSTURL]]; 
        [request setHTTPMethod:@"GET"]; 
        [request setValue:postLength forHTTPHeaderField:@"Content-Length"]; 
        [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"]; 
        [request setHTTPBody:postData];
        
        NSURLConnection *connection= [[NSURLConnection alloc] initWithRequest:request 
                                                                     delegate:self];
        NSLog(@"%@",connection);
    }
    else{
        [self callAlert:@"Por favor introduce un correo electronico válido" withMessage:nil];
    }
    
}

-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
}

-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    NSLog(@"Data %@ ",data);
    NSString *d = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"%@", d);
    
    @try {
        
        NSArray *arrayerror1 = [d componentsSeparatedByString:@"<error>"];
        
        NSArray *arrayerror2 = [[arrayerror1 objectAtIndex:1] componentsSeparatedByString:@"</error>"];
        
        d= [arrayerror2 objectAtIndex:0];

    }
    @catch (NSException *exception) {
        
        NSArray *array1 = [d componentsSeparatedByString:@"<exito>"];
        
        NSArray *array2 = [[array1 objectAtIndex:1] componentsSeparatedByString:@"</exito>"];
        
        d= [array2 objectAtIndex:0];
    }

    
    [self callAlert:d withMessage:nil];
    
}



-(BOOL)itIsAMail
{
    
    NSRange textRange = [mail rangeOfString:@"@"];
    NSRange textRange2 = [mail rangeOfString:@"."];
    
    if(textRange.location != NSNotFound && textRange2.location != NSNotFound )
    {
        NSArray *arr = [mail componentsSeparatedByCharactersInSet:
                        [NSCharacterSet characterSetWithCharactersInString:@"@."]];
        
        if([[arr objectAtIndex:[arr count]-1] compare:@"" options:NSCaseInsensitiveSearch] == NSOrderedSame){
            return false;
        }
        else{
            return true;
            
        }
        
    }
    return false;
    
}


@end
