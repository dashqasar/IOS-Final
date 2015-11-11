//
//  MainScene.m
//  ComplexGame
//
//  Created by Lion User on 5/27/13.
//  Copyright 2013 Lion User. All rights reserved.
//

#import "MainScene.h"
#import "Globals.h"
#import "RegisterView.h"
#import "LoginView.h"
#import "AppDelegate.h"
#import "Globals.h"


@implementation MainScene

@synthesize spinner;

+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	MainScene *layer = [MainScene node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

-(id) init
{
	if( (self=[super init])) {
        
        mon1_arry = [[NSMutableArray alloc] init];
        for (int i = 1; i <= 180; i++) {
            NSString *filename;
            if (i < 10)
                filename = [NSString stringWithFormat:res(@"monster1000%d.png"), i];
            else if (i>=10 && i<100)
                filename = [NSString stringWithFormat:res(@"monster100%d.png"), i];
            else
                filename = [NSString stringWithFormat:res(@"monster10%d.png"), i];
            CCSprite *sprite = [CCSprite spriteWithFile:filename];
            
           CCSpriteFrame *frame = [CCSpriteFrame frameWithTextureFilename:filename rect:CGRectMake(0, 0, sprite.contentSize.width, sprite.contentSize.height)];
            
            [mon1_arry addObject:frame];
        }
        
        mon2_arry = [[NSMutableArray alloc] init];
        for (int i = 1; i <= 95; i++) {
            
            NSString *filename;
            if (i < 10)
                filename = [NSString stringWithFormat:res(@"monster2000%d.png"), i];
            else
                filename = [NSString stringWithFormat:res(@"monster200%d.png"), i];
            CCSprite *sprite = [CCSprite spriteWithFile:filename];
            
            CCSpriteFrame *frame = [CCSpriteFrame frameWithTextureFilename:filename rect:CGRectMake(0, 0, sprite.contentSize.width, sprite.contentSize.height)];
            
            [mon2_arry addObject:frame];
        }
        
        mon3_arry = [[NSMutableArray alloc] init];
        for (int i = 1; i <= 130; i++) {
            
            NSString *filename;
            if (i < 10)
                filename = [NSString stringWithFormat:res(@"monster3000%d.png"), i];
            else if (i>=10 && i<100)
                filename = [NSString stringWithFormat:res(@"monster300%d.png"), i];
            else
                filename = [NSString stringWithFormat:res(@"monster30%d.png"), i];
            CCSprite *sprite = [CCSprite spriteWithFile:filename];
            
            CCSpriteFrame *frame = [CCSpriteFrame frameWithTextureFilename:filename rect:CGRectMake(0, 0, sprite.contentSize.width, sprite.contentSize.height)];
            
            [mon3_arry addObject:frame];
        }
        
        mon4_arry = [[NSMutableArray alloc] init];
        for (int i = 1; i <= 194; i++) {
            
            NSString *filename;
            if (i < 10)
                filename = [NSString stringWithFormat:res(@"monster4000%d.png"), i];
            else if (i>=10 && i<100)
                filename = [NSString stringWithFormat:res(@"monster400%d.png"), i];
            else
                filename = [NSString stringWithFormat:res(@"monster40%d.png"), i];
            CCSprite *sprite = [CCSprite spriteWithFile:filename];
            
            CCSpriteFrame *frame = [CCSpriteFrame frameWithTextureFilename:filename rect:CGRectMake(0, 0, sprite.contentSize.width, sprite.contentSize.height)];
            
            [mon4_arry addObject:frame];
        }
        
        mon5_arry = [[NSMutableArray alloc] init];
        for (int i = 1; i <= 89; i++) {
            
            NSString *filename;
            if (i < 10)
                filename = [NSString stringWithFormat:res(@"monster5000%d.png"), i];
            else
                filename = [NSString stringWithFormat:res(@"monster500%d.png"), i];
            CCSprite *sprite = [CCSprite spriteWithFile:filename];
            
            CCSpriteFrame *frame = [CCSpriteFrame frameWithTextureFilename:filename rect:CGRectMake(0, 0, sprite.contentSize.width, sprite.contentSize.height)];
            
            [mon5_arry addObject:frame];
        }
        mon6_arry = [[NSMutableArray alloc] init];
        for (int i = 1; i <= 114; i++) {
            
            NSString *filename;
            if (i < 10)
                filename = [NSString stringWithFormat:res(@"monster6000%d.png"), i];
            else if (i>=10 && i<100)
                filename = [NSString stringWithFormat:res(@"monster600%d.png"), i];
            else
                filename = [NSString stringWithFormat:res(@"monster60%d.png"), i];
            CCSprite *sprite = [CCSprite spriteWithFile:filename];
            
            CCSpriteFrame *frame = [CCSpriteFrame frameWithTextureFilename:filename rect:CGRectMake(0, 0, sprite.contentSize.width, sprite.contentSize.height)];
            
            [mon6_arry addObject:frame];
        }
        
        mon7_arry = [[NSMutableArray alloc] init];
        for (int i = 1; i <= 145; i++) {
            
            NSString *filename;
            if (i < 10)
                filename = [NSString stringWithFormat:res(@"monster7000%d.png"), i];
            else if (i>=10 && i<100)
                filename = [NSString stringWithFormat:res(@"monster700%d.png"), i];
            else
                filename = [NSString stringWithFormat:res(@"monster70%d.png"), i];
            CCSprite *sprite = [CCSprite spriteWithFile:filename];
            
            CCSpriteFrame *frame = [CCSpriteFrame frameWithTextureFilename:filename rect:CGRectMake(0, 0, sprite.contentSize.width, sprite.contentSize.height)];
            
            [mon7_arry addObject:frame];
        }
        
        CGSize size = [[CCDirector sharedDirector] winSize];
        
        spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
        [spinner setFrame:CGRectMake(SCREEN_WIDTH / 2 - 46 / 2 * SCALE_WIDTH,
                                            SCREEN_HEIGHT / 2 - 46 / 2 * SCALE_HEIGHT,
                                            46 * SCALE_WIDTH, 46 * SCALE_HEIGHT)];
        
        AppController *del = [AppController get];
        [del.navController.view addSubview:spinner];
        [spinner release];
        
		// ask director for the window size
		
        
		CCSprite *background;
        background = [CCSprite spriteWithFile:res1(@"back.png")];
        background.position = ccp(size.width/2, size.height/2);        
        [self addChild: background z:0];
        
        CCSprite *mon1 = [CCSprite spriteWithFile:@"monster10001.png"];
        mon1.position = ccp(51 * SCALE_WIDTH, (320-190) * SCALE_HEIGHT);
        [self addChild: mon1 z:2];
        CCAnimation * mon1Anim = [CCAnimation animationWithSpriteFrames:mon1_arry delay:0.04f];
        CCAction *mon1Action = [CCRepeatForever actionWithAction:[CCAnimate actionWithAnimation:mon1Anim]];
        [mon1 runAction:mon1Action];
        
        CCSprite *mon2 = [CCSprite spriteWithFile:@"monster20001.png"];
        mon2.position = ccp(108 * SCALE_WIDTH, (320-258) * SCALE_HEIGHT);
        [self addChild: mon2 z:1];
        CCAnimation * mon2Anim = [CCAnimation animationWithSpriteFrames:mon2_arry delay:0.04f];
        CCAction *mon2Action = [CCRepeatForever actionWithAction:[CCAnimate actionWithAnimation:mon2Anim]];
        [mon2 runAction:mon2Action];
        
        CCSprite *mon3 = [CCSprite spriteWithFile:@"monster30001.png"];
        mon3.position = ccp(146 * SCALE_WIDTH, (320-257) * SCALE_HEIGHT);
        [self addChild: mon3 z:1];
        CCAnimation * mon3Anim = [CCAnimation animationWithSpriteFrames:mon3_arry delay:0.04f];
        CCAction *mon3Action = [CCRepeatForever actionWithAction:[CCAnimate actionWithAnimation:mon3Anim]];
        [mon3 runAction:mon3Action];
        
        CCSprite *milestone = [CCSprite spriteWithFile:@"pan.png"];
        milestone.position = ccp(236 * SCALE_WIDTH, (320-232) * SCALE_HEIGHT);
        [self addChild: milestone z:1];
        
        CCSprite *mon5 = [CCSprite spriteWithFile:@"monster50001.png"];
        mon5.position = ccp(355 * SCALE_WIDTH, (320-250) * SCALE_HEIGHT);
        [self addChild: mon5 z:1];
        CCAnimation * mon5Anim = [CCAnimation animationWithSpriteFrames:mon5_arry delay:0.04f];
        CCAction *mon5Action = [CCRepeatForever actionWithAction:[CCAnimate actionWithAnimation:mon5Anim]];
        [mon5 runAction:mon5Action];
        
        CCSprite *mon4 = [CCSprite spriteWithFile:@"monster40001.png"];
        mon4.position = ccp(303 * SCALE_WIDTH, (320-274) * SCALE_HEIGHT);
        [self addChild: mon4 z:1];
        CCAnimation * mon4Anim = [CCAnimation animationWithSpriteFrames:mon4_arry delay:0.04f];
        CCAction *mon4Action = [CCRepeatForever actionWithAction:[CCAnimate actionWithAnimation:mon4Anim]];
        [mon4 runAction:mon4Action];
        
        CCSprite *mon6 = [CCSprite spriteWithFile:@"monster60001.png"];
        mon6.position = ccp(396 * SCALE_WIDTH, (320-278) * SCALE_HEIGHT);
        [self addChild: mon6 z:1];
        CCAnimation * mon6Anim = [CCAnimation animationWithSpriteFrames:mon6_arry delay:0.04f];
        CCAction *mon6Action = [CCRepeatForever actionWithAction:[CCAnimate actionWithAnimation:mon6Anim]];
        [mon6 runAction:mon6Action];
        
        CCSprite *mon7 = [CCSprite spriteWithFile:@"monster70001.png"];
        mon7.position = ccp(432 * SCALE_WIDTH, (320-251) * SCALE_HEIGHT);
        [self addChild: mon7 z:1];
        CCAnimation * mon7Anim = [CCAnimation animationWithSpriteFrames:mon7_arry delay:0.04f];
        CCAction *mon7Action = [CCRepeatForever actionWithAction:[CCAnimate actionWithAnimation:mon7Anim]];
        [mon7 runAction:mon7Action];
        
        CCSprite *post = [CCSprite spriteWithFile:@"post.png"];
        post.position = ccp(418 * SCALE_WIDTH, (320-227) * SCALE_HEIGHT);
        [self addChild: post z:1];
        
        
        
//        CCMenuItemImage *registerItem = [CCMenuItemImage itemWithNormalImage:res(@"register1.png") selectedImage:res(@"register2.png") target:self selector:@selector(procRegister:)];
//        registerItem.position = ccp(50 * SCALE_WIDTH, (320-110) * SCALE_HEIGHT);
//        //registerItem.scale = 2.0f;
//        
//        CCMenuItemImage *loginItem = [CCMenuItemImage itemWithNormalImage:res(@"login1.png") selectedImage:res(@"login2.png") target:self selector:@selector(procLogin:)];
//        loginItem.position = ccp(50 * SCALE_WIDTH, (320-150) * SCALE_HEIGHT);
//        //loginItem.scale = 2.0f;
//        
//        
        CCMenuItemImage *facebookloginItem = [CCMenuItemImage itemWithNormalImage:res(@"fbconnect1.png") selectedImage:res(@"fbconnect2.png") target:self selector:@selector(loginFacebook:)];
        facebookloginItem.position = ccp(238 * SCALE_WIDTH, (320 - 220) * SCALE_HEIGHT);

        CCMenuItemImage *playItem = [CCMenuItemImage itemWithNormalImage:res(@"play1.png") selectedImage:res(@"play2.png") target:self selector:@selector(startPlay:)];
        playItem.position = ccp(238 * SCALE_WIDTH, (320 - 190) * SCALE_HEIGHT);
        playItem.scale = 0.8f;

        CCMenu *menu = [CCMenu menuWithItems:facebookloginItem, playItem, nil];
        menu.position = ccp(0, 0);
        [self addChild:menu z:1];
        
        
		// add the label as a child to this Layer
		[CCVideoPlayer setDelegate:self];
	}
	
	return self;
}

-(void) procRegister: (id)sender {
    
//    [CCVideoPlayer playMovieWithFile:@"planet clip.mp4"];
    
    RegisterView *registerView;
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        registerView = [[RegisterView alloc] initWithNibName:@"RegisterView-ipad" bundle:nil];
    }
    else
    {
        registerView = [[RegisterView alloc] initWithNibName:@"RegisterView" bundle:nil];
    }
    
    AppController *del = [AppController get];
    [del.navController presentModalViewController:registerView animated:YES];
    
}

