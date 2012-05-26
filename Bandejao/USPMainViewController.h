//
//  USPMainViewController.h
//  Bandejao
//
//  Created by Bruno Koga on 5/19/12.
//  Copyright (c) 2012 Ci&T. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "USPXMLParser.h"
#import "USPCardapioView.h"
#import "UIScrollView+GotoIndex.h"
#import "NSDate+Formatted.h"

@interface USPMainViewController : UIViewController <NSURLConnectionDataDelegate, UIAlertViewDelegate, UIScrollViewDelegate>

@property (retain) NSMutableData *myData;

@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) IBOutlet UIButton *fetchButton;
@property (retain) IBOutlet UIActivityIndicatorView *indicatorView;
@property (strong, nonatomic) IBOutlet UIView *templateView;
@property (strong, nonatomic) IBOutlet UIPageControl *pageControl;

- (IBAction)pageControlValueChanged:(id)sender;



- (IBAction)fetchData:(id)sender;

@end
