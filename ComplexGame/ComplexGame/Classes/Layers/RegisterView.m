//
//  RegisterView.m
//  ComplexGame
//
//  Created by Lion User on 5/28/13.
//  Copyright (c) 2013 Lion User. All rights reserved.
//

#import "RegisterView.h"

#import "MysqlServer.h"
#import "MysqlConnection.h"
#import "MysqlInsert.h"

@interface RegisterView ()

@end

@implementation RegisterView

@synthesize nameField;
@synthesize surnameField;
@synthesize usernameField;
@synthesize emailField;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    nameField.delegate = self;
    surnameField.delegate = self;
    usernameField.delegate = self;
    emailField.delegate = self;
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (textField == nameField) {
        [textField resignFirstResponder];
        return NO;
    }
    
    if (textField == surnameField)
    {
        [textField resignFirstResponder];
        return NO;
    }
    
    if (textField == usernameField)
    {
        [textField resignFirstResponder];
        return NO;
    }
    
    if (textField == emailField)
    {
        [textField resignFirstResponder];
        return NO;
    }
    return YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)registerUser:(id)sender
{
    NSString *name = nameField.text;
    NSString *surname = surnameField.text;
    NSString *username = usernameField.text;
    NSString *email = emailField.text;
    
    if (name == nil || [name compare:@""] == 0)
    {
        [nameField becomeFirstResponder];
        return;
    }
    
    if (surname == nil || [surname compare:@""] == 0)
    {
        [surnameField becomeFirstResponder];
        return;
    }

    
    if (username == nil || [username compare:@""] == 0)
    {
        [usernameField becomeFirstResponder];
        return;
    }

    
    if (email == nil || [email compare:@""] == 0)
    {
        [emailField becomeFirstResponder];
        return;
    }
    
    MysqlServer *server = [[MysqlServer alloc] init];
    MysqlConnection *conn = [MysqlConnection connectToServer:server];
    if (conn == nil)
    {
        NSLog(@"Database Error!");
        return;
    }
    
    MysqlInsert *insertCommand = [MysqlInsert insertWithConnection:conn];
    insertCommand.table = @"userinfo";
    insertCommand.rowData = [NSDictionary dictionaryWithObjectsAndKeys:name, @"name",
                             surname, @"surname",
                             username, @"username",
                             email, @"email", nil];
    [insertCommand execute];
    
    [self dismissViewControllerAnimated:YES completion:nil];

}

@end
