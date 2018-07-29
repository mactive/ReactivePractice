//
//  MammalProtocol.h
//  ReactivePractice
//
//  Created by Qian Meng on 29/7/2018.
//  Copyright © 2018 thinktube. All rights reserved.
//

#ifndef MammalProtocol_h
#define MammalProtocol_h

@protocol MammalProtocol <NSObject>

// 必须实现
@required
@property(nonatomic, assign) NSUInteger numPerBrith;

// 哺乳动物特有的 喂奶
- (void)nurse;

// 哺乳动物特有的 生产
- (void)brith;

// 哺乳动物不一定都会的 飞行
@optional
- (void)fly;

@end



#endif /* MammalProtocol_h */
