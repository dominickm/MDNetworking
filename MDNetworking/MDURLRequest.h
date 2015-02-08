//
//  MDURLRequest.h
//  MDNetworking
//
//  Created by Michael on 12/17/13.
//  Copyright (c) 2013 fingertiptech. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MDNetworking.h"

@interface MDURLRequest : NSMutableURLRequest

+ (MDURLRequest *)requestWithURL:(id)url andHTTPCode:(MDHTTPCode)httpCode;

+ (MDURLRequest *)requestWithURL:(id)url HTTPCode:(MDHTTPCode)httpCode Username:(NSString *)username andPassword:(NSString *)password;

- (void)startAsynchWithSuccess:(void (^)(NSURLResponse* response, NSData* data, NSError* connectionError))completition;

- (void)appendingPostValues:(NSDictionary *)postValues;

@end
