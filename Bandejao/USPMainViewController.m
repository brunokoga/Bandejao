//
//  USPMainViewController.m
//  Bandejao
//
//  Created by Bruno Koga on 5/19/12.
//  Copyright (c) 2012 Ci&T. All rights reserved.
//

#import "USPMainViewController.h"

@interface USPMainViewController ()

@end

@implementation USPMainViewController
@synthesize myData;
@synthesize fetchButton;
@synthesize indicatorView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        myData = [[NSMutableData alloc] init];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

}

- (void)viewDidUnload
{
    [self setFetchButton:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    NSLog(@"oi");
    return YES;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if ([string isEqualToString:@"a"])
    {
        return NO;
    }
    return YES;
}
- (IBAction)fetchData:(id)sender {
    
    [self.indicatorView startAnimating];
    
    [self.fetchButton setEnabled:NO];
        

    /*
     * Teste para arquivo grande
     */
    
   // NSString *urlString = @"http://www.zennaware.com/cornerstone/downloads/Cornerstone-2.7.5.dmg";
    
    NSString *urlString = @"http://www.pcasc.usp.br/restaurante.xml";
    
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];


    NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self startImmediately:YES];

}

#pragma mark - URL Connection Delegate


- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [self.myData appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    
    NSString *path = [documentsDirectory stringByAppendingPathComponent:@"/restaurante.xml"];
    

    [[NSUserDefaults standardUserDefaults] setObject:[NSDate date] forKey:@"ultima atualizacao"];
    
    
    [self.myData writeToFile:path atomically:YES];
    
    NSLog(@"%@",path);
    
    [self.indicatorView stopAnimating]; 
    
    NSString *string = [[NSString alloc] initWithData:self.myData encoding:NSASCIIStringEncoding];
    
    NSLog(@"%@", string);
    
    
    UIAlertView *alertView = [[UIAlertView alloc]
                              initWithTitle:@"Yay!"
                              message:@"Arquivo baixado" 
                              delegate:self 
                              cancelButtonTitle:@"OK"
                              otherButtonTitles:nil];
    [alertView show];
    
    USPXMLParser *xmlParser = [[USPXMLParser alloc] init];
    NSArray *objetos = [xmlParser arrayByParsingXML:string];
    
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    [self.indicatorView stopAnimating]; 

}

#pragma mark - Alert View Delegate

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    switch (buttonIndex) {
        case 0:
            NSLog(@"clicou");
            break;
            
        default:
            break;
    }
}




@end
