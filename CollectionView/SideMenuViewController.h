//
//  SideMenuViewController.h
//  MFSideMenuDemoStoryboard
//
//  Created by Michael Frederick on 5/7/13.
//  Copyright (c) 2013 Michael Frederick. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SectionView.h"
@interface SideMenuViewController : UITableViewController<SectionView>

@property(strong,nonatomic)NSMutableArray * arraydata;
@property(strong,nonatomic)NSMutableArray * imgid;
@property(strong,nonatomic)NSMutableArray * name;
@property(strong,nonatomic)NSMutableArray * image;
@end
