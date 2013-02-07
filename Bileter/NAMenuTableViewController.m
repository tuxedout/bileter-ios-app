//
//  NAMenuTableViewController.m
//  Bileter
//
//  Created by Admin on 1/15/13.
//  Copyright (c) 2013 Search Concepts AG. All rights reserved.
//

#import "NAMenuTableViewController.h"

@interface NAMenuTableViewController ()

@end

@implementation NAMenuTableViewController




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return [[SingletonForGlobalVariables sharedMySingleton].SECTIONS count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    cell.textLabel.text = [[SingletonForGlobalVariables sharedMySingleton].SECTIONS objectAtIndex:indexPath.row];
    cell.backgroundView =  [[UIImageView alloc] initWithImage:[ [UIImage imageNamed:@"cellBG.png"] stretchableImageWithLeftCapWidth:0.0 topCapHeight:5.0] ];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.backgroundColor = [UIColor clearColor];
    switch (indexPath.row) {
        case 0:
        {
            NSLog(@"plosadkiS");
            cell.imageView.image = [UIImage imageNamed:@"ploshadkiS.png"];
            break;
        }
        case 1:
        {
            cell.imageView.image = [UIImage imageNamed:@"meropriyatiyaS"];
            break;
        }
        case 2:
        {
            cell.imageView.image = [UIImage imageNamed:@"kassiS"];
            break;
        }
        case 3:
        {
            cell.imageView.image = [UIImage imageNamed:@"zakaziS"];
            break;
        }
        case 4:
        {
            cell.imageView.image = [UIImage imageNamed:@"izbrannoeS"];
            break;
        }
        case 5:
        {
            cell.imageView.image = [UIImage imageNamed:@"nastroykiS"];
            break;
        }
        case 6:
        {
           cell.backgroundView =  [[UIImageView alloc] initWithImage:[ [UIImage imageNamed:@"bileterBG.png"] stretchableImageWithLeftCapWidth:0.0 topCapHeight:5.0] ];
            cell.textLabel.textColor = [UIColor whiteColor];
            break;
        }
        case 7:
        {
            cell.imageView.image = [UIImage imageNamed:@"akziiS"];
            break;
        }
        case 8:
        {
            cell.imageView.image = [UIImage imageNamed:@"newsS"];
            break;
        }
        case 9:
        {
            cell.imageView.image = [UIImage imageNamed:@"popularS"];
            break;
        }
        case 10:
        {
            cell.imageView.image = [UIImage imageNamed:@"anonsesS"];
            break;
        }
        case 11:
        {
            cell.imageView.image = [UIImage imageNamed:@"usefulInfoS"];
            break;
        }
        case 12:
        {
            cell.imageView.image = [UIImage imageNamed:@"pravilaZalazaS"];
            break;
        }
        case 13:
        {
            cell.imageView.image = [UIImage imageNamed:@"contactsS"];
            break;
        }
        case 14:
        {
            cell.imageView.image = [UIImage imageNamed:@"aboutS"];
            break;
        }
        default:
            break;
    }
   
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
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
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
    ViewController *view = (ViewController *)[SingletonForGlobalVariables sharedMySingleton].mainController;
    [view pushAControllerWithIndex:indexPath.row source:0];
}

@end
