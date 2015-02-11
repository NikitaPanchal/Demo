//
//  Gujju_snacks.h
//  CollectionView
//
//  Created by Ample-Arch on 26/01/15.
//  Copyright (c) 2015 Ample-Arch. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Recipe1.h"
#import "SideMenuViewController.h"
@interface Gujju_snacks : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
}
@property(strong,nonatomic)NSMutableArray * arr;
@property (strong,nonatomic)NSMutableArray * imagearray;
@property (strong,nonatomic)NSMutableArray * namearr;
@property (weak, nonatomic) IBOutlet UINavigationBar *navBar;
@property(strong,nonatomic)NSMutableArray * imgid1;
@property(strong,nonatomic)NSMutableArray * name1;
@property(strong,nonatomic)NSMutableArray * image1;
@property (weak, nonatomic) IBOutlet UITableView *tblview;
- (IBAction)Action_back:(id)sender;

@end
