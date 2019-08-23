//
//  NSNull+GSLAddition.m
//  GSLKit
//
//  Created by wangtong on 2019/5/31.
//  Copyright © 2019 wangtong. All rights reserved.
//

#import "NSNull+GSLAddition.h"

@implementation NSNull (GSLAddition)

- (NSString *)stringValue{
    return @"";
}

- (NSString *)format4n4{
    return @"";
}

- (NSString *)formatMonery{
    return @"";
}

- (NSString *)formatMoneyWithCurrency:(NSString *)currency
{
    return @"";
}
-(NSString *)formatAnyDecimal{
    return @"";
}

- (BOOL)isEqualToString:(NSString *)string{
    if ([string isEqual:[NSNull null]]) {
        return YES;
    }
    return NO;
}

- (NSUInteger)length
{
    return 0;
}

- (NSString *)replace:(NSString *)oldString with:(NSString *)newString
{
    return @"";
}

- (NSString *)phoneNumberTrim
{
    return @"";
}

- (NSString *)formatAccount
{
    return @"";
}

- (NSString *)formatMonerySpecial
{
    return @"";
}

- (NSString *)formatMoneryThreeDecimal
{
    return @"";
}

- (NSString *)formatMoneryFourDecimal
{
    return @"";
}

- (NSString *)correctUserInput
{
    return @"";
}

- (NSString *)mobileFormat
{
    return @"";
}

- (NSString *)formatWhiteSpace
{
    return @"";
}

- (NSString *)formatWhiteSpaceAndNewLineCharacterSet
{
    return @"";
}

- (NSString *)formatBalance
{
    return @"";
}

- (NSString *)formatMoneyUpper
{
    return @"";
}

@end
