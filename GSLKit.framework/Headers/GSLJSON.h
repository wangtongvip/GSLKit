//
//  GSLJSON.h
//  GSLKit
//
//  Created by wangtong on 2019/5/30.
//  Copyright © 2019 wangtong. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface GSLJSON : NSObject

/*
 *  dictionary串转json
 */
NSString * JsonStringWithDictionary(NSDictionary *dictionary);

/*
 *  array转json
 */
NSString * JsonStringWithArray(NSArray *array);

/*
 *  array或dictionary转json
 */
NSString * JsonStringWithObject(id object);

/*
 *  json串转dictionary
 */
NSDictionary * DictionaryWithJsonString(NSString *jsonString);

/*
 *  json串转array
 */
NSArray * ArrayWithJsonString(NSString *jsonString);

/*
 *  json串转array或dictionary
 */
id ObjectWithJsonString(NSString *jsonString);



@end

NS_ASSUME_NONNULL_END
