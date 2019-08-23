//
//  GSLUtilities.m
//  GSLKit
//
//  Created by wangtong on 2019/5/27.
//  Copyright © 2019 wangtong. All rights reserved.
//

#import "GSLUtilities.h"
#import <objc/runtime.h>

@implementation GSLUtilities

///////////////////////////////////////////////////////////////////////////////////////////////////
BOOL GSLIsArrayWithItems(id object) {
    return [object isKindOfClass:[NSArray class]] && [(NSArray*)object count] > 0;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
BOOL GSLIsSetWithItems(id object) {
    return [object isKindOfClass:[NSSet class]] && [(NSSet*)object count] > 0;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
BOOL GSLIsStringWithAnyText(id object) {
    return [object isKindOfClass:[NSString class]] && [(NSString*)object length] > 0 && ![[object stringValue] isEqualToString:@"null"] && ![[object stringValue] isEqualToString:@"NULL"];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
void GSLSwapMethods(Class cls, SEL originalSel, SEL newSel) {
    Method originalMethod = class_getInstanceMethod(cls, originalSel);
    Method newMethod = class_getInstanceMethod(cls, newSel);
    method_exchangeImplementations(originalMethod, newMethod);
}

NSString* GSLPlaceHolderString(id obj) {
    if (obj == nil || obj == [NSNull null] ||
        ([obj isKindOfClass:[NSString class]] && [obj length] == 0)) {
        return @"--";
    } else if ([obj isKindOfClass:[NSNumber class]]) {
        return GSLNonEmptyString([obj stringValue]);
    }
    return obj;
}

NSString* GSLNonEmptyString(id obj){
    if (obj == nil || obj == [NSNull null] ||
        ([obj isKindOfClass:[NSString class]] && [obj length] == 0)) {
        return @"";
    } else if ([obj isKindOfClass:[NSNumber class]]) {
        return GSLNonEmptyString([obj stringValue]);
    } else if ([obj isKindOfClass:[NSString class]] &&
               ([[obj stringValue] isEqualToString:@"null"] || [[obj stringValue] isEqualToString:@"NULL"])) {
        return @"";
    }
    return obj;
}

NSString* GSLNonEmptyString_(id obj){
    if (obj == nil || obj == [NSNull null] ||
        ([obj isKindOfClass:[NSString class]] && [obj length] == 0)) {
        return @"-";
    } else if ([obj isKindOfClass:[NSNumber class]]) {
        return GSLNonEmptyString([obj stringValue]);
    }
    return obj;
}

BOOL GSLIsStringContantDrop(id object){
    return [object isKindOfClass:[NSString class]] && [object rangeOfString:@"."].location != NSNotFound;
}

BOOL GSLIsFullSpaceString(id obj) {
    NSString *string = [GSLNonEmptyString((NSString *)obj) stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    if (string.length > 0) {
        return NO;
    }
    return YES;
}

BOOL GSLIsPureInt(id obj) {
    NSScanner *scan = [NSScanner scannerWithString:GSLNonEmptyString(obj)];
    int val;
    return [scan scanInt:&val] && [scan isAtEnd];
}

BOOL GSLIsPureFloat(id obj) {
    NSScanner *scan = [NSScanner scannerWithString:GSLNonEmptyString(obj)];
    float val;
    return [scan scanFloat:&val] && [scan isAtEnd];
}

BOOL MBIsPureNumberCharacters(id obj) {
    return GSLIsPureInt(obj) || GSLIsPureFloat(obj);
}

NSError *GSLError(NSString *errorKey, NSString *description) {
    NSDictionary *userInfo = @{
                               NSLocalizedDescriptionKey:GSLNonEmptyString(description),
                               NSLocalizedFailureReasonErrorKey:GSLNonEmptyString(errorKey),
                               NSLocalizedRecoverySuggestionErrorKey:GSLNonEmptyString(errorKey)
                               };
    NSError *error = [NSError errorWithDomain:@"GSLError"
                                         code:0
                                     userInfo:userInfo];
    return error;
}

BOOL GSLIsURLString(NSString *obj) {
    NSString *urlRegex = @"[a-zA-z]+://.*";
    NSPredicate *urlTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", urlRegex];
    return [urlTest evaluateWithObject:GSLNonEmptyString(obj)];
}

NSString *GSLConvertTimeSecond(NSTimeInterval timeSecond) {
    NSString *theLastTime = nil;
    long second = round(timeSecond);
    if (second < 60) {
        theLastTime = [NSString stringWithFormat:@"00:%02zd", second];
    } else if(second >= 60 && second < 3600){
        theLastTime = [NSString stringWithFormat:@"%02zd:%02zd", second/60, second%60];
    } else if(second >= 3600){
        theLastTime = [NSString stringWithFormat:@"%02zd:%02zd:%02zd", second/3600, second%3600/60, second%60];
    }
    return theLastTime;
}

UIImage *GSLImageWithColorAndSize(UIColor *color, CGSize size) {
    if (!color || size.width <= 0 || size.height <= 0) return [UIImage new];
    CGRect rect = CGRectMake(0.0f, 0.0f, size.width, size.height);
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

/**
 *  判断是否是指定类型的对象
 */
BOOL GSLIsTargetClass(id obj, Class class) {
    return [obj isKindOfClass:class];
}

@end
