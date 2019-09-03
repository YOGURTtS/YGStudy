//
//  YGForwardingTarget.m
//  YGStudy
//
//  Created by 孙星 on 2019/9/3.
//  Copyright © 2019 YOGURTS. All rights reserved.
//

#import "YGForwardingTarget.h"
#import <objc/runtime.h>

@implementation YGForwardingTarget

- (void)haha {
    NSLog(@"哈哈");
}

void heihei() {
    NSLog(@"YGForwardingTarget.h -- 呵呵");
}

/** 解决类方法 */
+ (BOOL)resolveClassMethod:(SEL)sel {
    NSLog(@"+ (BOOL)resolveClassMethod:(SEL)sel");
    if (sel == @selector(haha)) {
        class_addMethod(self, sel, (IMP)heihei, "v");
        return NO;
    }
    return [super resolveClassMethod:sel];
}

/** 解决实例方法 */
+ (BOOL)resolveInstanceMethod:(SEL)sel {
    NSLog(@"- (BOOL)resolveClassMethod:(SEL)sel");
    if (sel == @selector(haha)) {
        class_addMethod(self, sel, (IMP)heihei, "v");
        return NO;
    }
    return [super resolveClassMethod:sel];
}

#pragma mark - step0

+ (id)forwardingTargetForSelector:(SEL)aSelector {
    NSLog(@"+ (id)forwardingTargetForSelector:(SEL)aSelector");
    return [super forwardingTargetForSelector:aSelector];
}

- (id)forwardingTargetForSelector:(SEL)aSelector {
    NSLog(@"- (id)forwardingTargetForSelector:(SEL)aSelector");
    return [super forwardingTargetForSelector:aSelector];
}

#pragma mark - step1

+ (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    NSLog(@"+ (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector");
    return [super methodSignatureForSelector:aSelector];
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    NSLog(@"- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector");
    return [super methodSignatureForSelector:aSelector];
}

#pragma mark - step2

+ (void)forwardInvocation:(NSInvocation *)anInvocation {
    NSLog(@"+ (void)forwardInvocation:(NSInvocation *)anInvocation");
    [super forwardInvocation:anInvocation];
}

- (void)forwardInvocation:(NSInvocation *)anInvocation {
    NSLog(@"- (void)forwardInvocation:(NSInvocation *)anInvocation");
    [super forwardInvocation:anInvocation];
}

#pragma mark - step3

+ (void)doesNotRecognizeSelector:(SEL)aSelector {
    NSLog(@"+ (void)doesNotRecognizeSelector:(SEL)aSelector");
    [super doesNotRecognizeSelector:aSelector];
}

- (void)doesNotRecognizeSelector:(SEL)aSelector {
    NSLog(@"- (void)doesNotRecognizeSelector:(SEL)aSelector");
    [super doesNotRecognizeSelector:aSelector];
}

@end
