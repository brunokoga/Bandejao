//
//  USPMainViewController.h
//  Bandejao
//
//  Created by Bruno Koga on 5/19/12.
//  Copyright (c) 2012 Ci&T. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "USPXMLParser.h"

@interface USPMainViewController : UIViewController <NSURLConnectionDataDelegate, UIAlertViewDelegate>

@property (retain) NSMutableData *myData;

@property (strong, nonatomic) IBOutlet UIButton *fetchButton;
@property (retain) IBOutlet UIActivityIndicatorView *indicatorView;

- (IBAction)fetchData:(id)sender;

@end
