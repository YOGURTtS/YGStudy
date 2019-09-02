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

+ (BOOL)resolveClassMethod:(SEL)sel {
    
    if (sel == @selector(haha)) {
        class_addMethod(self, sel, (IMP)hehe, "v");
        return YES;
    }
    return [super resolveClassMethod:sel];
}

+ (BOOL)resolveInstanceMethod:(SEL)sel {
    if (sel == @selector(haha)) {
        class_addMethod(self, sel, (IMP)hehe, "v");
        return YES;
    }
    return [super resolveClassMethod:sel];
}

- (id)forwardingTargetForSelector:(SEL)aSelector {
    return nil;
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    return nil;
}

- (void)forwardInvocation:(NSInvocation *)anInvocation {
    
}


@end
