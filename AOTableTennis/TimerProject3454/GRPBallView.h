//
//  GRPBallView.h
//  TimerProject3454
//
//  Created by Alexey Levanov on 25/05/2019.
//  Copyright © 2019 Alexey Levanov. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/**
 Класс-представление мяча
 */
@interface GRPBallView : UIView

@property (nonatomic, readonly) UIColor *ballColor;
@property (nonatomic, readonly) CGFloat ballRadius;
@property (nonatomic, readonly) NSInteger xCoord;
@property (nonatomic, readonly) NSInteger yCoord;
/**
 Создает экземпляр класса GRPBallView с нужным радиусом и цветом

 @param radius радиус мяча
 @param color цвет мяча
 @return GRPBallView
 */
- (instancetype)initWithRadius:(CGFloat)radius xCoord:(NSInteger)xCoord yCoord:(NSInteger)ycoord andColor:(UIColor *)color;

@end

NS_ASSUME_NONNULL_END
