//
//  UIWindow+GSLAddition.m
//  GSLKit
//
//  Created by wangtong on 2019/6/14.
//  Copyright © 2019 wangtong. All rights reserved.
//

#import "UIWindow+GSLAddition.h"

@implementation UIWindow (GSLAddition)

+ (void)showWarming:(NSString *)warming duration:(float)duration {
    UILabel *label = [[UILabel alloc] init];
    [label setText:warming];
    [label sizeToFit];
    [label setTextColor:[UIColor whiteColor]];
    [label setFont:[UIFont systemFontOfSize:17]];
    
    UIView *warmingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(label.frame) + 20, CGRectGetHeight(label.frame) + 20)];
    [warmingView setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.5]];
    [warmingView addSubview:label];
    [label setCenter:CGPointMake(CGRectGetWidth(warmingView.frame) / 2.0, CGRectGetHeight(warmingView.frame) / 2.0)];
    [warmingView setAlpha:3.0];
    
    [[UIApplication sharedApplication].keyWindow addSubview:warmingView];
    [warmingView setCenter:CGPointMake([UIApplication sharedApplication].keyWindow.center.x, [UIApplication sharedApplication].keyWindow.center.y - 40)];
    
    [UIView animateWithDuration:0.3 animations:^{
        [warmingView setAlpha:1.0];
    } completion:^(BOOL finished) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(duration * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            dispatch_async(dispatch_get_main_queue(), ^{
                [UIView animateWithDuration:0.3 animations:^{
                    [warmingView setAlpha:0.3];
                } completion:^(BOOL finished) {
                    [warmingView removeFromSuperview];
                }];
            });
        });
    }];
    
    
}

@end
