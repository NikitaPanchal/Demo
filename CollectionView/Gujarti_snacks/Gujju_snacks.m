//
//  Gujju_snacks.m
//  CollectionView
//
//  Created by Ample-Arch on 26/01/15.
//  Copyright (c) 2015 Ample-Arch. All rights reserved.
//

#import "Gujju_snacks.h"
#import  "MFSideMenuContainerViewController.h"
#import "MFSideMenu.h"
#import "AFNetworking.h"
#import "SideMenuViewController.h"
@interface Gujju_snacks ()

@end

@implementation Gujju_snacks
@synthesize imagearray,namearr,tblview;

- (void)viewDidLoad {
    [super viewDidLoad];
      imagearray = [[NSMutableArray alloc] initWithObjects:@"image21.jpg",@"image22.jpg",@"image23.jpg",nil];
    namearr = [[NSMutableArray alloc]initWithObjects:@"FarsiPuri", @"Khaman",@"Khandvi",nil];
//    imgid = [[NSMutableArray alloc]init];
//    name = [[NSMutableArray alloc]init];
//    image = [[NSMutableArray alloc]init];
    [_navBar setTintColor:[UIColor colorWithRed:250.0/255.0 green:0.0/255.0 blue:30.0/255.0 alpha:1]];
    [self.view addSubview:_navBar];
    NSLog(@"%@",self.arr);
    //[self makeRestaurantRequests];

    
        //self.modalTransitionStyle=UIModalTransitionStylePartialCurl;
    // Do any additional setup after loading the view.
}
//-(void)makeRestaurantRequests
//{
//    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
//    [manager GET:@"http://192.168.1.5:8888/Gujju-snacks/gujjsnack.php" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        NSLog(@"JSON: %@", responseObject);
//        
//        SM.imgid = [[[responseObject objectForKey:@"result"] valueForKey:@"ID"] objectAtIndex:0];
//        NSLog(@"%@",imgid);
//        SM.name = [[[responseObject objectForKey:@"result"] valueForKey:@"name"] objectAtIndex:0];
//        NSLog(@"%@",name);
//        SM.image = [[[responseObject objectForKey:@"result"] valueForKey:@"image"] objectAtIndex:0];
//        NSLog(@"%@",image);
//          [self.tblview reloadData];
//        
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        NSLog(@"Error: %@", error);
//    }];
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section

{
    
    return [self.imgid1 count];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath

{
    
    static NSString *simpleTableIdentifier = @"SimpleTableItem";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    //  cell.backgroundColor = [UIColor colorWithRed:221.0f/255.0f green:188.0f/255.0f blue:148.0f/255.0f alpha:0.0f];
    
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
        
    }
    
   // cell.accessoryView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"marker2.png"]];
   cell.accessoryType= UITableViewCellAccessoryDisclosureIndicator;
    UIImageView * imageView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 20, 80, 70)];
    NSString *strIMG = [self.image1 objectAtIndex:indexPath.row];
    imageView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:strIMG]]];
    [cell addSubview:imageView];
    UILabel * lblname= [[UILabel alloc] initWithFrame:CGRectMake(140, 30, 100, 30)];
    lblname.text = [self.name1 objectAtIndex:indexPath.row];
    [cell addSubview:lblname];
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    Recipe1 * objr= [self.storyboard instantiateViewControllerWithIdentifier:@"RP1"];
   
    [UIView transitionFromView:self.view
                        toView:objr.view
                      duration:0.6
                       options:UIViewAnimationOptionTransitionCurlUp
                    completion:^(BOOL finished) {

                    }];
     [self.navigationController pushViewController:objr animated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)Action_back:(id)sender {
    
[self.menuContainerViewController toggleLeftSideMenuCompletion:nil];
}
@end
