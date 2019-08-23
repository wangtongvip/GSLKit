//
//  NSData+GSLAddition.h
//  GSLKit
//
//  Created by wangtong on 2019/5/31.
//  Copyright © 2019 wangtong. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSData (GSLAddition)

/**
 * Calculate the md5 hash of this data using CC_MD5.
 *
 * @return md5 hash of this data
 */
@property (nonatomic, readonly) NSString* md5Hash;

/**
 * Calculate the SHA1 hash of this data using CC_SHA1.
 *
 * @return SHA1 hash of this data
 */
@property (nonatomic, readonly) NSString* sha1Hash;

- (NSString *)MD5;

/**
 * Create an NSData from a base64 encoded representation
 * Padding '=' characters are optional. Whitespace is ignored.
 * @return the NSData object
 */
+ (id)dataWithBase64EncodedString:(NSString *)string;

/**
 * Marshal the data into a base64 encoded representation
 *
 * @return the base64 encoded string
 */
- (NSString *)base64Encoding;

/**
 * Return data with AES256 encrypt.
 */
- (NSData *)encryptedDataWithAES256Key:(NSString *)key;

/**
 * Return data with AES256 decrypt.
 */
- (NSData *)decryptedDateWithAES265Key:(NSString *)key;

/**
 * Return string with AES256 encrypt.
 */
- (NSData*)encryptedDataWithAES256Key:(NSString *)string withKey:(NSString *)key;

/**
 * Return string with AES256 decrypt.
 */
- (NSString*)decryptedDateWithAES265Key:(NSData *)data withKey:(NSString *)key;

@end

NS_ASSUME_NONNULL_END
