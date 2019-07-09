//
//  ViewController.m
//  Homework1
//
//   Created by Камила Валиева on 19/06/2019.
//  Copyright © 2019 by Anton Ogurtsov. All rights reserved.
//

#import "ViewController.h"
#import "GRPBallView.h"
#import "AOBlockView.h"

@interface ViewController ()

@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, strong) GRPBallView *ballView;
@property (nonatomic, assign) CGFloat deltaX;
@property (nonatomic, assign) CGFloat deltaY;
@property (nonatomic,strong) AOBlockView *computerBlockView;
@property (nonatomic,strong) AOBlockView *playerBlockView;
@property (nonatomic,strong) UINavigationItem* navItem;
@property (nonatomic,strong) NSString* result;
@property (nonatomic,assign) NSInteger firstPlayerWinner;
@property (nonatomic, assign) NSInteger secondPlayerWinner;
@end


@implementation ViewController

- (void)viewDidLoad
{
	[super viewDidLoad];
	[self setupUI];
	[self setupModel];
	[self setupTimer];
    [self setupNavigationBar];
}


#pragma mark - Setup

-(void)setupNavigationBar
{
    self.firstPlayerWinner = 0;
    self.secondPlayerWinner = 0;
    UINavigationBar* navigationBar = [[UINavigationBar alloc]initWithFrame:CGRectMake(0,30, self.view.frame.size.width, 50)];
    self.navItem = [[UINavigationItem alloc] initWithTitle:self.result];
    [navigationBar setItems:@[self.navItem]];
    navigationBar.backgroundColor = UIColor.blueColor;
    [self.view addSubview:navigationBar];
}

- (void)setupModel
{
    self.deltaX = 0.4;
    self.deltaY = 0.4;
}

- (void)setupUI
{
    self.ballView = [[GRPBallView alloc] initWithRadius:25 xCoord:50 yCoord:150 andColor:UIColor.yellowColor];
	[self.view addSubview:self.ballView];
    
    self.computerBlockView = [[AOBlockView alloc]initWithHeight:25 width:90 position:90 color:[UIColor blueColor]];
    self.playerBlockView = [[AOBlockView alloc]initWithHeight:25 width:90 position:700 color:[UIColor greenColor]];
    [self.view addSubview:self.computerBlockView];
    [self.view addSubview:self.playerBlockView];
    
    [self.playerBlockView setUserInteractionEnabled:YES];

}

-(void)setupPosition
{
    [self setupModel];
    self.ballView.center = CGPointMake([self.ballView xCoord],[self.ballView yCoord]);
}

#pragma mark -TimerSetup


- (void)dealloc
{
    [_timer invalidate];
    _timer = nil;
}

- (void)setupTimer
{
	self.timer = [NSTimer scheduledTimerWithTimeInterval:0.001 target:self selector:@selector(timerTick) userInfo:nil repeats:YES];
	self.timer.tolerance = 0.01;
}


#pragma mark - Logic

- (void)timerTick
{
	[self checkWolrdState];
	self.ballView.center = CGPointMake(self.ballView.center.x + self.deltaX, self.ballView.center.y + self.deltaY);
    self.computerBlockView.center = CGPointMake(self.ballView.center.x+ self.deltaX, self.computerBlockView.center.y);
}

- (void)checkWolrdState
{
    CGFloat rightBallCoordX = self.ballView.center.x + self.ballView.ballRadius;
    
    CGFloat leftBallCoordX = self.ballView.center.x - self.ballView.ballRadius;
    
    CGFloat bottomBallCoordY = self.ballView.center.y + self.ballView.ballRadius;
    
    CGFloat topBallCoordY = self.ballView.center.y - self.ballView.ballRadius;
    
    CGFloat bottomBlockCoordY = self.computerBlockView.center.y + self.computerBlockView.blockHeight/2;
    CGFloat rightBlockCoordX= self.computerBlockView.center.x + self.computerBlockView.blockWidth/2;
    CGFloat leftBlockCoordX= self.computerBlockView.center.x - self.computerBlockView.blockWidth/2;
    
    CGFloat topBlock1CoordY = self.playerBlockView.center.y - self.playerBlockView.blockHeight/2;
    CGFloat rightBlock1CoordX= self.playerBlockView.center.x + self.playerBlockView.blockWidth/2;
    CGFloat leftBlock1CoordX= self.playerBlockView.center.x - self.playerBlockView.blockWidth/2;
  
    
    
    if (rightBallCoordX + self.deltaX >= CGRectGetWidth(self.view.frame))
        
    {
        
        self.deltaX = -self.deltaX;
        
    }
    
    else if (leftBallCoordX + self.deltaX <= 0)
        
    {
        
        self.deltaX = -self.deltaX;
        
    }
    else if (bottomBallCoordY + self.deltaY >= CGRectGetHeight(self.view.frame))
        
    {
        
        self.secondPlayerWinner++;
        NSString *newResult = [NSString stringWithFormat:@"%li - %li", self.firstPlayerWinner, self.secondPlayerWinner];
        self.navItem.title = newResult;
        [self setupPosition];
       
        
    }
    else if (topBallCoordY + self.deltaY <= 0)
        
    {
        self.firstPlayerWinner++;
        NSString *newResult = [NSString stringWithFormat:@"%li - %li", self.firstPlayerWinner, self.secondPlayerWinner];
        self.navItem.title = newResult;
        [self setupPosition];
        
    }
    
    else if((topBallCoordY+self.deltaY <= bottomBlockCoordY && topBallCoordY+self.deltaY >self.computerBlockView.center.y) && self.ballView.center.x>= leftBlockCoordX && self.ballView.center.x<=rightBlockCoordX)
    {
        self.deltaY = -self.deltaY;
    }
    
    
    else if((bottomBallCoordY+self.deltaY >= topBlock1CoordY && bottomBallCoordY<= topBlock1CoordY) && self.ballView.center.x<= rightBlock1CoordX && self.ballView.center.x>=leftBlock1CoordX)
    {
        self.deltaY = -self.deltaY;
    }
    
    
}
@end


