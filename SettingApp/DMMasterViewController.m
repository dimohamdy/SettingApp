//
//  DMMasterViewController.m
//  SettingApp
//
//  Created by AhmedHamdy on 5/23/14.
//  Copyright (c) 2014 AhmedHamdy. All rights reserved.
//

#import "DMMasterViewController.h"

#import "DMDetailViewController.h"
#import "DMItemTableViewCell.h"
#import "DMSettingItem.h"
#import "DMMultiValueViewController.h"
@interface DMMasterViewController () {
    NSMutableArray *_objects;
}
@end

@implementation DMMasterViewController{
    
    NSMutableArray*items;
    NSArray*imageNames;
    NSArray*texts;
    NSArray*controls;
    
    
    
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Master", @"Master");
        if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
            self.clearsSelectionOnViewWillAppear = NO;
            self.contentSizeForViewInPopover = CGSizeMake(320.0, 600.0);
        }
    }
    return self;
}
							
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
//    self.navigationItem.leftBarButtonItem = self.editButtonItem;
//
//    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
//    self.navigationItem.rightBarButtonItem = addButton;
    
    
    self.detailViewController = (DMDetailViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];
    /*********************************************/
    
    imageNames=@[@"1.jpeg",@"2.jpeg",@"3.jpeg",@"4.jpeg",@"5.gif",@"6.gif",@"7.gif",@"8.gif"];
    texts=@[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8"];
    controls=@[[NSNumber numberWithBool:YES],[NSNumber numberWithBool:NO],[NSNumber numberWithBool:YES],[NSNumber numberWithBool:NO],[NSNumber numberWithBool:YES],[NSNumber numberWithBool:NO],[NSNumber numberWithBool:YES],[NSNumber numberWithBool:NO]];
    
    items=[[NSMutableArray alloc]init];
    for (int count=1; count<8; count++) {
        
        DMSettingItem*objDMSettingItem=[[DMSettingItem alloc]initWithImageName:[imageNames objectAtIndex:count] AndWithlblText:[texts objectAtIndex:count] AndWithDetailsOrSwitch:[[controls objectAtIndex:count] intValue]   AndWithClassName:[DMMultiValueViewController class] ];
        
        
        [items addObject:objDMSettingItem];
        
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)insertNewObject:(id)sender
{
    if (!_objects) {
        _objects = [[NSMutableArray alloc] init];
    }
    [_objects insertObject:[NSDate date] atIndex:0];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//    return _objects.count;
    NSLog(@"%d",items.count);
    return items.count;

}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    static NSString *CellIdentifier = @"Cell";
//    
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
//    if (cell == nil) {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
//        if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
//            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
//        }
//    }
//
//
//    NSDate *object = _objects[indexPath.row];
//    cell.textLabel.text = [object description];
//    return cell;
    
    
    static NSString *SimpleTableIdentifier = @"DMItemTableViewCell";
    DMItemTableViewCell *cell = (DMItemTableViewCell*)[tableView dequeueReusableCellWithIdentifier: SimpleTableIdentifier];
    
    if (cell == nil)
    {
        //cell = [[DMItemTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"DMItemTableViewCell"];
        
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"DMItemTableViewCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
        
    }
    DMSettingItem*temp= (DMSettingItem*)[items objectAtIndex:indexPath.row];
    cell.itemImage.image=[UIImage imageNamed:temp.imageName];
    cell.itemLable.text=temp.lblText;
    if (temp.isDetails) {
        
        //in case of  lable

        [cell.itemDetailsLable  setHidden:NO];
        [cell.itemSwitch  setHidden:YES];

    }else{
        //in switch button
        [cell.itemSwitch  setHidden:NO];
        [cell.itemDetailsLable  setHidden:YES];
        cell.accessoryType=UITableViewCellAccessoryNone;
        
        
        
    }
    
    
    return cell;

}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [_objects removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}

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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
   // NSDate *object = _objects[indexPath.row];
    DMSettingItem *object =  items[indexPath.row];
    if (object.isDetails) {
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
	    if (!self.detailViewController) {
            //self.detailViewController.detailItem=object;
	        self.detailViewController = [[DMDetailViewController alloc] initWithNibName:@"DMDetailViewController_iPhone" bundle:nil];

	    }
        //self.detailViewController.detailDescriptionLabel.text = object.lblText;
	    //self.detailViewController.detailItem = object;
        [self.detailViewController setDetailItem:object];
        [self.navigationController pushViewController:self.detailViewController animated:YES];
    } else {
        self.detailViewController.detailDescriptionLabel.text = object.lblText;
        //self.detailViewController.detailItem = object;
        NSLog(@"%@",self.detailViewController.detailDescriptionLabel.text );
    }
        }
}

@end
