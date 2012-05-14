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
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor redColor];
    [self.window makeKeyAndVisible];
    
    [self teste];
    return YES;
        
}


- (void)teste
{
    
/*    
    
        USPRefeicao *almoco = [[USPRefeicao alloc] init];        
        almoco.salada = @"alface";
        [almoco setPrincipal:@"arroz e feijão"];
        [almoco setAcompanhamento:@"aaa"];
        almoco.sobremesa = @"laranja";

    
    USPRefeicao *janta = [[USPRefeicao alloc] init];        
    janta.salada = @"alface";
    [janta setPrincipal:@"arroz e feijão"];
    [janta setAcompanhamento:@"aaa"];
    janta.sobremesa = @"laranja";
    
    USPCardapio *cardapio = [[USPCardapio alloc] init];
    cardapio.diaSemana = @"segunda";
    cardapio.data = @"11/11/11";
    cardapio.almoco = almoco;
    [cardapio setJantar:janta];
        
    NSString *path = [[NSBundle mainBundle] pathForResource:@"restaurante" ofType:@"xml"];
    
    NSString *xml = [NSString stringWithContentsOfFile:path
                                              encoding:NSASCIIStringEncoding
                                                 error:nil];
    
    NSLog(@"%@",xml);
 
 */
    
    NSString *format = @"dd/MM/YYYY";
    NSLog(@"%@", [[NSDate date] dateStringWithFormat:format]);
    

    
}


@end
