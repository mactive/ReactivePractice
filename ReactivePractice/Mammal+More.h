//
//  Mammal+More.h
//  ReactivePractice
//
//  Created by Qian Meng on 30/7/2018.
//  Copyright © 2018 thinktube. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Mammal.h"

NS_ASSUME_NONNULL_BEGIN

@interface Mammal(More)

@property (nonatomic, strong) NSString* name;

+ (void)legacy;
- (void)eat;

@end

NS_ASSUME_NONNULL_END
