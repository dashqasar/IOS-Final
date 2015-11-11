//
//  LoginView.h
//  ComplexGame
//
//  Created by Lion User on 5/28/13.
//  Copyright (c) 2013 Lion User. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginView : UIViewController<UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UITextField *usernameField;

- (IBAction)loginUser:(id)sender;
@end
