//
//  MysqlServer.m
//  mysql_connector
//
//  Created by Karl Kraft on 3/19/11.
//  Copyright 2011 Karl Kraft. All rights reserved.
//

#import "MysqlServer.h"
#import "mysql.h"


@implementation MysqlServer

@synthesize host,user,password,schema;
@synthesize port,flags,connectionTimeout;


- init;
{
  [super init];
  self.host=@"192.168.1.91";
  self.user=@"greemla";
  self.password=@"123456";
  self.schema=@"complex_funny";
  self.port=3306;
  self.flags=CLIENT_FOUND_ROWS;
  self.connectionTimeout=30;
  return self;
}

- (NSString *)description;
{
  return [NSString stringWithFormat:@"MysqlServer: %@:%d as user %@",host,port,user];
}
@end
