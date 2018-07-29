//
//  Mammal.m
//  ReactivePractice
//
//  Created by Qian Meng on 29/7/2018.
//  Copyright © 2018 thinktube. All rights reserved.
//

#import "Mammal.h"

@implementation Mammal
@synthesize type;
@synthesize age;
@synthesize numPerBrith;

+ (NSString *)definition {
  return @"any warm-blooded vertebrate having the skin more or less covered with hair; young are born alive except for the small subclass of monotremes and nourished with milk";
}


- (instancetype)initWithType:(NSString *) type andAge:(NSNumber *)age {
  self = [super init];
  if (self) {
    self.type = type;
    self.age = age;
  }
  return self;
}

- (void)brith {
  NSLog(@"%@ can brith %lu once brith", self.type, (unsigned long)self.numPerBrith);
}

- (void)nurse {
  NSLog(@"%@ can nurse two at sametime ", self.type);
}

- (void)configSpeed:(NSUInteger)speed {
  _speed = speed;
}

- (void)fly {
  NSLog(@"FlySpeed %lu km/h", (unsigned long)_speed);
}

@end
