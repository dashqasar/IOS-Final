//
//  AppDelegate.h
//  ComplexGame
//
//  Created by Lion User on 5/27/13.
//  Copyright Lion User 2013. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FacebookSDK.framework/Headers/FacebookSDK.h"
#import "MainScene.h"

#import "cocos2d.h"


// Added only for iOS 6 support
@interface MyNavigationController : UINavigationController <CCDirectorDelegate>
@end

@class MainScene;

@interface AppController : NSObject <UIApplicationDelegate>
{
	UIWindow *window_;
	MyNavigationController *navController_;
	
	CCDirectorIOS	*director_;							// weak ref
}

@property (nonatomic, retain) UIWindow *window;
@property (readonly) MyNavigationController *navController;
@property (readonly) CCDirectorIOS *director;

+(AppController *) get;
- (void)openSession;
@end
