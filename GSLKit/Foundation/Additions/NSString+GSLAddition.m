//
//  NSString+GSLAddition.m
//  GSLKit
//
//  Created by wangtong on 2019/5/31.
//  Copyright © 2019 wangtong. All rights reserved.
//

#import "NSString+GSLAddition.h"
#import "NSData+GSLAddition.h"
#import "GSLUtilities.h"

@implementation NSString (GSLAddition)

- (NSString *)stringValue{
    return self;
}

+ (NSString *)nonEmptyString:(id)obj {
    return GSLNonEmptyString(obj);
}

- (BOOL)isContentString:(NSString *)string {
    return [GSLNonEmptyString(self) rangeOfString:GSLNonEmptyString(string)].location != NSNotFound;
}

- (BOOL)hasPrefixWithString:(NSString *)string {
    return ([GSLNonEmptyString(self) hasPrefix:GSLNonEmptyString(string)] && GSLIsStringWithAnyText(string));
}

- (BOOL)hasSuffixWithString:(NSString *)string {
    return ([GSLNonEmptyString(self) hasSuffix:GSLNonEmptyString(string)] && GSLIsStringWithAnyText(string));
}

///////////////////////////////////////////////////////////////////////////////////////////////////
- (BOOL)isWhitespaceAndNewlines {
    NSCharacterSet* whitespace = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    for (NSInteger i = 0; i < self.length; ++i) {
        unichar c = [self characterAtIndex:i];
        if (![whitespace characterIsMember:c]) {
            return NO;
        }
    }
    return YES;
}

///////////////////////////////////////////////////////////////////////////////////////////////////
+ (NSString *)URLWithString:(NSString *)URLString relativeToURL:(NSString *)baseURL{
    if (URLString == nil) {
        return nil;
    }
    return [[NSURL URLWithString:URLString relativeToURL:[NSURL URLWithString:baseURL]] absoluteString];
}

///////////////////////////////////////////////////////////////////////////////////////////////////
- (NSDictionary*)queryContentsUsingEncoding:(NSStringEncoding)encoding {
    NSCharacterSet* delimiterSet = [NSCharacterSet characterSetWithCharactersInString:@"&;"];
    NSMutableDictionary* pairs = [NSMutableDictionary dictionary];
    NSScanner* scanner = [[NSScanner alloc] initWithString:self];
    while (![scanner isAtEnd]) {
        NSString* pairString = nil;
        [scanner scanUpToCharactersFromSet:delimiterSet intoString:&pairString];
        [scanner scanCharactersFromSet:delimiterSet intoString:NULL];
        NSArray* kvPair = [pairString componentsSeparatedByString:@"="];
        if (kvPair.count == 1 || kvPair.count == 2) {
            NSString *key = [[kvPair objectAtIndex:0] stringByRemovingPercentEncoding];
            NSMutableArray* values = [pairs objectForKey:key];
            if (nil == values) {
                values = [NSMutableArray array];
                [pairs setObject:values forKey:key];
            }
            if (kvPair.count == 1) {
                [values addObject:[NSNull null]];
                
            } else if (kvPair.count == 2) {
                NSString *value = [[kvPair objectAtIndex:1] stringByRemovingPercentEncoding];
                [values addObject:value];
            }
        }
    }
    return [NSDictionary dictionaryWithDictionary:pairs];
}

///////////////////////////////////////////////////////////////////////////////////////////////////
- (NSString*)stringByAddingQueryDictionary:(NSDictionary*)query {
    NSMutableArray* pairs = [NSMutableArray array];
    for (NSString* key in [query keyEnumerator]) {
        NSString* value = [query objectForKey:key];
        value = [value stringByReplacingOccurrencesOfString:@"?" withString:@"%3F"];
        value = [value stringByReplacingOccurrencesOfString:@"=" withString:@"%3D"];
        NSString* pair = [NSString stringWithFormat:@"%@=%@", key, value];
        [pairs addObject:pair];
    }
    
    NSString* params = [pairs componentsJoinedByString:@"&"];
    if ([self rangeOfString:@"?"].location == NSNotFound) {
        return [self stringByAppendingFormat:@"?%@", params];
        
    } else {
        return [self stringByAppendingFormat:@"&%@", params];
    }
}

///////////////////////////////////////////////////////////////////////////////////////////////////
- (NSString*)stringByAddingURLEncodedQueryDictionary:(NSDictionary*)query {
    NSMutableDictionary* encodedQuery = [NSMutableDictionary dictionaryWithCapacity:[query count]];
    
    for (__strong NSString* key in [query keyEnumerator]) {
        NSParameterAssert([key respondsToSelector:@selector(urlEncoded)]);
        NSString* value = [query objectForKey:key];
        NSParameterAssert([value respondsToSelector:@selector(urlEncoded)]);
        value = [value urlEncoded];
        key = [key urlEncoded];
        [encodedQuery setValue:value forKey:key];
    }
    
    return [self stringByAddingQueryDictionary:encodedQuery];
}

///////////////////////////////////////////////////////////////////////////////////////////////////
- (NSString *)urlEncoded {
    /* 此处方法被替换掉，由于部分字符串仍会被转义(如：冒号、斜杠)
     CFStringRef cfUrlEncodedString = CFURLCreateStringByAddingPercentEscapes(NULL,
     (CFStringRef)self,NULL,
     (CFStringRef)@"!#$%&'()*+,/:;=?@[]",
     kCFStringEncodingUTF8);
     
     NSString *urlEncoded = [NSString stringWithString:(__bridge NSString *)cfUrlEncodedString];
     CFRelease(cfUrlEncodedString);
     return urlEncoded;*/
    
    NSCharacterSet *characterSet = [NSCharacterSet URLQueryAllowedCharacterSet];
    NSString *encodeString = [self stringByAddingPercentEncodingWithAllowedCharacters:characterSet];
    
    return encodeString;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (NSString*)md5Hash {
    return [[self dataUsingEncoding:NSUTF8StringEncoding] md5Hash];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (NSString*)sha1Hash {
    return [[self dataUsingEncoding:NSUTF8StringEncoding] sha1Hash];
}

@end
