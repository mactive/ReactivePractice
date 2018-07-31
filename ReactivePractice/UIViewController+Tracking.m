//
//  UIViewControll+Tracking.m
//  ReactivePractice
//
//  Created by Qian Meng on 29/7/2018.
//  Copyright © 2018 thinktube. All rights reserved.
//

#import "UIViewController+Tracking.h"
#import <objc/runtime.h>

@implementation UIViewController (Tracking)
+ (void)load {
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    Class class = [self class];
    // When swizzling a class method, use the following:
    // Class class = object_getClass((id)self);
    SEL originalSelector = @selector(viewWillAppear:);
    SEL swizzledSelector = @selector(xxx_viewWillAppear:);
    Method originalMethod = class_getInstanceMethod(class, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
    BOOL didAddMethod = class_addMethod(class,
                                        originalSelector,
                                        method_getImplementation(swizzledMethod),
                                        method_getTypeEncoding(swizzledMethod));
    
    
    if (didAddMethod) {
      // 主类本身没有实现需要替换的方法，而是继承了父类的实现
      class_replaceMethod(class,
                          swizzledSelector,
                          method_getImplementation(originalMethod),
                          method_getTypeEncoding(originalMethod));
    } else {
      // 主类本身有实现需要替换的方法，也就是 class_addMethod 方法返回 NO
      method_exchangeImplementations(originalMethod, swizzledMethod);
    }
  });
}

#pragma mark - Method Swizzling

- (void)xxx_viewWillAppear:(BOOL)animated {
  [self xxx_viewWillAppear:animated];
  NSLog(@"viewWillAppear: %@", self);
}
@end
