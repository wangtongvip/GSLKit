//
//  NSMutableDictionary+GSLAddition.m
//  GSLKit
//
//  Created by wangtong on 2019/5/31.
//  Copyright © 2019 wangtong. All rights reserved.
//

#import "NSMutableDictionary+GSLAddition.h"
#import "GSLUtilities.h"

@implementation NSMutableDictionary (GSLAddition)

///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)setNonEmptyString:(NSString*)string forKey:(id)key {
    if (GSLIsStringWithAnyText(string)) {
        [self setObject:string forKey:key];
    }
}

@end
