//
//  Game.m
//  Flappy Bird
//
//  Created by Daval Cato on 5/13/14.
//  Copyright (c) 2014 Daval Cato. All rights reserved.
//

#import "Game.h"

@interface Game ()

@end

@implementation Game

-(void)GameOver {
    
    if (ScoreNumber > HighScoreNumber) {
        [[NSUserDefaults standardUserDefaults] setInteger:ScoreNumber forKey:@"HighScoreSaved"];
    }
    
    
    [TunnelMovement invalidate];
    [BirdMovement invalidate];
    
    Exit.hidden = NO;
    TunnelTop.hidden = YES;
    TunnelBottom.hidden = YES;
    Bird.hidden = YES;
    
    WinOrLose.hidden = NO;
    WinOrLose.text = [NSString stringWithFormat:@"You Lose!"];
    MonkeyBullet.hidden = YES;
    MonkeyBullet2.hidden = YES;
    MonkeyBullet3.hidden = YES;
    
    
}

-(void)Score {
    
    ScoreNumber = ScoreNumber + 1;
    ScoreLabel.text = [NSString stringWithFormat:@"%i", ScoreNumber];
    
    
}

-(IBAction)StartGame:(id)sender {
    
    TunnelTop.hidden = NO;
    TunnelBottom.hidden = NO;
    
    StartGame.hidden = YES;
    
    BirdMovement = [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(BirdMoving) userInfo:nil repeats:YES];
    
    [self PlaceTunnels];
    
    TunnelMovement = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(TunnelMoving) userInfo:nil repeats:YES];
    
    
    MonkeyBullet.hidden = NO;
    MonkeyBullet2.hidden = NO;
    MonkeyBullet3.hidden = NO;
    
    
    MonkeyShooterStart = arc4random() %315;
    MonkeyBullet.center = CGPointMake(MonkeyShooterStart, 0);
    
    MonkeyShooterStart = arc4random() %315;
    MonkeyBullet2.center = CGPointMake(MonkeyShooterStart, -150);
    
    MonkeyShooterStart = arc4random() %315;
    MonkeyBullet3.center = CGPointMake(MonkeyShooterStart, -300);
    
    
    
}



/*
-(void)Movement {
    
    [self Collision];
    
    MonkeyBullet.center = CGPointMake(MonkeyBullet.center.x, MonkeyBullet.center.y + 10);
    MonkeyBullet2.center = CGPointMake(MonkeyBullet2.center.x, MonkeyBullet2.center.y + 10);
    MonkeyBullet3.center = CGPointMake(MonkeyBullet3.center.x, MonkeyBullet3.center.y + 10);
    
    
    if (MonkeyBullet.center.y > 568) {
        MonkeyShooterStart = arc4random() %315;
        MonkeyBullet.center = CGPointMake(MonkeyShooterStart, 0);
    }
    if (MonkeyBullet2.center.y > 568) {
        MonkeyShooterStart = arc4random() %315;
        MonkeyBullet2.center = CGPointMake(MonkeyShooterStart, 0);
    }
    if (MonkeyBullet3.center.y > 568) {
        MonkeyShooterStart = arc4random() %315;
        MonkeyBullet3.center = CGPointMake(MonkeyShooterStart, 0);
    }
    

}
*/


-(void)TunnelMoving {
    
    
    if (CGRectIntersectsRect(MonkeyBullet.frame, Bird.frame)) {
        [self GameOver];
    }
    if (CGRectIntersectsRect(MonkeyBullet2.frame, Bird.frame)) {
        [self GameOver];
    }
    if (CGRectIntersectsRect(MonkeyBullet3.frame, Bird.frame)) {
        [self GameOver];
    }
    
    
    
    TunnelTop.center = CGPointMake(TunnelTop.center.x - 1, TunnelTop.center.y);
    TunnelBottom.center = CGPointMake(TunnelBottom.center.x - 1, TunnelBottom.center.y);
    
    if (TunnelTop.center.x < -47) {
        [self PlaceTunnels];
    }
    
    if (TunnelTop.center.x == 5) {
        [self Score];
    }
    
    if (CGRectIntersectsRect(Bird.frame, TunnelTop.frame)) {
        [self GameOver];
    }
    
    if (CGRectIntersectsRect(Bird.frame, TunnelBottom.frame)) {
        [self GameOver];
    }
    
    if (CGRectIntersectsRect(Bird.frame, Top.frame)) {
        [self GameOver];
    }
    
    if (CGRectIntersectsRect(Bird.frame, Bottom.frame)) {
        [self GameOver];
    }
}


-(void)PlaceTunnels {
    
    RandonTopTunnelPosition = arc4random() %350;
    RandonTopTunnelPosition = RandonTopTunnelPosition - 228;
    RandomBottomTunnelPosition = RandonTopTunnelPosition + 640;
    
    TunnelTop.center = CGPointMake(340, RandonTopTunnelPosition);
    TunnelBottom.center = CGPointMake(340, RandomBottomTunnelPosition);
    
    
}



-(void)BirdMoving {
    
    Bird.center = CGPointMake(Bird.center.x, Bird.center.y - BirdFlight);
    
    BirdFlight = BirdFlight -5;
    
    if (BirdFlight < -15) {
        BirdFlight = -15;
    }
    
    if (BirdFlight > 0) {
        Bird.image = [UIImage imageNamed:@"BirdUp.png"];
    }
    if (BirdFlight < 0) {
        Bird.image = [UIImage imageNamed:@"BirdDown.png"];
    }
    
    MonkeyBullet.center = CGPointMake(MonkeyBullet.center.x, MonkeyBullet.center.y + 10);
    MonkeyBullet2.center = CGPointMake(MonkeyBullet2.center.x, MonkeyBullet2.center.y + 10);
    MonkeyBullet3.center = CGPointMake(MonkeyBullet3.center.x, MonkeyBullet3.center.y + 10);
    
    
    if (MonkeyBullet.center.y > 568) {
        MonkeyShooterStart = arc4random() %315;
        MonkeyBullet.center = CGPointMake(MonkeyShooterStart, 0);
    }
    if (MonkeyBullet2.center.y > 568) {
        MonkeyShooterStart = arc4random() %315;
        MonkeyBullet2.center = CGPointMake(MonkeyShooterStart, 0);
    }
    if (MonkeyBullet3.center.y > 568) {
        MonkeyShooterStart = arc4random() %315;
        MonkeyBullet3.center = CGPointMake(MonkeyShooterStart, 0);
    }
    
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    BirdFlight = 25;
    
}



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    TunnelTop.hidden = YES;
    TunnelBottom.hidden = YES;
    
    Exit.hidden = YES;
    ScoreNumber = 0;
    
    WinOrLose.hidden = YES;
    
    
    MonkeyBullet.hidden = YES;
    MonkeyBullet2.hidden = YES;
    MonkeyBullet3.hidden = YES;
    
    HighScoreNumber = [[NSUserDefaults standardUserDefaults] integerForKey:@"HighScoreSaved"];
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
