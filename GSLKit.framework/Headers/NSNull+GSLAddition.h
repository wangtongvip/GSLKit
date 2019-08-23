//
//  NSNull+GSLAddition.h
//  GSLKit
//
//  Created by wangtong on 2019/5/31.
//  Copyright © 2019 wangtong. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSNull (GSLAddition)

- (NSString *)stringValue;

- (NSString *)format4n4;

- (NSString *)formatMonery;

-(NSString *)formatAnyDecimal;

- (NSString *)formatMoneyWithCurrency:(NSString *)currency;

- (BOOL)isEqualToString:(NSString *)string;

- (NSUInteger)length;


- (NSString *)replace:(NSString *)oldString with:(NSString *)newString;

- (NSString *)phoneNumberTrim;

- (NSString *)formatAccount;

- (NSString *)formatMonerySpecial;

- (NSString *)formatMoneryThreeDecimal;

- (NSString *)formatMoneryFourDecimal;

- (NSString *)correctUserInput;

- (NSString *)mobileFormat;

- (NSString *)formatWhiteSpace;

- (NSString *)formatWhiteSpaceAndNewLineCharacterSet;

- (NSString *)formatBalance;

- (NSString *)formatMoneyUpper;

@end

NS_ASSUME_NONNULL_END
