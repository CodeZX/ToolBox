//
//  SUTableViewInterceptor.m
//  ZHIBO
//
//  Created by 崔大鹏 on 16/12/1.
//  Copyright © 2016年 Hemaapp. All rights reserved.
//

#import "SUTableViewInterceptor.h"

@implementation SUTableViewInterceptor

#pragma mark - forward & response override
- (id)forwardingTargetForSelector:(SEL)aSelector {
    if ([self.middleMan respondsToSelector:aSelector]) return self.middleMan;
    if ([self.receiver respondsToSelector:aSelector]) return self.receiver;
    return [super forwardingTargetForSelector:aSelector];
}

- (BOOL)respondsToSelector:(SEL)aSelector {
    if ([self.middleMan respondsToSelector:aSelector]) return YES;
    if ([self.receiver respondsToSelector:aSelector]) return YES;
    return [super respondsToSelector:aSelector];
}


@end
