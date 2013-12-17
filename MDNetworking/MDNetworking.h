//
//  MDNetworking.h
//  MDNetworking
//
//  Created by Michael on 12/17/13.
//  Copyright (c) 2013 fingertiptech. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, MDHTTPCode) {
    kHTTPGet,
    kHTTPPost,
    kHTTPPut,
    kHTTPDelete,
};


@interface MDNetworking : NSObject

+ (NSString *)stringForMDHTTPCode:(MDHTTPCode)httpCode;


@end
