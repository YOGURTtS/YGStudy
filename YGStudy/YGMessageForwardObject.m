//
//  YGMessageForwardObject.m
//  YGStudy
//
//  Created by 孙星 on 2019/9/2.
//  Copyright © 2019 YOGURTS. All rights reserved.
//

#import "YGMessageForwardObject.h"
#import <objc/runtime.h>

@implementation YGMessageForwardObject

void hehe() {
    NSLog(@"呵呵");
}

#pragma mark - step1
#pragma mark - 动态方法决议
/**
 Objective C 提供了一种名为动态方法决议的手段，使得我们可以在运行时动态地为一个 selector 提供实现。
 我们只要实现 +resolveInstanceMethod: 或 +resolveClassMethod: 方法，
 并在其中为指定的 selector 提供实现即可（通过调用运行时函数 class_addMethod 来添加）。
 */


/** 解决类方法 */
+ (BOOL)resolveClassMethod:(SEL)sel {
    
    if (sel == @selector(haha)) {
        class_addMethod(self, sel, (IMP)hehe, "v");
        return NO;
    }
    NSLog(@"+ (BOOL)resolveClassMethod:(SEL)sel");
    return [super resolveClassMethod:sel];
}

/** 解决实例方法 */
+ (BOOL)resolveInstanceMethod:(SEL)sel {
    if (sel == @selector(haha)) {
        class_addMethod(self, sel, (IMP)hehe, "v");
        return NO;
    }
    NSLog(@"- (BOOL)resolveClassMethod:(SEL)sel");
    return [super resolveClassMethod:sel];
}

#pragma mark - step2

+ (id)forwardingTargetForSelector:(SEL)aSelector {
    NSLog(@"+ (id)forwardingTargetForSelector:(SEL)aSelector");
    return [super forwardingTargetForSelector:aSelector];
}

- (id)forwardingTargetForSelector:(SEL)aSelector {
    NSLog(@"- (id)forwardingTargetForSelector:(SEL)aSelector");
    return [super forwardingTargetForSelector:aSelector];
}

#pragma mark - step3

+ (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    NSLog(@"+ (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector");
    return [super methodSignatureForSelector:aSelector];
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    NSLog(@"- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector");
    return [super methodSignatureForSelector:aSelector];
}

#pragma mark - step4

+ (void)forwardInvocation:(NSInvocation *)anInvocation {
    NSLog(@"+ (void)forwardInvocation:(NSInvocation *)anInvocation");
    [super forwardInvocation:anInvocation];
}

- (void)forwardInvocation:(NSInvocation *)anInvocation {
    NSLog(@"- (void)forwardInvocation:(NSInvocation *)anInvocation");
    [super forwardInvocation:anInvocation];
}

#pragma mark - step5

+ (void)doesNotRecognizeSelector:(SEL)aSelector {
    NSLog(@"+ (void)doesNotRecognizeSelector:(SEL)aSelector");
    [super doesNotRecognizeSelector:aSelector];
}

- (void)doesNotRecognizeSelector:(SEL)aSelector {
    NSLog(@"- (void)doesNotRecognizeSelector:(SEL)aSelector");
    [super doesNotRecognizeSelector:aSelector];
}


@end
