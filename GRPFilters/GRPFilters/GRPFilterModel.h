//
//  GRPFilterModel.h
//  GRPFilters
//
//  Created by Константин Богданов on 08/06/2019.
//  Copyright © 2019 Константин Богданов. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/**
  Модель фильтра.
 */
@interface GRPFilterModel : NSObject

@property (nonatomic, readonly) NSString *name; /**< Имя фильтра */
@property (nonatomic, readonly) NSDictionary<NSString *, id> *parameters; /**< Параметры */

/**
 Инициализирует модель

 @param name - имя фильтра
 @param parameters - параметры
 @return модель фильтра
 */
- (instancetype)initWithName:(NSString *)name parameters:(NSDictionary *)parameters;


/**
 Запрет контструкторов.
 */
- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)new NS_UNAVAILABLE;

@end

NS_ASSUME_NONNULL_END
