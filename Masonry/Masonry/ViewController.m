//
//  ViewController.m
//  Masonry
//
//  Created by Анастасия Шахлан on 01/06/2019.
//  Copyright © 2019 ASh. All rights reserved.
//

#import "ViewController.h"
#import "ExampleTableViewCell.h"
#import "Masonry.h"
#import "ExampleView.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic,strong) UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.tableView = [self setupTableView];
//    [self.view addSubview:self.tableView];
//    [self setupConstraints];
    ExampleView *view = [[ExampleView alloc] initWithFrame:CGRectMake(150, 200, 100, 100)];
    view.backgroundColor = UIColor.greenColor;
    [self.view addSubview:view];
    
}

-(UITableView *) setupTableView
{
    UITableView *tableView = [UITableView new];
    tableView.dataSource = self;
    tableView.delegate = self;
    tableView.rowHeight = 100;
    tableView.translatesAutoresizingMaskIntoConstraints = NO;
    return tableView;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellId = @"cellId";
    
    ExampleTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    
    if (!cell)
    {
        cell = [[ExampleTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    
    return cell;
    
}

- (void)setupConstraints
{
//    [self.view addConstraints:@[
//        [NSLayoutConstraint constraintWithItem:self.tableView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0 constant:50],
//        [NSLayoutConstraint constraintWithItem:self.tableView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0],
//        [NSLayoutConstraint constraintWithItem:self.tableView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1.0 constant:0],
//        [NSLayoutConstraint constraintWithItem:self.tableView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0],
//        ]];
    
//    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.view.mas_top).with.offset(100);
//        make.left.equalTo(self.view.mas_left);
//        make.bottom.equalTo(self.view.mas_bottom);
//        make.right.equalTo(self.view.mas_right);
//    }];
    
    [NSLayoutConstraint activateConstraints:@[
        [self.tableView.topAnchor constraintEqualToAnchor:self.view.topAnchor constant:50],
        [self.tableView.leftAnchor constraintEqualToAnchor:self.view.leftAnchor constant:0],
        [self.tableView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor constant:0],
        [self.tableView.rightAnchor constraintEqualToAnchor:self.view.rightAnchor constant:-50],
                                            ]];
}


@end
