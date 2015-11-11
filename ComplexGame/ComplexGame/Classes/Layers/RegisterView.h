//
//  RegisterView.h
//  ComplexGame
//
//  Created by Lion User on 5/28/13.
//  Copyright (c) 2013 Lion User. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RegisterView : UIViewController<UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UITextField *nameField;
@property (strong, nonatomic) IBOutlet UITextField *surnameField;
@property (strong, nonatomic) IBOutlet UITextField *usernameField;
@property (strong, nonatomic) IBOutlet UITextField *emailField;

- (IBAction)registerUser:(id)sender;

@end
