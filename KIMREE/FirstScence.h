//
//  FirstScence.h
// 
//
//  Created by mac on 13-11-26.
//  Copyright (c) 2013年 mac. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
enum
{
    kTagPalyer = 1,
};

@interface FirstScence : SKScene<SKPhysicsContactDelegate>
{
    SKSpriteNode *sprite;

    //敌机材质
    SKTexture* enemyTexture;
    NSMutableArray* enemyArray;
    
    //子弹材质
    SKTexture* bulletTexture;
    NSMutableArray* bulletArray;
    
    //敌机总数
    int NUM_OF_ENEMIES;
    //子弹总数
    int NUM_OF_BULLETS;
    
    CGSize winSize;
    
    //开始射击
    BOOL isTouchToShoot;
    
    CGPoint touchBeginPoint;
    
}
@end
