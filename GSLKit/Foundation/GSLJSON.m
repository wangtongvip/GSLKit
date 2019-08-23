//
//  GSLJSON.m
//  GSLKit
//
//  Created by wangtong on 2019/5/30.
//  Copyright © 2019 wangtong. All rights reserved.
//

#import "GSLJSON.h"
#import "GSLUtilities.h"

@implementation GSLJSON

/*
 *  dictionary串转json
 */
NSString * JsonStringWithDictionary(NSDictionary *dictionary) {
    if ([dictionary isKindOfClass:[NSDictionary class]]) {
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dictionary options:0 error:nil];
        NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
        return jsonString;
    } else {
        //NSLog(@"GSLJSON josn解析传入数据错误 JsonStringWithDictionary");
        return @"";
    }
}


/*
 *  array转json
 */
NSString * JsonStringWithArray(NSArray *array) {
    if ([array isKindOfClass:[NSArray class]]) {
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:array options:0 error:nil];
        NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
        return jsonString;
    } else {
        //NSLog(@"GSLJSON josn解析传入数据错误 JsonStringWithDictionary");
        return @"";
    }
}

/*
 *  array或dictionary转json
 */
NSString * JsonStringWithObject(id object) {
    if ([object isKindOfClass:[NSArray class]]) {
        return JsonStringWithArray(object);
    }
    if ([object isKindOfClass:[NSDictionary class]]) {
        return JsonStringWithDictionary(object);
    }
    //NSLog(@"GSLJSON josn解析传入数据错误 JsonStringWithObject");
    return [NSString stringWithFormat:@"%@",object];
}

/*
 *  json串转dictionary
 */
NSDictionary * DictionaryWithJsonString(NSString *jsonString) {
    if (!GSLIsStringWithAnyText(jsonString)) {
        //NSLog(@"GSLJSON josn解析传入数据为nil或空串 DictionaryWithJsonString");
        return [NSDictionary dictionary];
    }
    
    jsonString = RemoveUnescapedCharacter(jsonString);
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableContainers
                                                          error:&err];
    if(err) {
        //NSLog(@"json解析失败：%@",err);
        //NSLog(@"源JSON串：%@",jsonString);
        return nil;
    }
    
    
    
    return WashToString(dic);
}

/*
 *  json串转array
 */
NSArray * ArrayWithJsonString(NSString *jsonString) {
    if (!GSLIsStringWithAnyText(jsonString)) {
        //NSLog(@"GSLJSON josn解析传入数据为nil或空串 DictionaryWithJsonString");
        return [NSArray array];
    }
    
    jsonString = RemoveUnescapedCharacter(jsonString);
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSArray *array = [NSJSONSerialization JSONObjectWithData:jsonData
                                                     options:NSJSONReadingMutableContainers
                                                       error:&err];
    if(err) {
        //NSLog(@"json解析失败：%@",err);
        //NSLog(@"源JSON串：%@",jsonString);
        return nil;
    }
    return WashToString(array);
}

/*
 *  json串转array或dictionary
 */
id ObjectWithJsonString(NSString *jsonString) {
    if (!GSLIsStringWithAnyText(jsonString)) {
        //NSLog(@"GSLJSON josn解析传入数据为nil或空串 ObjectWithJsonString");
        return [NSArray array];
    }
    
    jsonString = RemoveUnescapedCharacter(jsonString);
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    id objcet = [NSJSONSerialization JSONObjectWithData:jsonData
                                                options:NSJSONReadingMutableContainers
                                                  error:&err];
    if(err) {
        //NSLog(@"json解析失败：%@",err);
        //NSLog(@"源JSON串：%@",jsonString);
        return nil;
    }
    return WashToString(objcet);
}


NSString * RemoveUnescapedCharacter(NSString *inputStr) {
    NSCharacterSet *controlChars = [NSCharacterSet controlCharacterSet];
    //获取那些特殊字符
    NSRange range = [inputStr rangeOfCharacterFromSet:controlChars];
    //寻找字符串中有没有这些特殊字符
    if (range.location != NSNotFound) {
        NSMutableString *mutable = [NSMutableString stringWithString:inputStr];
        while (range.location != NSNotFound) {
            [mutable deleteCharactersInRange:range];
            //去掉这些特殊字符
            range = [mutable rangeOfCharacterFromSet:controlChars];
        }
        return mutable;
    }
    return inputStr;
}

id WashToString(id obj) {
    if ([obj isKindOfClass:[NSDictionary class]]) {
        NSMutableDictionary *dic = [NSMutableDictionary dictionary];
        NSInteger tempCount = [(NSDictionary *)obj allKeys].count;
        NSArray *array = [(NSDictionary *)obj allKeys];
        for (int i = 0; i < tempCount; i++) {
            if ([[(NSDictionary *)obj objectForKey:array[i]] isKindOfClass:[NSDictionary class]]
                || [[(NSDictionary *)obj objectForKey:array[i]] isKindOfClass:[NSArray class]]) {
                [dic setObject:WashToString([(NSDictionary *)obj objectForKey:array[i]]) forKey:array[i]];
            } else if ([[(NSDictionary *)obj objectForKey:array[i]] isKindOfClass:[NSNumber class]]) {
                [dic setObject:[NSString stringWithFormat:@"%@", [(NSNumber *)[(NSDictionary *)obj objectForKey:array[i]] stringValue]] forKey:array[i]];
            } else {
                [dic setObject:[(NSDictionary *)obj objectForKey:array[i]] forKey:array[i]];
            }
        }
        return dic;
    } else if ([obj isKindOfClass:[NSArray class]]) {
        NSMutableArray *array = [NSMutableArray array];
        NSInteger tempCount = [(NSArray *)obj count];
        for (int i = 0; i < tempCount; i++) {
            if ([[(NSArray *)obj objectAtIndex:i] isKindOfClass:[NSArray class]]
                || [[(NSArray *)obj objectAtIndex:i] isKindOfClass:[NSDictionary class]]) {
                [array addObject:WashToString([(NSArray *)obj objectAtIndex:i])];
            } else if ([[(NSArray *)obj objectAtIndex:i] isKindOfClass:[NSNumber class]]) {
                [array addObject:[NSString stringWithFormat:@"%@", [(NSNumber *)[(NSArray *)obj objectAtIndex:i] stringValue]]];
            } else {
                [array addObject:[(NSArray *)obj objectAtIndex:i]];
            }
        }
        return array;
    }
    
    return obj;
}

@end
