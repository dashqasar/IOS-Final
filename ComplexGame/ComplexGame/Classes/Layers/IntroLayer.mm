//
//  IntroLayer.m
//  ComplexGame
//
//  Created by Lion User on 5/27/13.
//  Copyright Lion User 2013. All rights reserved.
//


// Import the interfaces
#import "IntroLayer.h"
#import "MainScene.h"
#import "Globals.h"


#pragma mark - IntroLayer

// HelloWorldLayer implementation
@implementation IntroLayer

// Helper class method that creates a Scene with the HelloWorldLayer as the only child.
+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	IntroLayer *layer = [IntroLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
    
    [CCVideoPlayer setDelegate:self];
	
	// return the scene
	return scene;
}

//
-(id) init
{
	if( (self=[super init])) {
        
		// ask director for the window size
		CGSize size = [[CCDirector sharedDirector] winSize];
        
		CCSprite *background;
		
        background = [CCSprite spriteWithFile:res1(@"back.png")];
        background.position = ccp(size.width/2, size.height/2);
        
		// add the label as a child to this Layer
//        [self addChild: background];
        
        [CCVideoPlayer setDelegate:self];
        
        [CCVideoPlayer playMovieWithFile:@"planet clip.mp4"];
        
	}
    
	
	return self;
}

-(void) onEnter
{
	[super onEnter];
	[[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:[MainScene scene] ]];
}

- (void) moviePlaybackFinished
{
    [[CCDirector sharedDirector] startAnimation];
}

- (void) movieStartsPlaying
{
    [[CCDirector sharedDirector] stopAnimation];
}
@end
