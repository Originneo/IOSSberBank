//
//  FirstViewController.m
//  AOTryViewController
//
//  Created by Камила Валиева on 30/06/2019.
//  Copyright © 2019 Камила Валиева. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

-(id)init
{
    self = [super init];
    if (self)
    {
        self.view.backgroundColor = UIColor.blueColor;
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
