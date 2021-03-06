//
//  DisplayProfileTableViewController.m
//  
//
//  Created by TechNetMedia on 14/05/2015.
//
//

#import "DisplayProfileTableViewController.h"
#import "Profile.h"
#import "RemoteService.h"
#import "UpdateProfileViewController.h"
#import "ProfileService.h"

@interface DisplayProfileTableViewController ()

@end

@implementation DisplayProfileTableViewController

RLMResults *profiles;
- (void)viewDidLoad {
    [super viewDidLoad];
    
}

-(void) viewWillAppear:(BOOL)animated
{
    //[self getProfiles];
    [self.tableView reloadData];
}

//-(void) getProfiles
//{
//    RemoteService *service = [[RemoteService alloc] init];
//    [service displayProfile:^(id data) {
//        profiles = data;
//        [self.tableView reloadData];
//    }];
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    profiles =[ProfileService displayProfile];

}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    // Return the number of rows in the section.
    return [ProfileService countProfiles];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    profiles =[ProfileService displayProfile];
    id name = [profiles valueForKey:@"firstName"];
    cell.textLabel.text = [name objectAtIndex:indexPath.row];

    return cell;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"update"])
    {
        NSIndexPath *indexPath = (NSIndexPath *)sender;
        
        UpdateProfileViewController *update = [segue destinationViewController];
        Profile* profileData = [profiles objectAtIndex:indexPath.row];
        NSLog(@"profile=%@",profileData);
        update.profileUp = profileData;
    }
}

-(void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"update" sender:indexPath];
}


// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
return YES;
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        // Delete the row from the data source
        
        Profile* profile = [profiles objectAtIndex:indexPath.row];
        RemoteService *delete = [[RemoteService alloc] init];
        [delete deleteProfile:[[profile valueForKey:@"id"]intValue] completion:^(id data) {
            if (data) {
                
                [ProfileService displayProfile];
                [self.tableView reloadData];
                
            }
        }];
        
        
       
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
