//
//  NSString+MD5.h
//  KunApp
//
//  Created by Tan Tan on 9/16/15.
//  Copyright (c) 2015 Tan Tan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonDigest.h>

@interface NSString (MD5)

- (NSString * ) MD5String;
- (NSString*)sha256HashFor:(NSString*)input;
@end