-(void) procLogin: (id)sender {
    
    LoginView *lginView;
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        lginView = [[LoginView alloc] initWithNibName:@"LoginView-ipad" bundle:nil];
    }
    else
    {
        lginView = [[LoginView alloc] initWithNibName:@"LoginView" bundle:nil];
    }
    
    AppController *del = [AppController get];
    [del.navController presentModalViewController:lginView animated:YES];
    
}

-(void) loginFacebook: (id)sender {
    
    
    
//    [spinner startAnimating];
    
    AppController* appDelegate = [UIApplication sharedApplication].delegate;
    [appDelegate openSession];
}

- (void)loginFailed
{
    // User switched back to the app without authorizing. Stay here, but
    // stop the spinner.
    [spinner stopAnimating];
}

-(void) startPlay: (id)sender {
//    if ([g_username compare:@""] == 0)
//    {
//        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Warning" message:@"Please login now before play." delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
//        [alert show];
//        [alert release];
//    }
}

-(CCLabelTTF*)createShadowHeaderWithString:(NSString*)string position:(CGPoint)pos shadowOffset:(CGSize)offset color:(ccColor3B)col shadowColor:(ccColor3B)shadowCol fontSize:(float)fontSize {
    float offsetX = offset.width;
    float offsetY = offset.height;
    
    //Shadow
    CCLabelTTF *shadow = [CCLabelTTF labelWithString:string fontName:@"Noteworthy-Bold" fontSize:fontSize * SCREEN_HEIGHT];
    
    shadow.anchorPoint = ccp(0.5, 0.5);
    shadow.position = ccp(pos.x + offsetX, pos.y + offsetY);
    shadow.color = shadowCol;
    shadow.opacity = (255/100*83);//83%
    
    //Actual
    CCLabelTTF *label = [CCLabelTTF labelWithString:string fontName:@"Noteworthy-Bold" fontSize:fontSize];
    label.position = ccp(shadow.contentSize.width / 2 - offsetX, shadow.contentSize.height / 2 - offsetY);
    label.color = col;
    [shadow addChild:label];
    
    return shadow;
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
