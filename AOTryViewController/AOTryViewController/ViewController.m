//
//  ViewController.m
//  AOTryViewController
//
//  Created by Камила Валиева on 30/06/2019.
//  Copyright © 2019 Камила Валиева. All rights reserved.
//

#import "ViewController.h"
#import "FirstViewController.h"
@interface ViewController ()
@property(nonatomic,strong)FirstViewController* vc1;
@end

@implementation ViewController

-(id)init
{
    self = [super init];
    if (self)
    {
        self.view.backgroundColor = UIColor.redColor;
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.vc1 = [[FirstViewController alloc]init];
    UIBarButtonItem* barvc1 = [[UIBarButtonItem alloc]initWithTitle:@"VC1" style:UIBarButtonItemStyleDone target:self action:@selector(switchVC1)];
    [self.navigationItem setLeftBarButtonItem:barvc1 animated:YES];
    
    UIBarButtonItem* barvc2 = [[UIBarButtonItem alloc]initWithTitle:@"VC2" style:UIBarButtonItemStyleDone target:self action:@selector(switchVC2)];
    [self.navigationItem setRightBarButtonItem:barvc2 animated:YES];
    [self.view addSubview:self.vc1.view];
    // Do any additional setup after loading the view.
}
-(void)switchVC1
{
    self.view.frame = CGRectMake(0, 0,[[UIScreen mainScreen]bounds].size.width/2, [[UIScreen mainScreen]bounds].size.height);
    self.vc1.view.frame = CGRectMake([[UIScreen mainScreen]bounds].size.width/2, 0, [[UIScreen mainScreen]bounds].size.width, [[UIScreen mainScreen]bounds].size.height);
}

-(void)switchVC2
{
    self.view.frame = CGRectMake(0, 0,[[UIScreen mainScreen]bounds].size.width, [[UIScreen mainScreen]bounds].size.height/2);
    self.vc1.view.frame = CGRectMake(0, [[UIScreen mainScreen]bounds].size.height/2, [[UIScreen mainScreen]bounds].size.width, [[UIScreen mainScreen]bounds].size.height);
}

@end
