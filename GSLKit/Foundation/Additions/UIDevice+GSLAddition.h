//
//  UIDevice+GSLAddition.h
//  GSLKit
//
//  Created by wangtong on 2019/5/31.
//  Copyright © 2019 wangtong. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIDevice (GSLAddition)

/*!
 @method
 @abstract      获取手机型号
 @discussion    获取手机型号
 */
+ (NSString *)deviceModel;

/*!
 @method
 @abstract      获取mac地址
 @discussion    获取mac地址
 */
+ (NSString *)macAddress;

/*!
 @method
 @abstract   获得设备IMEI
 @discussion 获得设备IMEI
 @return     返回设备IMEI
 */
+ (NSString *)uniqueDeviceIMEI;

/**
 *  手机序列号
 *
 *  @return 手机序列号
 */
+ (NSString *)uniqueIdentifier;

/*!
 @method
 @abstract      获取一个应用程序的唯一标识符
 @discussion    使用MAc地址和bundleIdentifier进行MD5加密
 */
+ (NSString *)uniqueDeviceIdentifier;

/*!
 @method
 @abstract      获取设备的唯一标识符
 @discussion    使用MAc地址进行MD5加密
 */
+ (NSString *)uniqueGlobalDeviceIdentifier;

/*!
 @method
 @abstract      获取屏幕尺寸宽度
 @discussion    获取屏幕尺寸宽度
 */
+ (CGFloat)screenWidth;

/*!
 @method
 @abstract      获取屏幕尺寸高度
 @discussion    获取屏幕尺寸高度
 */
+ (CGFloat)screenHeight;

/*!
 @method
 @abstract      获取屏幕尺寸
 @discussion    获取屏幕尺寸
 */
+ (CGSize)screenSize;

/*!
 @method
 @abstract      获取屏幕宽度分辨率
 @discussion    获取屏幕宽度分辨率
 */
+ (CGFloat)screenResolutionWidth;

/*!
 @method
 @abstract      获取屏幕高度分辨率
 @discussion    获取屏幕高度分辨率
 */
+ (CGFloat)screenResolutionHeight;

/*!
 @method
 @abstract      获取屏幕分辨率尺寸
 @discussion    获取屏幕分辨率尺寸
 */
+ (CGSize)screenResolutionSize;

/**
 *  获取运营商名称
 *
 *  @return 运营商名称
 */
+ (NSString *)carrierName;

/**
 *  获取网络状态
 *
 *  @return 网络状态
 */
+ (NSString *)getNetWorkStates;

/**
 *  手机别名： 用户定义的名称
 *
 *  @return 手机别名： 用户定义的名称
 */
+ (NSString *)deviceName;

/**
 *  设备系统名称
 *
 *  @return 设备系统名称
 */
+ (NSString *)systemName;

/**
 *  手机系统版本
 *
 *  @return 手机系统版本
 */
+ (NSString *)systemVersion;

/**
 *  当前应用名称
 *
 *  @return 当前应用名称
 */
+ (NSString *)bundleDisplayName;

/**
 *  当前应用软件版本
 *
 *  @return 当前应用软件版本
 */
+ (NSString *)bundleShortVersionString;

/**
 *  设备唯一标识
 *
 *  @return 设备唯一标识
 */
+ (NSString *)deviceUniqueIdentifier;

/*!
 * get device ip address
 */
+ (NSString *)deviceIPAdress;

/**
 *  获取当前wifi的ip地址
 *
 *  @return ip地址
 */
+ (NSString *)localWiFiIPAddress;

/**
 *  设备版本
 *
 *  @return 设备的型号
 */
+ (NSString*)deviceVersion;

@end

NS_ASSUME_NONNULL_END
