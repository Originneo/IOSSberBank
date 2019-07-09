//
//  GRPFiltersFabric.m
//  GRPFilters
//
//  Created by Константин Богданов on 08/06/2019.
//  Copyright © 2019 Константин Богданов. All rights reserved.
//

#import "GRPFiltersFabric.h"
#import "GRPFilterModel.h"


@implementation GRPFiltersFabric

- (GRPFilterModel *)createSepiaFilter
{
	return [[GRPFilterModel alloc] initWithName:@"CISepiaTone" parameters:@{
																			@"inputIntensity": @0.8
																			}];
}

- (GRPFilterModel *)createBoxBlurFilter
{
	return [[GRPFilterModel alloc] initWithName:@"CIBoxBlur" parameters:@{}];
}

- (GRPFilterModel *)createDiscBlurFilter
{
	return [[GRPFilterModel alloc] initWithName:@"CIDiscBlur" parameters:@{}];
}

- (GRPFilterModel *)createGaussianBlurFilter
{
	return [[GRPFilterModel alloc] initWithName:@"CIGaussianBlur" parameters:@{}];
}

- (GRPFilterModel *)createMedianBlurFilter
{
	return [[GRPFilterModel alloc] initWithName:@"CIMedianFilter" parameters:@{}];
}

- (GRPFilterModel *)createMotionBlurFilter
{
	return [[GRPFilterModel alloc] initWithName:@"CIMotionBlur" parameters:@{}];
}

- (GRPFilterModel *)createZoomBlurFilter
{
	return [[GRPFilterModel alloc] initWithName:@"CIZoomBlur" parameters:@{}];
}

@end
