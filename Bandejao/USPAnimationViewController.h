//
//  USPAnimationViewController.h
//  Bandejao
//
//  Created by Bruno Koga on 5/26/12.
//  Copyright (c) 2012 Ci&T. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface USPAnimationViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIView *quadrado;
- (IBAction)andar:(id)sender;

- (IBAction)sumir:(id)sender;
@end
