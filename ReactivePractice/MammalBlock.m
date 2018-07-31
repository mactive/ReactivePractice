//
//  MammalBlock.m
//  ReactivePractice
//
//  Created by mac on 2018/7/31.
//  Copyright © 2018 thinktube. All rights reserved.
//

#import "MammalBlock.h"

@interface MammalBlock()
// block作为属性
@property(nonatomic, copy) void (^blockDog)();
@property(nonatomic, strong) NSString *dataString;
@end

@implementation MammalBlock

- (instancetype)init
{
    self = [super init];
    if (self) {
        NSLog(@"MammalBlcok init");
        self.dataString = @"dataString";
    }
    return self;
}

-(void) blockAsParam:(void (^)())block
{
    block();
}


- (void)test
{
    NSUInteger (^addBlock)(NSUInteger, NSUInteger) = ^(NSUInteger num1, NSUInteger num2){
        return num1 + num2;
    };
    
    NSUInteger added = addBlock(1, 2);
    NSLog(@"%ld",added);
    
    [self blockAsParam:^{
        NSLog(@"block 作为参数, 打印 added:%ld",added);
    }];
    
    // block 用作循环数组或者字典
    NSArray *array = @[@"zs", @"ls", @"ww"];
    [array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSLog(@"%lu--%@", idx, obj);
    }];
    
    NSDictionary *dict = @{@"zs": @18, @"ts":@16, @"ws":@14};
    [dict enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        NSLog(@"%@ -- %@", key,  obj);
    }];
}



#pragma mark - block 合并高级用法


// 指针引用
- (void) weakTest
{
    __weak typeof(self) weakself = self;
    self.blockDog = ^{
        __strong typeof(weakself) strongSelf = weakself;
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW , (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            
            /**
             * after----dataString
             * 因为持有了 strongself dealloc会等待
             */
            
            // NSLog(@"after----%@",strongSelf.dataString);

            
            NSLog(@"after----%@",weakself.dataString);
            /**
             * 先执行 dealloc
             * after----(null)
             */
            
            // 因为访问的是 weakself, 计数不会+1 dealloc不会等待
            // 这样是安全的
        });
    };
    
    self.blockDog();
}

- (void)dealloc
{
    NSLog(@"dealloc----");
}


@end

