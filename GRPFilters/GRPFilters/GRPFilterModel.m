//
//  GRPFilterModel.m
//  GRPFilters
//
//  Created by Константин Богданов on 08/06/2019.
//  Copyright © 2019 Константин Богданов. All rights reserved.
//

#import "GRPFilterModel.h"

@interface GRPFilterModel()

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSDictionary<NSString *, id> *parameters;

@end

@implementation GRPFilterModel

- (instancetype)initWithName:(NSString *)name parameters:(NSDictionary *)parameters
{
	self = [super init];
	if (self)
	{
		_name = [name copy];
		_parameters = [parameters copy];
	}
	return self;
}

@end
