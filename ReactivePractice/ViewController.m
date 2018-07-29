//
//  ViewController.m
//  ReactivePractice
//
//  Created by mengqian on 13/7/2016.
//  Copyright © 2016 thinktube. All rights reserved.
//

#import "ViewController.h"
#import <JavaScriptCore/JavaScriptCore.h>
#import "GCD_target.h"
#import "OpeartionQueue.h"
#import "RACPlay.h"
#import "Mammal.h"

#import <Objc/runtime.h>
#import <Objc/message.h>


@interface ViewController ()
@property(nonatomic, strong)NSString *str;
@property(nonatomic, copy)NSMutableArray *array;
@end

@implementation ViewController
@synthesize str;
@synthesize array;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    array = [[NSMutableArray alloc]init];
    
    
//    [self testFuncA];
//    [self testFuncB];
//    [self testFuncC];
//    GCD_target *gcdTarget = [[GCD_target alloc] init];
//    [gcdTarget set_target];
  
  // OP1
//  OpeartionQueue *queue = [[OpeartionQueue alloc] init];
//  [queue start];
  
  // OP2
//  RACPlay *play = [[RACPlay alloc] init];
//  NSLog(@"%@",play.files);
  
  // OP3
  [self testDog];
}

- (void) testDog
{
  Mammal *dog = [[Mammal alloc] initWithType:@"Dog" andAge:@12];
  dog.numPerBrith = 4;
  [dog brith];
  
  // 调用私有方法
  SEL speedFunc = NSSelectorFromString(@"configSpeed:");
  objc_msgSend(dog, speedFunc, 20);
  
  // 调用类方法1
  Class mammalClass = [Mammal class];
  NSString * definition = [mammalClass performSelector:@selector(definition)];
  NSLog(definition);

  // 调用类方法2
  objc_msgSend(mammalClass, @selector(definition));
  NSLog(definition);
  
  // [dog fly];
  // [dog fly] 还有下面另外一种调用方法
  [dog performSelector:@selector(fly)];
  
}

-(void)testFuncC
{
    JSContext *context = [[JSContext alloc] init];
    [context evaluateScript:@"var num = 5 + 5"];
    [context evaluateScript:@"var names = ['Grace', 'Ada', 'Margaret']"];
    [context evaluateScript:@"var triple = function(value) { return value * 3 }"];
    JSValue *tripleNum = [context evaluateScript:@"triple(num)"];
    
}

- (void)testFuncA{
    self.str = @"ddd";
    NSString *t1 = [self.str stringByAppendingFormat:@"---"];
    [array addObject:t1];
    
    self.str = nil;
    // nil 可以执行方法,返回的还是nil
    NSString *t2 = [self.str stringByAppendingFormat:@"---"];
    //t2 nil
    [array addObject:t2];
    // will crash
}


-(void)testFuncB{
    dispatch_queue_t
    concurrentDispatchQueue=dispatch_queue_create("com.test.queue", DISPATCH_QUEUE_SERIAL);
    
    dispatch_async(concurrentDispatchQueue, ^{
        NSLog(@"1");
    });
    dispatch_async(concurrentDispatchQueue, ^{
        sleep(2);
        NSLog(@"2");
    });
    dispatch_async(concurrentDispatchQueue, ^{
        sleep(1);
        NSLog(@"3");
    });

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
