//
//  NSArray+GSLAddition.m
//  GSLKit
//
//  Created by wangtong on 2019/5/31.
//  Copyright © 2019 wangtong. All rights reserved.
//

#import "NSArray+GSLAddition.h"
#import "GSLUtilities.h"

@implementation NSArray (GSLAddition)

///////////////////////////////////////////////////////////////////////////////////////////////////
- (_Nullable id)objectWithValue:(id)value forKey:(id)key {
    for (id object in self) {
        id propertyValue = [object valueForKey:key];
        if ([propertyValue isEqual:value]) {
            return object;
        }
    }
    return nil;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (_Nullable id)objectWithClass:(Class)cls {
    for (id object in self) {
        if ([object isKindOfClass:cls]) {
            return object;
        }
    }
    return nil;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (BOOL)containsObject:(id)object withSelector:(SEL)selector {
    for (id item in self) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        BOOL result = [[item performSelector:selector withObject:object] boolValue];
#pragma clang diagnostic pop
        
        if (result) {
            return YES;
        }
    }
    return NO;
}

///////////////////////////////////////////////////////////////////////////////////////////////////
/**
 *  将数组中的字符串，拼接成string ","分隔
 */
- (NSString *)swithToStringWihtPoint {
    //获取用户小区编号
    NSString *cStirng = @"";
    if ([self count] > 0) {
        for (int i = 0; i < [self count]; i++) {
            //change by wangtong branches
            cStirng = [cStirng stringByAppendingString:GSLNonEmptyString(self[i])];
            if (i != ([self count] - 1)) {
                cStirng = [cStirng stringByAppendingString:@","];
            }
        }
    }
    return cStirng;
}

@end
