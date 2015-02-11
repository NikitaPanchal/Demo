//
//  ViewController.m
//  CollectionView
//
//  Created by Ample-Arch on 24/01/15.
//  Copyright (c) 2015 Ample-Arch. All rights reserved.
//

#import "ViewController.h"
#import "MFSideMenu.h"
#import "AppDelegate.h"
#import "AFNetworking.h"
const static int kCardsCount = 20;
@interface ViewController ()
//@property (strong, nonatomic) CCKFNavDrawer *rootNav;
@end

@implementation ViewController
@synthesize array,navBar,Title_nav;
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:YES];
    

    // Do any additional setup after loading the view, typically from a nib.
    AppDelegate * applet = [UIApplication sharedApplication].delegate ;
    applet.container.panMode = MFSideMenuPanModeNone;
    
     array = [[NSMutableArray alloc] initWithObjects:@"image1.jpg",@"image2.jpg",@"image3.jpg",@"image4.jpg",@"image5.jpg",@"image6.jpg" ,@"image7.jpg",@"image8.jpg",@"image9.jpg",@"image10.jpg",@"image11.jpg",@"image12.jpg",@"image13.jpg",@"image14.jpg",@"image15.jpg",@"image16.jpg",@"image17.jpg",@"image18.jpg",@"image19.jpg",@"image20.jpg",nil];
    UPCardsCarousel *carousel = [[UPCardsCarousel alloc] initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, self.view.frame.size.height-20)];
    [carousel setAutoresizingMask:UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth];
    [carousel.labelBanner setBackgroundColor:[UIColor colorWithRed:112./255. green:47./255. blue:168./255. alpha:1.]];
    [carousel setLabelFont:[UIFont boldSystemFontOfSize:17.0f]];
    [carousel setLabelTextColor:[UIColor whiteColor]];
    [carousel setDelegate:self];
    [carousel setDataSource:self];
    [self.view addSubview:carousel];
    [self.view addSubview:navBar];

}


    
  
- (NSUInteger)numberOfCardsInCarousel:(UPCardsCarousel *)carousel
{
    return kCardsCount;
}

- (UIView*)carousel:(UPCardsCarousel *)carousel viewForCardAtIndex:(NSUInteger)index
{
   // UIImageView * img = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
 
 

    
    NSString *label = [NSString stringWithFormat:@"%i", (int)index];
    return [self createCardViewWithLabel:label index:index];


}

- (NSString*)carousel:(UPCardsCarousel *)carousel labelForCardAtIndex:(NSUInteger)index
{
    return [NSString stringWithFormat:@"Card %i", (int)index];
}


#pragma mark - CardsCarouselDelegate Methods

- (void)carousel:(UPCardsCarousel *)carousel didTouchCardAtIndex:(NSUInteger)index
{
    NSString *message = [NSString stringWithFormat:@"Card %i touched", (int)index];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:message
                                                    message:nil
                                                   delegate:nil
                                          cancelButtonTitle:@"Ok"
                                          otherButtonTitles:nil];
    [alert show];
}


#pragma mark - Helpers

- (UIView*)createCardViewWithLabel:(NSString*)label index:(NSUInteger)index
{
    UIView *cardView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 240, 240)];
    [cardView setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:[array objectAtIndex:index ]]]];
   
    
    [cardView.layer setShadowColor:[UIColor blackColor].CGColor];
    [cardView.layer setShadowOpacity:.5];
    [cardView.layer setShadowOffset:CGSizeMake(0, 0)];
    [cardView.layer setBorderColor:[UIColor whiteColor].CGColor];
    [cardView.layer setBorderWidth:10.];
    [cardView.layer setCornerRadius:4.];
    return cardView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)Click:(id)sender {
    
    [self.menuContainerViewController toggleLeftSideMenuCompletion:nil];

}
@end
