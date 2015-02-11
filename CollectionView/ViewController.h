//
//  ViewController.h
//  CollectionView
//
//  Created by Ample-Arch on 24/01/15.
//  Copyright (c) 2015 Ample-Arch. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UPCardsCarousel.h"
#import "MFSideMenu.h"
#import <QuartzCore/QuartzCore.h>


@interface ViewController : UIViewController<UPCardsCarouselDataSource,UPCardsCarouselDelegate,UINavigationBarDelegate,UINavigationControllerDelegate>

@property(strong,nonatomic)NSMutableArray * array;

@property (weak, nonatomic) IBOutlet UINavigationBar *navBar;
- (IBAction)Click:(id)sender;
@property (weak, nonatomic) IBOutlet UINavigationItem *Title_nav;

@end

