//
//  GRPBallView.m
//  TimerProject3454
//
//  Created by Alexey Levanov on 25/05/2019.
//  Copyright © 2019 Alexey Levanov. All rights reserved.
//

#import "GRPBallView.h"


@interface GRPBallView ()

@property (nonatomic, assign) CGFloat ballRadius;
@property (nonatomic, strong) UIColor *ballColor;
@property (nonatomic, assign) NSInteger xCoord;
@property (nonatomic, assign) NSInteger yCoord;

@end


@implementation GRPBallView

- (instancetype)initWithRadius:(CGFloat)radius xCoord:(NSInteger)xCoord yCoord:(NSInteger)ycoord andColor:(UIColor *)color
{
	self = [super initWithFrame:CGRectMake(xCoord, ycoord, radius*2, radius*2)];
	if (self)
	{
		_ballRadius = radius;
		_ballColor = color;
        _xCoord = xCoord;
        _yCoord = ycoord;
	}
	
	return self;
}

- (void)didMoveToSuperview
{
	self.backgroundColor = self.ballColor;
	self.layer.cornerRadius = self.ballRadius;
	self.layer.masksToBounds = YES;
}

@end
