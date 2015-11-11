//
//  MysqlConnection.m
//  mysql_connector
//
//  Created by Karl Kraft on 5/21/08.
//  Copyright 2008-2011 Karl Kraft. All rights reserved.
//

#import "MysqlConnection.h"
#import "MysqlServer.h"

#import "MysqlCommitException.h"
#import "MysqlRollbackException.h"
#import "GC_MYSQL_BIND.h"


@implementation MysqlConnection

@synthesize transactionsEnabled,server;

+ (void)initialize;
{
  if (sizeof(MYSQL_BIND) != sizeof(GC_MYSQL_BIND) ) {
    [MysqlException raise:@"Failed to initialize" format:@"MYSQL_BIND and GC_MYSQL_BIND differ in size."];
  }
}


+ (MysqlConnection *)connectToServer:(MysqlServer *)server;
{
  MysqlConnection *newObject = [[self alloc] init];
  mysql_init(&(newObject->_connection));
  unsigned int timeout=server.connectionTimeout;
  mysql_options(&(newObject->_connection),MYSQL_OPT_CONNECT_TIMEOUT,&timeout);

  MysqlLog(@"Connecting to %@",server);
  
  if (!mysql_real_connect(&(newObject->_connection),
                          [server.host UTF8String],
                          [server.user UTF8String],
                          [server.password UTF8String],
                          [server.schema UTF8String],
                          server.port,  // default port
                          NULL,  // default socket
                          server.flags)) {
    MysqlLog(@"Failed to connect: Error: %s\n",mysql_error(&(newObject->_connection)));
    [newObject release];
    return nil;
  } else {
    MysqlLog(@"Connected to %@",server);
  }
  if (!mysql_set_character_set(&(newObject->_connection), "utf8")) {
    MysqlLog(@"Client character set: %s\n", mysql_character_set_name(&(newObject->_connection)));
  }
  newObject->server = server;
  return [newObject autorelease];
}

+ (MysqlConnection *)connectToServers:(NSArray *)arrayOfServers;
{
  for (MysqlServer *server in arrayOfServers) {
    MysqlConnection *aConnection=[self connectToServer:server];
    if (aConnection) return aConnection;
  }
  return nil;
}

- (MYSQL *)getConnection;
{
  return &_connection;
}

- (void)enableStrictSql;
{
  @synchronized (self) {
    MysqlLog(@"Setting strict sql");
    
    if (mysql_query(&_connection, "set sql_mode=strict_all_tables")) {
      [MysqlException raiseConnection:self 
                           withFormat:@"Could not set sql_mode #%d:%s",mysql_errno(&_connection), mysql_error(&_connection)];
    }
  }
}

- (void)enableTransactions;
{
  @synchronized (self) {
    MysqlLog(@"Transactions Enabled");
    transactionsEnabled=YES;
    mysql_autocommit(&_connection, 0);
  }
}

- (void)disableTransactions;
{
  @synchronized (self) {
    MysqlLog(@"Transactions Disabled");
    transactionsEnabled=NO;
    mysql_autocommit(&_connection, 1);
  }
}

- (void)commitTransaction;
{
  @synchronized (self) {
    if (mysql_commit(&_connection)) {
      [MysqlCommitException raiseConnection:self withFormat:@"Transaction commit failed (%s)",mysql_error(&_connection)];
    } else {
      MysqlLog(@"Transaction committed");
    }
  }
}

- (void)rollbackTransaction;
{
  @synchronized (self) {
    if (mysql_rollback(&_connection)) {
      [MysqlRollbackException raiseConnection:self withFormat:@"Transaction rollback failed (%s)",mysql_error(&_connection)];
    } else {
      MysqlLog(@"Transaction committed");
    }
  }
}

- (void)sendIdle:(NSTimer *)t;
{
  @synchronized (self) {
    MysqlLog(@"Sending idle");
    mysql_query(&_connection, "select 'MysqlConnect:idleTmer'");
    MYSQL_RES     *theResults = mysql_use_result(&_connection);
    mysql_free_result(theResults);  
  }
}

- (void)startIdle;
{
  [NSTimer scheduledTimerWithTimeInterval:60.0 target:self selector:@selector(sendIdle:) userInfo:nil repeats:YES];
}



- (void)dealloc;
{
  mysql_close(&_connection);
  [super dealloc];  
}

- (void)finalize;
{
  mysql_close(&_connection);
  [super finalize];
}

- (NSString *)description
{
  return [NSString stringWithFormat:@"%@ %@/%@/%@/%@",[super description],server.host,server.schema,server.user,server.password];
}

@end
