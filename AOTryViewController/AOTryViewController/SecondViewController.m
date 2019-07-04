//
//  SecondViewController.m
//  AOTryViewController
//
//  Created by Камила Валиева on 04/07/2019.
//  Copyright © 2019 Камила Валиева. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController
-(id)init
{
    self = [super init];
    if (self)
    {
        self.view.backgroundColor = UIColor.redColor;
        [self.view setTranslatesAutoresizingMaskIntoConstraints:NO];
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
