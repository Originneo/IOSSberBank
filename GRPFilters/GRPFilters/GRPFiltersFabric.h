//
//  GRPFiltersFabric.h
//  GRPFilters
//
//  Created by Константин Богданов on 08/06/2019.
//  Copyright © 2019 Константин Богданов. All rights reserved.
//

#import <Foundation/Foundation.h>


@class GRPFilterModel;


NS_ASSUME_NONNULL_BEGIN

/**
 Фабрика по созданию фильтров
 */
@interface GRPFiltersFabric : NSObject

- (GRPFilterModel *)createSepiaFilter;
- (GRPFilterModel *)createBoxBlurFilter;
- (GRPFilterModel *)createDiscBlurFilter;
- (GRPFilterModel *)createGaussianBlurFilter;
- (GRPFilterModel *)createMedianBlurFilter;
- (GRPFilterModel *)createMotionBlurFilter;
- (GRPFilterModel *)createZoomBlurFilter;

@end

NS_ASSUME_NONNULL_END
