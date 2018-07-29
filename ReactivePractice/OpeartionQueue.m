//
//  OpeartionQueue.m
//  ReactivePractice
//
//  Created by mengqian on 17/8/2017.
//  Copyright © 2017 thinktube. All rights reserved.
//

#import "OpeartionQueue.h"

@implementation OpeartionQueue

- (void) start {
  NSInvocationOperation *operation1 =
    [[NSInvocationOperation alloc] initWithTarget:self
                                         selector:@selector(thread1)
                                           object:nil];
  NSInvocationOperation *operation2 =
    [[NSInvocationOperation alloc] initWithTarget:self
                                         selector:@selector(thread2)
                                           object:nil];
  
  NSBlockOperation *operation3 = [NSBlockOperation blockOperationWithBlock:^{
    NSLog(@"currentThread3 = %@", [NSThread currentThread]);
  }];
  
  [operation3 addExecutionBlock:^{
    NSLog(@"currentThread3_1 = %@", [NSThread currentThread]);
  }];
  
  
  // make a queue
  
  NSOperationQueue *queue = [[NSOperationQueue alloc] init];
//  queue.maxConcurrentOperationCount = 1;

  [queue addOperation:operation1];
  [queue addOperation:operation2];
  [queue addOperation:operation3];
  
  [queue addOperationWithBlock:^{
    NSLog(@"currentThread4 = %@",[NSThread currentThread]);
  }];
  
//  NSOperationQueue *serialQueue = [[NSOperationQueue alloc] init];
//
//  
//  [serialQueue addOperations:[NSArray arrayWithObjects:operation1, operation2, operation3, nil] waitUntilFinished:YES];
  
//  [operation3 start];
}

- (void)thread1
{
  NSLog(@"currentThread1 = %@", [NSThread currentThread]);
}

- (void)thread2
{
  NSLog(@"currentThread2 = %@", [NSThread currentThread]);
}



@end
