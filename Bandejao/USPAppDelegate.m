//
//  USPAppDelegate.m
//  Bandejao
//
//  Created by Bruno Koga on 5/12/12.
//  Copyright (c) 2012 Ci&T. All rights reserved.
//

#import "USPAppDelegate.h"
#import "USPRefeicao.h"
#import "USPCardapio.h"
#import "NSDate+Formatted.h"

@interface USPAppDelegate ()

//- (void)teste;

@end


@implementation USPAppDelegate

@synthesize window = _window;


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

    USPMainViewController *viewController = [[USPMainViewController alloc] init];
  
    [self.window setRootViewController:viewController];
      
    [self.window makeKeyAndVisible];
    
    [self teste];
    return YES;
        
}


- (void)teste
{
    
    NSString *format = @"dd/MM/YYYY";
    NSLog(@"%@", [[NSDate date] dateStringWithFormat:format]);
    
}


- (void)applicationDidEnterBackground:(UIApplication *)application 
{
    NSLog(@"background");
}



@end
