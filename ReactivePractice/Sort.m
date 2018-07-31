//
//  Sort.m
//  ReactivePractice
//
//  Created by Qian Meng on 31/7/2018.
//  Copyright © 2018 thinktube. All rights reserved.
//

#import "Sort.h"

typedef NSComparisonResult (^CompareBlock)(id obj1, id obj2);

@interface Sort()
@property(nonatomic, copy) CompareBlock comparion;
@end

@implementation Sort

-(instancetype) init
{
  self = [super init];
  if (self) {
    
    [self initCompareBlock];
    [self sortArray];
  }
  return self;
}

-(void)initCompareBlock
{
  self.comparion = ^NSComparisonResult(id obj1, id obj2) {
    NSNumber *t1 = (NSNumber *)obj1;
    NSNumber *t2 = (NSNumber *)obj2;
    if(t1.intValue > t2.intValue) {
      return NSOrderedDescending;
    } else if (t1.intValue < t2.intValue) {
      return NSOrderedAscending;
    } else {
      return NSOrderedSame;
    }
  };
}

-(void)sortArray
{
  NSArray *nums = @[@6,@2,@10, @8, @1];
  NSArray *numSorted = [nums sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
    NSNumber *t1 = (NSNumber *)obj1;
    NSNumber *t2 = (NSNumber *)obj2;
    if(t1.intValue > t2.intValue) {
      return NSOrderedAscending;
    } else if (t1.intValue < t2.intValue) {
      return NSOrderedDescending;
    } else {
      return NSOrderedSame;
    }
  }];
  NSLog(@"%@", numSorted);
  
  NSArray *numOrderd = [nums sortedArrayUsingComparator:self.comparion];
  NSLog(@"%@", numOrderd);

}

@end
