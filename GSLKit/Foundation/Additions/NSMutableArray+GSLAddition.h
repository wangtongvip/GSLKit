//
//  NSMutableArray+GSLAddition.h
//  GSLKit
//
//  Created by wangtong on 2019/5/31.
//  Copyright © 2019 wangtong. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSMutableArray (GSLAddition)

/**
 * Adds a string on the condition that it's non-nil and non-empty.
 */
- (void)addNonEmptyString:(NSString*)string;

/*
 * Shuffle the array with a random algorithm.
 */
- (void)shuffle;

@end

NS_ASSUME_NONNULL_END
