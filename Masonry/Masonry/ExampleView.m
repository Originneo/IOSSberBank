//
//  ExampleView.m
//  Masonry
//
//  Created by Анастасия Шахлан on 01/06/2019.
//  Copyright © 2019 ASh. All rights reserved.
//

#import "ExampleView.h"

@interface ExampleView()

@property (nonatomic,strong) UIBezierPath *path;

@end

@implementation ExampleView


- (void)drawRect:(CGRect)rect
{
    self.path = [self createTriangle];
    [self.path stroke];
    
    [UIColor.brownColor set];
}

-(UIBezierPath *) createTriangle
{
    UIBezierPath *path = [UIBezierPath new];
    [path moveToPoint:CGPointMake(self.frame.size.width/2.0, 0)];
    [path addLineToPoint:CGPointMake(self.frame.size.width, self.frame.size.height)];
    [path addLineToPoint:CGPointMake(0, self.frame.size.height)];
    [path closePath];
    return path;
}


@end
