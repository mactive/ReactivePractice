//
//  Mammal+More.m
//  ReactivePractice
//
//  Created by Qian Meng on 30/7/2018.
//  Copyright © 2018 thinktube. All rights reserved.
//

#import "Mammal+More.h"
#import <Objc/runtime.h>

@implementation Mammal(More)

#pragma mark 动态增加属性
@dynamic name;
static void *Mammal_key_name = &Mammal_key_name;

- (NSString *)name
{
  NSString *theName = objc_getAssociatedObject(self, Mammal_key_name);
  return theName;
}

- (void)setName:(NSString *)name
{
  objc_setAssociatedObject(self, Mammal_key_name, name, OBJC_ASSOCIATION_COPY);
}

#pragma mark 动态增加属性 - end

+ (void)legacy
{
  NSLog(@"What is Mammal legacy?");
}

- (void)eat
{
  NSLog(@"%@ can eat",self.type);
}


@end
