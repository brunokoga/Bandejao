//
//  USPCardapioTableViewController.m
//  Bandejao
//
//  Created by Bruno Koga on 5/26/12.
//  Copyright (c) 2012 Ci&T. All rights reserved.
//

#import "USPCardapioTableViewController.h"

@interface USPCardapioTableViewController ()

@end

@implementation USPCardapioTableViewController
@synthesize cardapios;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        
        self.cardapios = [NSArray array];
        /*
        mesma coisa que:
         
         com ARC:
         self.cardapios = [[NSArray alloc] init];
         
         sem ARC:
         self.cardapios = [[[NSArray alloc] init] autorelease];
         
         */
        
        
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(chegouDado:) name:@"CHEGOUDADO" object:nil];
        
        // Custom initialization
    }
    return self;
}

- (void)chegouDado:(NSNotification*)notification
{
    self.cardapios = (NSArray*)[notification.userInfo objectForKey:@"objetos"];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Cardápios";

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.cardapios count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
     NSLog(@"passou aqui");
    if (!cell) // (cell == nil)
    {
        NSLog(@"alocou celula!!");
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        
    }
    
    USPCardapio *cardapio = [self.cardapios objectAtIndex:indexPath.row];
    

    [cell.textLabel setText:[cardapio.diaSemana stringByAppendingFormat:@" - %@", cardapio.data]];
    
    
    
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIViewController *viewcontroller = [[UIViewController alloc] init];
    
   
    
        
    USPCardapio *cardapio = [self.cardapios objectAtIndex:indexPath.row];
        
        NSArray *xibArray = [[NSBundle mainBundle] loadNibNamed:@"View" owner:self options:nil];
        
        USPCardapioView *view = (USPCardapioView*)[xibArray objectAtIndex:0];
                
        [view setCardapio:cardapio];
    
    viewcontroller.view = view;
    viewcontroller.title = cardapio.diaSemana;
    
     [self.navigationController pushViewController:viewcontroller animated:YES];
        
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
     
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

@end
