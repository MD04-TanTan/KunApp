//
//  MySingleton.h
//  KunApp
//
//  Created by Tan Tan on 9/9/15.
//  Copyright (c) 2015 Tan Tan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MySingleton : NSObject
@property (strong, nonatomic)NSMutableArray * kulUsers;
@property (strong, nonatomic) NSMutableDictionary * kulUsersDict;

+ (id) getInstance;
- (id) init;
@end
