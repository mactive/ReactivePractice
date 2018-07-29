//
//  RACPlay.m
//  ReactivePractice
//
//  Created by mac on 2018/7/24.
//  Copyright © 2018 thinktube. All rights reserved.
//

#import "RACPlay.h"
#import <ReactiveCocoa/ReactiveCocoa.h>

@interface RACPlay()
@end


@implementation RACPlay

@synthesize files;

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        self.files = @[@"1", @"2", @"3"];
        
        id filterData = [self.files.rac_sequence filter:^BOOL(NSString *item) {
            return [item isEqualToString:@"2"];
        }];
        NSLog(@"序列Filter之后的数据:%@",[filterData array]);

        
        
        NSArray *array=@[@(2),@(5),@(7),@(15)];
        RACSequence *sequence = [array rac_sequence];
        id mapData = [sequence map:^id(id value) {
            return @([value integerValue] * 2);
        }];
        NSLog(@"序列Map之后的数据:%@",[mapData array]);
        
    }
    return self;
}



@end
