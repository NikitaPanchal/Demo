//
//  SideMenuViewController.m
//  MFSideMenuDemo
//
//  Created by Michael Frederick on 3/19/12.

#import "SideMenuViewController.h"
#import "MFSideMenu.h"
#import "ViewController.h"
#import "SectionInfo.h"
#import "cat.h"
#import "Gujju_snacks.h"
#import "GujratiLunch.h"
#import "ViewController.h"
#import "AFNetworking.h"

@interface SideMenuViewController ()

@property (nonatomic, assign) NSInteger openSectionIndex;
@property (nonatomic, strong) NSMutableArray *sectionInfoArray;
@property (nonatomic, strong) NSArray *categoryList;

- (void) setCategoryArray;

@end


@implementation SideMenuViewController
@synthesize imgid,name,image;

@synthesize arraydata;
@synthesize categoryList = _categoryList;
@synthesize openSectionIndex;
@synthesize sectionInfoArray;


#pragma mark -
#pragma mark - UITableViewDataSource
- (void)viewDidLoad {
    [super viewDidLoad];
    imgid = [[NSMutableArray alloc] init];
    name = [[NSMutableArray alloc]init];
    image = [[NSMutableArray alloc]init];
    
  //  arraydata = [[NSMutableArray alloc] initWithObjects:@"Snacks", @"Lunch",@"Dinner",@"Desserts",nil];
//    self.navigationController.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"VegetarianThaliSet.jpg"]];
//    self.tableView.backgroundColor = [UIColor clearColor];

    [self setCategoryArray];
    self.tableView.sectionHeaderHeight = 45;
    self.tableView.sectionFooterHeight = 0;
    self.openSectionIndex = NSNotFound;
    
    self.tableView.backgroundView = [[UIImageView alloc] initWithImage:
                                     [UIImage imageNamed:@"VegetarianThaliSet.png"]];
   

}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    if ((self.sectionInfoArray == nil)|| ([self.sectionInfoArray count] != [self numberOfSectionsInTableView:self.tableView])) {
        NSMutableArray *array = [[NSMutableArray alloc] init];
        
        for (cat *cat in self.categoryList) {
            SectionInfo *section = [[SectionInfo alloc] init];
            section.category = cat;
            section.open = NO;
            
            NSNumber *defaultHeight = [NSNumber numberWithInt:44];
            NSInteger count = [[section.category list] count];
            for (NSInteger i= 0; i<count; i++) {
                [section insertObject:defaultHeight inRowHeightsAtIndex:i];
            }
            
            [array addObject:section];
        }
        self.sectionInfoArray = array;
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [self.categoryList count];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    SectionInfo *array = [self.sectionInfoArray objectAtIndex:section];
    NSInteger rows = [[array.category list] count];
    return (array.open) ? rows : 0;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    
   // static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
   cat *category = (cat *)[self.categoryList objectAtIndex:indexPath.section];
    cell.textLabel.text = [category.list objectAtIndex:indexPath.row];
    return cell;


    }

#pragma mark -gesture
#pragma mark - UITableViewDelegate

-(CGFloat)tableView:(UITableView*)tableView heightForRowAtIndexPath:(NSIndexPath*)indexPath {
    SectionInfo *array = [self.sectionInfoArray objectAtIndex:indexPath.section];
    return [[array objectInRowHeightsAtIndex:indexPath.row] floatValue];
}

- (UIView *) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    SectionInfo *array  = [self.sectionInfoArray objectAtIndex:section];
    if (!array.sectionView)
    {
        NSString *title = array.category.name;
        array.sectionView = [[SectionView alloc] initWithFrame:CGRectMake(0, 0, self.tableView.bounds.size.width, 45) WithTitle:title Section:section delegate:self];
    }
    return array.sectionView;
}
#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==1) {

            if (indexPath.row == 0) {
            ViewController *demoViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"ViewController"];
            demoViewController.title = [NSString stringWithFormat:@"Demo #%ld-%ld", (long)indexPath.section, (long)indexPath.row];
            
            UINavigationController *navigationController = self.menuContainerViewController.centerViewController;
            NSArray *controllers = [NSArray arrayWithObject:demoViewController];
            navigationController.viewControllers = controllers;
            [self.menuContainerViewController setMenuState:MFSideMenuStateClosed];
    }
    }
    
    if (indexPath.section==1) {
        
        if (indexPath.row == 0) {
        
                Gujju_snacks *demoViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"GS"];
            
                demoViewController.title = [NSString stringWithFormat:@"Demo #%ld-%ld", (long)indexPath.section, (long)indexPath.row];
        
            
            AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
            [manager GET:@"http://192.168.1.5:8888/Gujju-snacks/gujjsnack.php" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
                NSLog(@"JSON: %@", responseObject);
                imgid = [[[responseObject objectForKey:@"result"] valueForKey:@"ID"] objectAtIndex:0];
                NSLog(@"%@",imgid);
                name = [[[responseObject objectForKey:@"result"] valueForKey:@"name"] objectAtIndex:0];
                NSLog(@"%@",name);
                image = [[[responseObject objectForKey:@"result"] valueForKey:@"image"] objectAtIndex:0];
                NSLog(@"%@",image);
                demoViewController.imgid1 = imgid;
                demoViewController.name1 = name;
                demoViewController.image1 = image;
                UINavigationController *navigationController = self.menuContainerViewController.centerViewController;
                NSArray *controllers = [NSArray arrayWithObject:demoViewController];
                navigationController.viewControllers = controllers;
                [self.menuContainerViewController setMenuState:MFSideMenuStateClosed];
            } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                NSLog(@"Error: %@", error);
            }];
        }
        
        else if (indexPath.row == 1)
        {
            Gujju_snacks *demoViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"GS"];
           
            demoViewController.title = [NSString stringWithFormat:@"Demo #%ld-%ld", (long)indexPath.section, (long)indexPath.row];
            
            AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
            [manager GET:@"http://localhost:8888/Chinese-snacks/chinasnacks.php" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
                NSLog(@"JSON: %@", responseObject);
                imgid = [[[responseObject objectForKey:@"result"] valueForKey:@"ID"] objectAtIndex:0];
                NSLog(@"%@",imgid);
                name = [[[responseObject objectForKey:@"result"] valueForKey:@"name"] objectAtIndex:0];
                NSLog(@"%@",name);
                image = [[[responseObject objectForKey:@"result"] valueForKey:@"image"] objectAtIndex:0];
                NSLog(@"%@",image);
                demoViewController.imgid1 = imgid;
                demoViewController.name1 = name;
                demoViewController.image1 = image;
                UINavigationController *navigationController = self.menuContainerViewController.centerViewController;
                NSArray *controllers = [NSArray arrayWithObject:demoViewController];
                navigationController.viewControllers = controllers;
                [self.menuContainerViewController setMenuState:MFSideMenuStateClosed];
            } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                NSLog(@"Error: %@", error);
            }];

        }
            }
    
    
    if (indexPath.section==2) {
        if (indexPath.row == 0) {
            
            GujratiLunch *demoViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"GujratiLunch"];
            demoViewController.title = [NSString stringWithFormat:@"Demo #%ld-%ld", (long)indexPath.section, (long)indexPath.row];
            
            UINavigationController *navigationController = self.menuContainerViewController.centerViewController;
            NSArray *controllers = [NSArray arrayWithObject:demoViewController];
            navigationController.viewControllers = controllers;
            [self.menuContainerViewController setMenuState:MFSideMenuStateClosed];
        }
    }
    
}

