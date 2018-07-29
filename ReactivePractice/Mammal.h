//
//  Mammal.h
//  ReactivePractice
//
//  Created by Qian Meng on 29/7/2018.
//  Copyright © 2018 thinktube. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MammalProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface Mammal : NSObject <MammalProtocol>
{
  NSUInteger _speed;
}

@property(nonatomic, strong) NSString * type;
@property(nonatomic, strong) NSNumber * age;
- (instancetype)initWithType:(NSString *) type andAge:(NSNumber *)age;

@end

NS_ASSUME_NONNULL_END
