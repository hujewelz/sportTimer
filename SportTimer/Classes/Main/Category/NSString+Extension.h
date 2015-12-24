//
//  NSString+Extension.h
//  ModelArea
//
//  Created by mac on 15/8/26.
//  Copyright (c) 2015年 jinhuadiqigan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Extension)

- (CGRect)boundsWithFont:(UIFont *)font size:(CGSize)size;
- (CGSize)hu_sizeWithFont:(UIFont *)font;
- (NSString *)md5String32;
- (NSString *)md5String16;
- (BOOL)stringContainsEmoji;

/**
 *  Unicode string转化为 NSString
 */
- (NSString *)UnicodeStringToString;

/**
 *  NSString 转化为 Unicode string
 */
-(NSString *)stringToUnicodeString;

/**
 *  判断密码是否合法
 */
- (BOOL) validatePassword;
@end
