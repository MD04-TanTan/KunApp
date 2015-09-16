//
//  NSString+Hash.h
//  KulSDK
//
//  Created by Nguyen Minh Phuong on 7/18/14.
//  Copyright (c) 2014 phuongnm. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (KulEncription)

- (NSString *)kulMd5String;
- (NSString *)kulSha256String;
- (NSString *)kulHMACStringWithKey:(NSString *)key;

@end
