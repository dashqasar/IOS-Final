//
//  Globals.h
//  TappingMad
//
//  Created by STAR 2/15/2013.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "cocos2d.h"
#import <Foundation/Foundation.h>

#ifndef __Globals_H_
#define __Globals_H_

#define SCREEN_WIDTH    [[UIScreen mainScreen] bounds].size.height
#define SCREEN_HEIGHT    [[UIScreen mainScreen] bounds].size.width

#define SCALE_WIDTH     (SCREEN_WIDTH/480)
#define SCALE_HEIGHT    (SCREEN_HEIGHT/320)

extern NSString *g_username;

static inline NSString *res(NSString * data)
{
	if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
	{
        return [data stringByReplacingOccurrencesOfString:@"." withString:@"-ipad."];
	}
	else
	{
        if( CC_CONTENT_SCALE_FACTOR() == 2 )
            return [data stringByReplacingOccurrencesOfString:@"." withString:@"-hd."];
        else
            return data;
	}
}

static inline NSString *res1(NSString * data)
{
	if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
	{
        return [data stringByReplacingOccurrencesOfString:@"." withString:@"-ipad."];
	}
	else
	{
        if( CC_CONTENT_SCALE_FACTOR() == 2 ) {
            if (SCREEN_HEIGHT == 568 || SCREEN_WIDTH == 568)
                return [data stringByReplacingOccurrencesOfString:@"." withString:@"-568h@2x."];
        
            return [data stringByReplacingOccurrencesOfString:@"." withString:@"-hd."];
        }
        else
            return data;
	}
}



#endif