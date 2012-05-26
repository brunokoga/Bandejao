//
//  USPMainViewController.m
//  Bandejao
//
//  Created by Bruno Koga on 5/19/12.
//  Copyright (c) 2012 Ci&T. All rights reserved.
//

#import "USPMainViewController.h"

@interface USPMainViewController ()

- (void)adjustScrollViewWithCardapios:(NSArray*)cardapios;
@end

@implementation USPMainViewController
@synthesize myData;
@synthesize scrollView;
@synthesize fetchButton;
@synthesize indicatorView;
@synthesize templateView;
@synthesize pageControl;

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
    [self.pageControl setHidden:YES];

}

- (void)viewDidUnload
{
    [self setFetchButton:nil];
    [self setScrollView:nil];
    [self setTemplateView:nil];
    [self setPageControl:nil];
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
- (IBAction)pageControlValueChanged:(id)sender
{
    UIPageControl *senderPageControl = (UIPageControl*)sender;
    [self.scrollView showViewAtIndex:senderPageControl.currentPage];
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


//    NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self startImmediately:YES];

    [NSURLConnection connectionWithRequest:request delegate:self];

}

#pragma mark - URL Connection Delegate


- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [self.myData appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    [self.fetchButton setEnabled:YES];
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    
    NSString *path = [documentsDirectory stringByAppendingPathComponent:@"/restaurante.xml"];
    

    [[NSUserDefaults standardUserDefaults] setObject:[NSDate date] forKey:@"ultima atualizacao"];
    
    
    [self.myData writeToFile:path atomically:YES];
    
    NSLog(@"%@",path);
    
    [self.indicatorView stopAnimating]; 
    
    NSString *string = [[NSString alloc] initWithData:self.myData encoding:NSISOLatin1StringEncoding];
    
    UIAlertView *alertView = [[UIAlertView alloc]
                              initWithTitle:@"Yay!"
                              message:@"Arquivo baixado" 
                              delegate:self 
                              cancelButtonTitle:@"OK"
                              otherButtonTitles:nil];
    [alertView show];
    
    USPXMLParser *xmlParser = [[USPXMLParser alloc] init];
    NSArray *objetos = [xmlParser arrayByParsingXML:string];
    
    [self adjustScrollViewWithCardapios:objetos];
    
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    [self.indicatorView stopAnimating]; 
    [self.fetchButton setEnabled:YES];
    
    UIAlertView *alertView = [[UIAlertView alloc]
                              initWithTitle:@""
                              message:@":(" 
                              delegate:self 
                              cancelButtonTitle:@"OK"
                              otherButtonTitles:nil];
    [alertView show];



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

#pragma mark -
#pragma mark ScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)sender {
	
    
    NSLog(@"scroll!");

    // Switch the indicator when more than 50% of the previous/next page is visible
    CGFloat pageWidth = self.scrollView.frame.size.width;
    int page = floor((self.scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
   // myPageControl.currentPage = page;
//	[self updateDots];
    
    [self.pageControl setCurrentPage:page];
	
    // load the visible page and the page on either side of it (to avoid flashes when the user starts scrolling)
    [self loadScrollViewWithPage:page - 1];
    [self loadScrollViewWithPage:page];
    [self loadScrollViewWithPage:page + 1];
	
    // A possible optimization would be to unload the views+controllers which are no longer visible
}



#pragma mark -
#pragma mark Outros

- (void)loadScrollViewWithPage:(int)page {
    if (page < 0) return;
    /*
    if (page >= [destaques count]) return;
	
    
    // replace the placeholder if necessary
    DestaqueView *destaque = [destaques objectAtIndex:page];
    if ((NSNull *)destaque == [NSNull null]) {
        destaque = [[DestaqueView alloc] initWithDestaque:nil]; //aaaaaaaaaaaaaaa
        [destaques replaceObjectAtIndex:page withObject:destaque];
        [destaque release];
    }
	
    // add the controller's view to the scroll view
    if (nil == destaque.superview) {
        CGRect frame = myScrollView.frame;
        frame.origin.x = frame.size.width * page;
        frame.origin.y = 0;
        destaque.frame = frame;
        [myScrollView addSubview:destaque];
    }
     */
}

//- (void)changePage:(id)sender {
//    int page = myPageControl.currentPage;
//	
//    // load the visible page and the page on either side of it (to avoid flashes when the user starts scrolling)
//    [self loadScrollViewWithPage:page - 1];
//    [self loadScrollViewWithPage:page];
//    [self loadScrollViewWithPage:page + 1];
//    
//	// update the scroll view to the appropriate page
//    CGRect frame = myScrollView.frame;
//    frame.origin.x = frame.size.width * page;
//    frame.origin.y = 0;
//    [myScrollView scrollRectToVisible:frame animated:YES];
//    
//	// Set the boolean used when scrolls originate from the UIPageControl. See scrollViewDidScroll: above.
//    pageControlUsed = YES;
//}

-(void)updateDots {
    /*
	if (lastPage != [myPageControl currentPage]) {
        for (int i=0; i<[[myPageControl subviews] count]; i++) {
            UIImage *dot;
            if (i==[myPageControl currentPage]) {
                dot = [UIImage imageNamed:kp_page_control_selected];
            }
            else {
                dot = [UIImage imageNamed:kp_page_control];
            }
            
            [(UIImageView*)[[myPageControl subviews] objectAtIndex:i] setImage:dot];
            lastPage = [myPageControl currentPage];
        }
	}
	*/
}

- (void)adjustScrollViewWithCardapios:(NSArray*)cardapios
{
    int numberOfViews = [cardapios count];
    float width = numberOfViews * self.view.frame.size.width;
    
    [self.pageControl setHidden:NO];
    self.pageControl.numberOfPages = numberOfViews;
    
    [self.scrollView setContentSize:CGSizeMake(width, self.scrollView.frame.size.height)];
    
    
    /*
    NSArray *colors = [NSArray arrayWithObjects:[UIColor redColor],
                       [UIColor cyanColor],
                       [UIColor greenColor],
                       [UIColor purpleColor],
                       [UIColor orangeColor],
                       [UIColor blueColor], nil];
     
     */
    
    int index = 0;
    NSString *hoje = [[NSDate date] dateStringWithDefaultFormat];
    
    for (USPCardapio *cardapio in cardapios)
    {
        int i = [cardapios indexOfObject:cardapio];
        
        NSArray *xibArray = [[NSBundle mainBundle] loadNibNamed:@"View" owner:self options:nil];
        
        USPCardapioView *view = (USPCardapioView*)[xibArray objectAtIndex:0];
        
        [view setFrame:CGRectMake(self.scrollView.frame.size.width * i, self.scrollView.frame.origin.y, self.scrollView.frame.size.width, self.scrollView.frame.size.height)];
        
        
        view.DiaDaSemanaLabel.text = cardapio.diaSemana;
        
        view.dataLabel.text = cardapio.data;

        if ([cardapio.data isEqualToString:hoje])
        {
            index = i;
        }

        view.almocoSaladaLabel.text = cardapio.almoco.salada;
        [[view almocoAcompanhamentoLabel] setText:[[cardapio almoco] acompanhamento]];
        view.almocoPrincipalLabel.text = cardapio.almoco.principal;
        view.almocoSobremesaLabel.text = cardapio.almoco.sobremesa;
        
        view.jantarSaladaLabel.text = cardapio.jantar.salada;
        view.jantarPrincipalLabel.text = cardapio.jantar.principal;
        view.jantarAcompanhamentoLabel.text = cardapio.jantar.acompanhamento;
        view.jantarSobremesaLabel.text = cardapio.jantar.sobremesa;
        
        //    [view setBackgroundColor:(UIColor*)[colors objectAtIndex:i]];
        
        [self.scrollView addSubview:view];
        
    }
    
    
    UITapGestureRecognizer *doubleTapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(refreshCardapios)];
    
    [doubleTapRecognizer setNumberOfTapsRequired:2];
    
    
    [self.scrollView addGestureRecognizer:doubleTapRecognizer];
    
    [self.scrollView showViewAtIndex:index animated:NO];
     
                       
    
}

- (void)refreshCardapios 
{
    
    NSLog(@"double tap");
    /*
    CGRect frame = self.scrollView.frame;
    frame.origin.x = frame.size.width * 5;
    frame.origin.y = 0;
    [self.scrollView scrollRectToVisible:frame animated:YES];
     */
    
    
}
    



@end
