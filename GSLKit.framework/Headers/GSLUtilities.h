//
//  GSLUtilities.h
//  GSLKit
//
//  Created by wangtong on 2019/5/27.
//  Copyright © 2019 wangtong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "NSArray+GSLAddition.h"
#import "NSData+GSLAddition.h"
#import "NSMutableArray+GSLAddition.h"
#import "NSMutableDictionary+GSLAddition.h"
#import "NSNull+GSLAddition.h"
#import "NSString+GSLAddition.h"
#import "UIDevice+GSLAddition.h"
#import "NSDate+GSLAddition.h"
#import "GSLJSON.h"

/**
 Synthsize a weak or strong reference.
 
 Example:
 @weakify(self)
 [self doSomething^{
 @strongify(self)
 if (!self) return;
 ...
 }];
 
 */
#ifndef weakify
#if DEBUG
#if __has_feature(objc_arc)
#define weakify(object) autoreleasepool{} __weak __typeof__(object) weak##_##object = object;
#else
#define weakify(object) autoreleasepool{} __block __typeof__(object) block##_##object = object;
#endif
#else
#if __has_feature(objc_arc)
#define weakify(object) try{} @finally{} {} __weak __typeof__(object) weak##_##object = object;
#else
#define weakify(object) try{} @finally{} {} __block __typeof__(object) block##_##object = object;
#endif
#endif
#endif

#ifndef strongify
#if DEBUG
#if __has_feature(objc_arc)
#define strongify(object) autoreleasepool{} __typeof__(object) object = weak##_##object;
#else
#define strongify(object) autoreleasepool{} __typeof__(object) object = block##_##object;
#endif
#else
#if __has_feature(objc_arc)
#define strongify(object) try{} @finally{} __typeof__(object) object = weak##_##object;
#else
#define strongify(object) try{} @finally{} __typeof__(object) object = block##_##object;
#endif
#endif
#endif

// Screen width
#define k_ScreenWidth     [[UIScreen mainScreen] bounds].size.width
// Screen height
#define k_ScreenHeight    [[UIScreen mainScreen] bounds].size.height

/// iPhoneX  iPhoneXS  iPhoneXS Max  iPhoneXR 机型判断
#define iPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? ((NSInteger)(([[UIScreen mainScreen] currentMode].size.height/[[UIScreen mainScreen] currentMode].size.width)*100) == 216) : NO)

NS_ASSUME_NONNULL_BEGIN

@interface GSLUtilities : NSObject

/**
 * Tests if an object is an array which is not empty.
 */
BOOL GSLIsArrayWithItems(id object);

/**
 * Tests if an object is a set which is not empty.
 */
BOOL GSLIsSetWithItems(id object);

/**
 * Tests if an object is a string which is not empty.
 */
BOOL GSLIsStringWithAnyText(id object);

/**
 * Swap the two method implementations on the given class.
 * Uses method_exchangeImplementations to accomplish this.
 */
void GSLSwapMethods(Class cls, SEL originalSel, SEL newSel);

/**
 *  [NSNull null], nil, @"" to "--".
 *  NSNumber to NSString.
 *  true -> @"1" | false -> @"0".
 */
NSString* GSLPlaceHolderString(id obj);

/**
 *  [NSNull null], nil, @"" to "".
 *  NSNumber to NSString.
 *  true -> @"1" | false -> @"0".
 */
NSString* GSLNonEmptyString(id obj);

/**
 *  [NSNull null], nil, @"" to "-".
 *  NSNumber to NSString.
 *  true -> @"1" | false -> @"0".
 */
NSString* GSLNonEmptyString_(id obj);

/**
 *  If target string contant ".",return YES;
 *  else return NO;
 */
BOOL GSLIsStringContantDrop(id object);

/**
 *  是否全是空格
 */
BOOL GSLIsFullSpaceString(id obj);

/**
 *  如果是整形数字字符串,return YES;
 *  else return NO;
 */
BOOL GSLIsPureInt(id obj);

/**
 *  如果是浮点形数字字符串,return YES;
 *  else return NO;
 */
BOOL GSLIsPureFloat(id obj);

/**
 *  如果是纯数字字符串,return YES;
 *  else return NO;
 */
BOOL GSLIsPureNumberCharacters(id obj);

/**
 *  判断字符串是否是url格式,return YES;
 *  else return NO;
 */
BOOL GSLIsURLString(NSString *obj);

/**
 *  快速生成错误信息
 *  errorKey 错误编码
 *  description 错误描述
 */
NSError *GSLError(NSString *errorKey, NSString *description);

/**
 *  将秒转换成 时间格式 HH:mm:ss
 */
NSString *GSLConvertTimeSecond(NSTimeInterval timeSecond);

/**
 *  根据颜色和尺寸生成图片
 */
UIImage *GSLImageWithColorAndSize(UIColor *color, CGSize size);

/**
 *  判断是否是指定类型的对象
 */
BOOL GSLIsTargetClass(id obj, Class class);

@end

NS_ASSUME_NONNULL_END
