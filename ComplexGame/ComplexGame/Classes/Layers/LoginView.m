//
//  LoginView.m
//  ComplexGame
//
//  Created by Lion User on 5/28/13.
//  Copyright (c) 2013 Lion User. All rights reserved.
//

#import "LoginView.h"

#import "MysqlServer.h"
#import "MysqlConnection.h"
#import "MysqlFetch.h"
#import "Globals.h"

@interface LoginView ()

@end

@implementation LoginView
@synthesize usernameField;

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
    usernameField.delegate = self;
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (textField == usernameField) {
        [textField resignFirstResponder];
        return NO;
    }
    

    return YES;
}


- (IBAction)loginUser:(id)sender
{
    NSString *username = usernameField.text;
    if (username == nil || [username compare:@""] == 0)
    {
        [usernameField becomeFirstResponder];
        return;
    }
    
    MysqlServer *server = [[MysqlServer alloc] init];
    MysqlConnection *conn = [MysqlConnection connectToServer:server];
    if (conn == nil)
    {
        NSLog(@"Database Error!");
        return;
    }
    
    NSString *query = [NSString stringWithFormat:@"SELECT * FROM userinfo WHERE username='%@'", username];
    MysqlFetch *userData = [MysqlFetch fetchWithCommand:query onConnection:conn];
    
    int count = [userData.results count];
    if (count == 0)
    {
        
    }
    else
    {
        NSDictionary *dic = [userData.results objectAtIndex:0];
        g_username = [dic objectForKey:@"username"];
        
        [self dismissViewControllerAnimated:YES completion:nil];
    }
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
