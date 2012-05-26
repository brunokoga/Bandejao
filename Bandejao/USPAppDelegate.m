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

- (UITabBarController*)createTabBarController;

@end


@implementation USPAppDelegate

@synthesize window = _window;


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
  
    [self.window setRootViewController:[self createTabBarController]];
      
    [self.window makeKeyAndVisible];
    
    [self teste];
    return YES;
        
}

- (UITabBarController*)createTabBarController
{
 
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    
    USPMainViewController *mainViewController = [[USPMainViewController alloc] init];
    
    
    UIImage *cardapioImage = [UIImage imageNamed:@"48-fork-and-knife.png"];
    
    NSString *cardapioTitle = @"Cardápio";
    
    UITabBarItem *mainTabBarItem = [[UITabBarItem alloc] initWithTitle:cardapioTitle image:cardapioImage tag:1];
    
    
    
    [mainViewController setTabBarItem:mainTabBarItem];

    
    UIViewController *secondViewController = [[UIViewController alloc] init];
    
    UITabBarItem *secondViewControllerTabBarItem = [[UITabBarItem alloc] initWithTitle:@"Sobre" image:[UIImage imageNamed:@"59-info.png"] tag:1];
    [secondViewController setTabBarItem:secondViewControllerTabBarItem];
    
//    [secondViewControllerTabBarItem setTitle:@"Sobre"];
    
    
    NSArray *controllers = [NSArray arrayWithObjects:mainViewController, secondViewController, nil];
    
    [tabBarController setViewControllers:controllers];
    

    return tabBarController;

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
