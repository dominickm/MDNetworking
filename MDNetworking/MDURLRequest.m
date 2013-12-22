//
//  MDURLRequest.m
//  MDNetworking
//
//  Created by Michael on 12/17/13.
//  Copyright (c) 2013 fingertiptech. All rights reserved.
//

#import "MDURLRequest.h"
#import "MDURL.h"

@implementation MDURLRequest

#pragma mark Inits

+ (MDURLRequest *)requestWithURL:(id)url andHTTPType :(NSString *)httpType
{
    MDURLRequest* req = [[MDURLRequest alloc] init];
    
    if ([url isKindOfClass:[MDURLRequest class]])
    {
        req = [MDURLRequest requestWithURL:url];
    }
    else if ([url isKindOfClass:[NSString class]])
    {
        req = [MDURLRequest requestWithURL:[MDURL URLWithString:url]];
    }
    
    if (httpType)
    {
        req.HTTPMethod = httpType;
    }
    
    return req;
}

// Init with HTTP Auth

+ (MDURLRequest *)requestWithURL:(id)url HTTPType:(NSString *)httpType Username:(NSString *)username andPassword:(NSString *)password
{
    MDURLRequest* req = [[MDURLRequest alloc] init];
    
    if ([url isKindOfClass:[MDURLRequest class]])
    {
        req = [MDURLRequest requestWithURL:url];
    }
    else if ([url isKindOfClass:[NSString class]])
    {
        req = [MDURLRequest requestWithURL:[MDURL URLWithString:url]];
    }
    
    if (httpType)
    {
        req.HTTPMethod = httpType;
    }
    
    NSString* basicAuthString = [NSString stringWithFormat:@"%@:%@", username, password];
    [req setValue:basicAuthString forHTTPHeaderField:@"Authorization"];
    
    return req;
}

- (void)startAsynchWithSuccess:(void (^)(NSURLResponse*, NSData*, NSError* ))completition
{
    [NSURLConnection sendAsynchronousRequest:self queue:[NSOperationQueue mainQueue] completionHandler:completition];
}


@end

