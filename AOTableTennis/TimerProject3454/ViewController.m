//
//  ViewController.m
//  Homework1
//
//   Created by Камила Валиева on 19/06/2019.
//  Copyright © 2019 by Anton Ogurtsov. All rights reserved.
//

#import "ViewController.h"
#import "GRPBallView.h"
#import "AOBlock.h"

@interface ViewController ()

@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, strong) GRPBallView *ballView;
@property (nonatomic, assign) CGFloat deltaX;
@property (nonatomic, assign) CGFloat deltaY;
@property (nonatomic,strong) AOBlock *blockView;
@property (nonatomic,assign) CGFloat deltaBlockX;
@property (nonatomic,strong) AOBlock *blockView1;
@property (nonatomic,strong)UINavigationItem* navItem;
@property (nonatomic,strong)NSString* result;
@property (nonatomic,assign)NSInteger firstPlayerWinner;
@property (nonatomic, assign)NSInteger secondPlayerWinner;
@end


@implementation ViewController

- (void)dealloc
{
	[_timer invalidate];
	_timer = nil;
}

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
- (void)setupUI
{
    self.ballView = [[GRPBallView alloc] initWithRadius:25 xCoord:50 yCoord:150 andColor:UIColor.yellowColor];
	[self.view addSubview:self.ballView];
    
    self.blockView = [[AOBlock alloc]initWithHeight:25 width:90 position:90 color:[UIColor blueColor]];
   self.blockView1 = [[AOBlock alloc]initWithHeight:25 width:90 position:800 color:[UIColor blueColor]];
    [self.view addSubview:self.blockView];
    [self.view addSubview:self.blockView1];
    
    [self.blockView1 setUserInteractionEnabled:YES];

}

- (void)setupModel
{
	self.deltaX = 0.4;
	self.deltaY = 0.4;
    self.deltaBlockX = 0.5;
}

- (void)setupTimer
{
	self.timer = [NSTimer scheduledTimerWithTimeInterval:0.001 target:self selector:@selector(timerTick) userInfo:nil repeats:YES];
	self.timer.tolerance = 0.01;
}
-(void)setupPosition
{
    [self setupModel];
    self.ballView.center = CGPointMake([self.ballView xCoord],[self.ballView yCoord]);
//    self.blockView.center = CGPointMake([self.ballView xCoord], [self.blockView position]);
}

#pragma mark - Logic

- (void)timerTick
{
	[self checkWolrdState];
    
	self.ballView.center = CGPointMake(self.ballView.center.x + self.deltaX, self.ballView.center.y + self.deltaY);
    
    if(arc4random()%100 >3)
    {
        self.blockView.center = CGPointMake(self.blockView.center.x+ self.deltaBlockX, self.blockView.center.y);
    }
    else
    {
        self.blockView.center = CGPointMake(self.blockView.center.x+self.deltaBlockX+1, self.blockView.center.y);
    }
}

- (void)checkWolrdState
{
    CGFloat rightBallCoordX = self.ballView.center.x + self.ballView.ballRadius;
    
    CGFloat leftBallCoordX = self.ballView.center.x - self.ballView.ballRadius;
    
    CGFloat bottomBallCoordY = self.ballView.center.y + self.ballView.ballRadius;
    
    CGFloat topBallCoordY = self.ballView.center.y - self.ballView.ballRadius;
    
    CGFloat bottomBlockCoordY = self.blockView.center.y + self.blockView.blockHeight/2;
    CGFloat rightBlockCoordX= self.blockView.center.x + self.blockView.blockWidth/2;
    CGFloat leftBlockCoordX= self.blockView.center.x - self.blockView.blockWidth/2;
    
    CGFloat topBlock1CoordY = self.blockView1.center.y - self.blockView1.blockHeight/2;
    CGFloat rightBlock1CoordX= self.blockView1.center.x + self.blockView1.blockWidth/2;
    CGFloat leftBlock1CoordX= self.blockView1.center.x - self.blockView1.blockWidth/2;
    CGFloat centerblock1CoordY = self.blockView1.center.y;
    
    
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
    
    else if((topBallCoordY+self.deltaY <= bottomBlockCoordY) && self.ballView.center.x>= leftBlockCoordX && self.ballView.center.x<=rightBlockCoordX)
    {
        self.deltaY = -self.deltaY;
    }
    
    else if((leftBlockCoordX+self.deltaBlockX<=0) || (rightBlockCoordX+self.deltaBlockX>=CGRectGetWidth(self.view.frame)))
    {
        self.deltaBlockX = -self.deltaBlockX;
    }
    
    else if((bottomBallCoordY+self.deltaY >= topBlock1CoordY && bottomBallCoordY<= topBlock1CoordY) && self.ballView.center.x<= rightBlock1CoordX && self.ballView.center.x>=leftBlock1CoordX)
    {
        self.deltaY = -self.deltaY;
    }
    
    
}


@end




//-(void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
//{
//    UITouch* touch = [touches anyObject];
//    if ([[touch view]tag] != 1)
//    {
//        [UIView animateWithDuration:0.5f animations:^{
//            NSInteger x = arc4random()%200+100;
//            NSInteger y = arc4random()%300+200;
//            [[touch view]setCenter:CGPointMake(x,y)];
//        }];
//    }
//}
//-(void) touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
//{
//    UITouch* touch = [touches anyObject];
//    if ([[touch view]tag] != 1)
//    {
//        [UIView animateWithDuration:0.5f animations:^{
//            NSInteger x = arc4random()%200+100;
//            NSInteger y = arc4random()%300+200;
//            [[touch view]setCenter:CGPointMake(x,y)];
//             NSLog(@"%i,%i", x,y);
//        }];
//
//    }
//}
//-(void) touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
//{
//    UITouch* touch = [touches anyObject];
//    if ([[touch view]tag] != 1)
//    {
//        [UIView animateWithDuration:0.5f animations:^{
//            NSInteger x = arc4random()%200+100;
//            NSInteger y = arc4random()%300+200;
//            [[touch view]setCenter:CGPointMake(x,y)];
//        }];
//    }
//}

