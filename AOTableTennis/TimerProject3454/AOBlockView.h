//
//  AOBlock.h
//  TimerProject3454
//
//  Created by Камила Валиева on 19/06/2019.
//  Copyright © 2019 Alexey Levanov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface AOBlockView : UIView
@property(nonatomic,readonly) UIColor* color;
@property(nonatomic,readonly)CGFloat blockHeight;
@property(nonatomic,readonly)CGFloat blockWidth;
@property(nonatomic,readonly)CGFloat position;

-(instancetype)initWithHeight:(CGFloat)blockHeight  width:(CGFloat)blockWidth position:(CGFloat)position color:(UIColor*)color;

@end

NS_ASSUME_NONNULL_END
