//
//  NSMutableArray+GSLAddition.m
//  GSLKit
//
//  Created by wangtong on 2019/5/31.
//  Copyright © 2019 wangtong. All rights reserved.
//

#import "NSMutableArray+GSLAddition.h"
#import "GSLUtilities.h"
#import <objc/runtime.h>
#import <objc/message.h>

@implementation NSMutableArray (GSLAddition)

///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)addNonEmptyString:(NSString*)string {
    if (GSLIsStringWithAnyText(string)) {
        [self addObject:string];
    }
}

///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)shuffle
{
    for (NSUInteger i = [self count] - 1; i > 0; i--) {
        [self exchangeObjectAtIndex:arc4random_uniform((int)i + 1)
                  withObjectAtIndex:i];
    }
}

@end
