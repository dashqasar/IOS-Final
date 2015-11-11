//
//  IntroLayer.h
//  ComplexGame
//
//  Created by Lion User on 5/27/13.
//  Copyright Lion User 2013. All rights reserved.
//


// When you import this file, you import all the cocos2d classes
#import "cocos2d.h"
#import "CCVideoPlayer.h"

// HelloWorldLayer
@interface IntroLayer : CCLayer<CCVideoPlayerDelegate>
{
}

// returns a CCScene that contains the HelloWorldLayer as the only child
+(CCScene *) scene;

@end
