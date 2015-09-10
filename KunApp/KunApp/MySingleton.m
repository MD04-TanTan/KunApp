//
//  MySingleton.m
//  KunApp
//
//  Created by Tan Tan on 9/9/15.
//  Copyright (c) 2015 Tan Tan. All rights reserved.
//

#import "MySingleton.h"

@implementation MySingleton
@synthesize kulUsers,kulUsersDict;

+ (id)getInstance{
    static MySingleton *instance;
    static dispatch_once_t predicate = 0;
    dispatch_once(&predicate, ^{
        instance = [[MySingleton alloc]init];
//        instance.kulUsers = [[NSMutableArray alloc] init];
    });
    return instance;
    
}

- (id)init {
    if (self = [super init]) {
        kulUsers = [[NSMutableArray alloc] init];
        kulUsersDict = [[NSMutableDictionary alloc] init];
        [kulUsersDict setObject:kulUsers forKey:@"KulUser"];
    }
    return self;
}
//- (void)setKulUsers:(NSMutableArray *)theKulUsers
//{
//    if (kulUsers) {
//        kulUsers = theKulUsers;
//    }
//}

@end
