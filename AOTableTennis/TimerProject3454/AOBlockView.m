//
//  AOBlock.m
//  TimerProject3454
//
//  Created by Камила Валиева on 19/06/2019.
//  Copyright © 2019 Alexey Levanov. All rights reserved.
//

#import "AOBlockView.h"

@interface AOBlockView ()

@property(nonatomic,strong) UIColor* color;
@property(nonatomic,assign)CGFloat blockHeight;
@property(nonatomic,assign)CGFloat blockWidth;
@property(nonatomic,strong)UIView* blockView;
@property(nonatomic,assign)CGFloat position;
@property (nonatomic, assign) NSInteger oldX;
@property (nonatomic, assign) NSInteger oldY;
@property (nonatomic, assign) BOOL dragging;

@end

@implementation AOBlockView

-(instancetype)initWithHeight:(CGFloat)blockHeight width:(CGFloat)blockWidth position:(CGFloat)position color:(UIColor *)color
{
    self = [super initWithFrame:CGRectMake(50, position, blockWidth,blockHeight)];
    
    if (self)
    {
        _blockWidth = blockWidth;
        _blockHeight = blockHeight;
        _color = color;
        _position = position;
    }
    return self;
}

-(void)didMoveToSuperview
{
    self.backgroundColor = self.color;
    [self addSubview:self.blockView];
}


#pragma mark -BlockAnimation

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint touchLocation = [touch locationInView:self.superview];
    self.dragging = YES;
    self.oldX = (touchLocation.x - self.frame.origin.x);
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [[event allTouches] anyObject];
    CGPoint touchLocation = [touch locationInView:self.superview];
    if (self.dragging) {
        [self setFrame:CGRectMake(touchLocation.x-self.oldX, CGRectGetMinY(self.frame), self.frame.size.width, self.frame.size.height)];
    }
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    self.dragging = NO;
}

@end
