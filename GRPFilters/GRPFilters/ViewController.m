//
//  ViewController.m
//  GRPFilters
//
//  Created by Константин Богданов on 07/06/2019.
//  Copyright © 2019 Константин Богданов. All rights reserved.
//

#import "ViewController.h"
#import "GRPFilterModel.h"
#import "GRPFiltersFabric.h"

@import CoreImage;


@interface ViewController () <UITableViewDelegate, UITableViewDataSource,UINavigationControllerDelegate,UIImagePickerControllerDelegate>

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic,strong) UIImage *imageFromPicker;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIImage *image;
@property (nonatomic, copy) NSArray<GRPFilterModel *> *filters;
@property (nonatomic, strong) GRPFiltersFabric *fabric;
@property (nonatomic, strong) CIContext *context;
@end


@implementation ViewController

- (void)viewDidLoad
{
	[super viewDidLoad];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(rightButtonSaveImage)];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemSearch target:self action:@selector(leftButtonChooseImage)];
	[self setupViews];
	self.tableView.dataSource = self;
	self.tableView.delegate = self;
	[self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    self.imageView.image = [UIImage imageNamed:@"default"];
    self.imageView.contentMode = UIViewContentModeScaleAspectFill;

	self.fabric = [GRPFiltersFabric new];
	self.filters = @[
					 [self.fabric createSepiaFilter],
					 [self.fabric createBoxBlurFilter],
					 [self.fabric createDiscBlurFilter],
					 [self.fabric createMedianBlurFilter],
					 [self.fabric createZoomBlurFilter]
					 ];
	self.context = [CIContext contextWithOptions:nil];
    self.imageFromPicker = [UIImage new];
}

- (void)setupViews
{
	self.tableView = [UITableView new];
	self.imageView = [UIImageView new];
    
    self.navigationItem.rightBarButtonItem.tintColor = UIColor.blueColor;
   
	self.imageView.translatesAutoresizingMaskIntoConstraints = NO;
	self.tableView.translatesAutoresizingMaskIntoConstraints = NO;

	[self.view addSubview:self.imageView];
	[self.view addSubview:self.tableView];
    
    UILayoutGuide * guide = self.view.safeAreaLayoutGuide;
	[self.imageView.topAnchor constraintEqualToAnchor:guide.topAnchor].active = YES;
	[self.imageView.widthAnchor constraintGreaterThanOrEqualToConstant:40].active = YES;
	[self.imageView.heightAnchor constraintEqualToAnchor:self.imageView.widthAnchor].active = YES;
	[self.imageView.leftAnchor constraintEqualToAnchor:self.view.leftAnchor].active = YES;
	[self.imageView.rightAnchor constraintEqualToAnchor:self.view.rightAnchor].active = YES;

	[self.tableView.topAnchor constraintEqualToAnchor:self.imageView.bottomAnchor].active = YES;
	[self.tableView.leftAnchor constraintEqualToAnchor:self.view.leftAnchor].active = YES;
	[self.tableView.rightAnchor constraintEqualToAnchor:self.view.rightAnchor].active = YES;
	[self.tableView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor].active = YES;
}

-(void)rightButtonSaveImage
{
    UIImage* image = [self.imageView image];
    UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil);
    
}

-(void) leftButtonChooseImage
{
    UIImagePickerControllerSourceType type = UIImagePickerControllerSourceTypePhotoLibrary;
    if ([UIImagePickerController isSourceTypeAvailable:type])
    {
        UIImagePickerController *controller = [UIImagePickerController new];
        controller.sourceType = type;
        controller.mediaTypes = [UIImagePickerController availableMediaTypesForSourceType:type];
        [self.navigationController presentViewController:controller animated:YES completion:^{}];
        controller.delegate = self;
    }
}
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    self.imageFromPicker = info[UIImagePickerControllerOriginalImage];
    self.imageView.image = self.imageFromPicker;
}

#pragma mark -UITableViewDataSource

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    if (!cell)
    {
        cell = [UITableViewCell new];
    }

	GRPFilterModel *model = self.filters[indexPath.row];

	cell.textLabel.text = model.name;

	return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return self.filters.count;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
	return @"Фильтры";
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
	GRPFilterModel *filterModel = self.filters[indexPath.row];
	CGImageRef cgImage = self.imageFromPicker.CGImage;
	CGImageRetain(cgImage);
	CIImage *beginImage = [CIImage imageWithCGImage: cgImage];

	// Cоздаем или получаем ссылку на контекст
	CIContext *context = self.context;

	NSMutableDictionary<NSString *, id> *parameters = [filterModel.parameters mutableCopy];
	[parameters setObject:beginImage forKey:kCIInputImageKey];
	CIFilter *filter = [CIFilter filterWithName:filterModel.name withInputParameters:parameters];

	CIImage *outputImage = [filter outputImage];

	// Создаем Bitmap
	CGImageRef cgimg = [context createCGImage:outputImage fromRect:[outputImage extent]];

	// Создаем изображение
	UIImage *newImage = [UIImage imageWithCGImage:cgimg];
	self.imageView.image = newImage;

	// Релизим ImageRef, потому как там старое API, нужно ручками
	CGImageRelease(cgimg);
	CGImageRelease(cgImage);
}

@end
