//
//  MDURLRequest.h
//  MDNetworking
//
//  Created by Michael on 12/17/13.
//  Copyright (c) 2013 fingertiptech. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MDURLRequest : NSMutableURLRequest

+ (MDURLRequest *)requestWithURL:(id)url andHTTPType:(NSString *)httpType;

- (void)startAsynchWithSuccess:(void (^)(NSURLResponse* response, NSData* data, NSError* connectionError))completition;

@end