- (void) sectionClosed : (NSInteger) section{
    /*
     Create an array of the index paths of the rows in the section that was closed, then delete those rows from the table view.
     */
    SectionInfo *sectionInfo = [self.sectionInfoArray objectAtIndex:section];
    
    sectionInfo.open = NO;
    NSInteger countOfRowsToDelete = [self.tableView numberOfRowsInSection:section];
    
    if (countOfRowsToDelete > 0) {
        NSMutableArray *indexPathsToDelete = [[NSMutableArray alloc] init];
        for (NSInteger i = 0; i < countOfRowsToDelete; i++) {
            [indexPathsToDelete addObject:[NSIndexPath indexPathForRow:i inSection:section]];
        }
        [self.tableView deleteRowsAtIndexPaths:indexPathsToDelete withRowAnimation:UITableViewRowAnimationTop];
    }
    self.openSectionIndex = NSNotFound;
}

- (void) sectionOpened : (NSInteger) section
{
    SectionInfo *array = [self.sectionInfoArray objectAtIndex:section];
    
    array.open = YES;
    NSInteger count = [array.category.list count];
    NSMutableArray *indexPathToInsert = [[NSMutableArray alloc] init];
    for (NSInteger i = 0; i<count;i++)
    {
        [indexPathToInsert addObject:[NSIndexPath indexPathForRow:i inSection:section]];
    }
    
    NSMutableArray *indexPathsToDelete = [[NSMutableArray alloc] init];
    NSInteger previousOpenIndex = self.openSectionIndex;
    
    if (previousOpenIndex != NSNotFound)
    {
        SectionInfo *sectionArray = [self.sectionInfoArray objectAtIndex:previousOpenIndex];
        sectionArray.open = NO;
        NSInteger counts = [sectionArray.category.list count];
        [sectionArray.sectionView toggleButtonPressed:FALSE];
        for (NSInteger i = 0; i<counts; i++)
        {
            [indexPathsToDelete addObject:[NSIndexPath indexPathForRow:i inSection:previousOpenIndex]];
        }
    }
    UITableViewRowAnimation insertAnimation;
    UITableViewRowAnimation deleteAnimation;
    if (previousOpenIndex == NSNotFound || section < previousOpenIndex)
    {
        insertAnimation = UITableViewRowAnimationTop;
        deleteAnimation = UITableViewRowAnimationBottom;
    }
    else
    {
        insertAnimation = UITableViewRowAnimationBottom;
        deleteAnimation = UITableViewRowAnimationTop;
    }
    
    //self.tableView.backgroundColor = [UIColor redColor];
    [self.tableView beginUpdates];
    [self.tableView insertRowsAtIndexPaths:indexPathToInsert withRowAnimation:insertAnimation];
    [self.tableView deleteRowsAtIndexPaths:indexPathsToDelete withRowAnimation:deleteAnimation];
    [self.tableView endUpdates];
    self.openSectionIndex = section;
}

- (void) setCategoryArray
{
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"CategoryList" withExtension:@"plist"];
    NSArray *mainArray = [[NSArray alloc] initWithContentsOfURL:url];
    NSMutableArray *categoryArray = [[NSMutableArray alloc] initWithCapacity:[mainArray count]];
    for (NSDictionary *dictionary in mainArray) {
        cat *category = [[cat alloc] init];
        category.name = [dictionary objectForKey:@"name"];
        category.list = [dictionary objectForKey:@"list"];
        [categoryArray addObject:category];
    }
    self.categoryList = categoryArray;
}



@end