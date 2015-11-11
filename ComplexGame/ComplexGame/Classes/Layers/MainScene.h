//
//  MainScene.h
//  ComplexGame
//
//  Created by Lion User on 5/27/13.
//  Copyright 2013 Lion User. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "CCVideoPlayer.h"

@interface MainScene : CCLayer<CCVideoPlayerDelegate> {
    UIActivityIndicatorView *spinner;
    
    NSMutableArray *mon1_arry;
    NSMutableArray *mon2_arry;
    NSMutableArray *mon3_arry;
    NSMutableArray *mon4_arry;
    NSMutableArray *mon5_arry;
    NSMutableArray *mon6_arry;
    NSMutableArray *mon7_arry;
}

@property (strong, nonatomic) UIActivityIndicatorView *spinner;

+(CCScene *) scene;
- (void)loginFailed;
@end
