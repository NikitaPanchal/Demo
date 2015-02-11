//
//  Recipe1.m
//  CollectionView
//
//  Created by Ample-Arch on 28/01/15.
//  Copyright (c) 2015 Ample-Arch. All rights reserved.
//

#import "Recipe1.h"

@interface Recipe1 ()

@end

@implementation Recipe1
@synthesize imgview;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    imgview.image = [UIImage imageNamed:@"image21.jpg"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    [self.navigationController popViewControllerAnimated:YES];
    
}
@end
