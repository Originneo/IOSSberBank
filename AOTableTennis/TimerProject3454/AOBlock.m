//
//  AOBlock.m
//  TimerProject3454
//
//  Created by Камила Валиева on 19/06/2019.
//  Copyright © 2019 Alexey Levanov. All rights reserved.
//

#import "AOBlock.h"
@interface AOBlock ()
@property(nonatomic,strong) UIColor* color;
@property(nonatomic,assign)CGFloat blockHeight;
@property(nonatomic,assign)CGFloat blockWidth;
@property(nonatomic,strong)UIView* blockView;
@property(nonatomic,assign)CGFloat position;
@property (nonatomic, assign) NSInteger oldX;
@property (nonatomic, assign) NSInteger oldY;
@property (nonatomic, assign) BOOL dragging;
@property (nonatomic,strong)UIView* view;
@end
@implementation AOBlock

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
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    UITouch *touch = [touches anyObject];
    CGPoint touchLocation = [touch locationInView:self.superview];
    
//        if ([_blockView pointInside:touchLocation withEvent:nil])
//        {
//
    self.dragging = YES;
    self.oldX = (touchLocation.x - self.frame.origin.x);
//    [[touch view]setCenter:CGPointMake(self.oldX, self.position)];
//        }
}
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    
    UITouch *touch = [[event allTouches] anyObject];
    CGPoint touchLocation = [touch locationInView:self.superview];
    
    if (self.dragging) {
        [self setFrame:CGRectMake(touchLocation.x-self.oldX, CGRectGetMinY(self.frame), self.frame.size.width, self.frame.size.height)];
//        CGRect frame = self.blockView.frame;
//        frame.origin.x = self.blockView.center.x + touchLocation.x;
//        frame.origin.y =  self.blockView.center.y + touchLocation.y - self.oldY;
//        self.blockView.frame = frame;
//        [[touch view]setCenter:CGPointMake(frame.origin.x, self.position)];
//        NSLog(@"%f%f",frame.origin.x,frame.origin.y);
    }
}
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    self.dragging = NO;
}

@end
