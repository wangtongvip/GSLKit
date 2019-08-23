//
//  NSMutableDictionary+GSLAddition.h
//  GSLKit
//
//  Created by wangtong on 2019/5/31.
//  Copyright © 2019 wangtong. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSMutableDictionary (GSLAddition)

/**
 * Adds a string on the condition that it's non-nil and non-empty.
 */
- (void)setNonEmptyString:(NSString*)string forKey:(id)key;

@end

NS_ASSUME_NONNULL_END
