//
//  Game.h
//  Flappy Bird

//  Created by Daval Cato on 5/13/14.
//  Copyright (c) 2014 Daval Cato. All rights reserved.
//

#import <UIKit/UIKit.h>

int BirdFlight;
int RandonTopTunnelPosition;
int RandomBottomTunnelPosition;
int ScoreNumber;
int MonkeyShooterStart;




NSInteger HighScoreNumber;


@interface Game : UIViewController
{
    IBOutlet UIImageView *Bird;
    IBOutlet UIButton *StartGame;
    IBOutlet UIImageView *TunnelTop;
    IBOutlet UIImageView *TunnelBottom;
    IBOutlet UIImageView *Top;
    IBOutlet UIImageView *Bottom;
    IBOutlet UIButton *Exit;
    IBOutlet UILabel *ScoreLabel;
    
    IBOutlet UIImageView *MonkeyBullet;
    IBOutlet UIImageView *MonkeyBullet2;
    IBOutlet UIImageView *MonkeyBullet3;
    
    IBOutlet UILabel *WinOrLose;
    

    
    NSTimer *BirdMovement;
    NSTimer *TunnelMovement;
    
}

-(IBAction)StartGame:(id)sender;
-(void)BirdMoving;
-(void)TunnelMoving;
-(void)PlaceTunnels;
-(void)Score;
-(void)GameOver;



@end
