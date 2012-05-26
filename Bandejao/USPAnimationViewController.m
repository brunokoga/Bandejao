//
//  USPAnimationViewController.m
//  Bandejao
//
//  Created by Bruno Koga on 5/26/12.
//  Copyright (c) 2012 Ci&T. All rights reserved.
//

#import "USPAnimationViewController.h"

@interface USPAnimationViewController ()

@end

@implementation USPAnimationViewController
@synthesize quadrado;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [self setQuadrado:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)andar:(id)sender {
    UIView *view2 = [[UIView alloc] initWithFrame:self.view.frame];
    [view2 setBackgroundColor:[UIColor purpleColor]];
    
    [UIView transitionFromView:self.view toView:view2 duration:1.0 options:UIViewAnimationOptionTransitionCurlDown completion:^(BOOL finished) {
        self.view = view2;
        
    }];
    
        
}

- (IBAction)sumir:(id)sender {
    
    

}
@end
