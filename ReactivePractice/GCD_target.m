//
//  GCD_target.m
//  ReactivePractice
//
//  Created by mengqian on 15/5/2017.
//  Copyright © 2017 thinktube. All rights reserved.
//

#import "GCD_target.h"

@implementation GCD_target

-(void)set_target
{
    dispatch_queue_t mySerialDispatchQueue =
        dispatch_queue_create("com.example.gcd.MySerialDispatchQueue", DISPATCH_QUEUE_SERIAL);
    dispatch_queue_t globalDispatchQueueBackground =
        dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0);
    
    dispatch_queue_t myConcurrentDispatchQueue =
//    dispatch_queue_create("com.example.gcd.MyConcurrentDispatchQueue", DISPATCH_QUEUE_CONCURRENT);
    
        dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0);
    
    for (NSInteger i=0; i<10020; i++) {
        NSLog(@"%ld", i);
        if(i > 10000 && i < 10010){
            
            dispatch_sync(myConcurrentDispatchQueue, ^{
                NSLog(@"serial 1");
                NSLog(@"%s", dispatch_queue_get_label(DISPATCH_CURRENT_QUEUE_LABEL));
                sleep(2);
            });
        }
    }
    
        dispatch_async(myConcurrentDispatchQueue, ^{
        NSLog(@"serial 2");
        NSLog(@"%s", dispatch_queue_get_label(DISPATCH_CURRENT_QUEUE_LABEL));

        sleep(1);
    });
    dispatch_sync(myConcurrentDispatchQueue, ^{
        NSLog(@"serial 3");
        NSLog(@"%s", dispatch_queue_get_label(DISPATCH_CURRENT_QUEUE_LABEL));

        sleep(1);
    });
    dispatch_async(myConcurrentDispatchQueue, ^{
        NSLog(@"serial 4");
        NSLog(@"%s", dispatch_queue_get_label(DISPATCH_CURRENT_QUEUE_LABEL));

        sleep(1);
    });
//    dispatch_set_target_queue(mySerialDispatchQueue, globalDispatchQueueBackground);
}

@end
