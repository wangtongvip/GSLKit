//
//  NSArray+GSLAddition.h
//  GSLKit
//
//  Created by wangtong on 2019/5/31.
//  Copyright © 2019 wangtong. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSArray (GSLAddition)

/**
 * @return nil or an object that matches value with isEqual:
 */
- (_Nullable id)objectWithValue:(id)value forKey:(id)key;

/**
 * @return the first object with the given class.
 */
- (_Nullable id)objectWithClass:(Class)cls;

/**
 * @param selector Required format: - (NSNumber*)method:(id)object;
 */
- (BOOL)containsObject:(id)object withSelector:(SEL)selector;

/**
 *  将数组中的字符串，拼接成string ","分隔
 */
- (NSString *)swithToStringWihtPoint;

@end

NS_ASSUME_NONNULL_END
