//
//  MDURLRequest.m
//  MDNetworking
//
//  Created by Michael on 12/17/13.
//  Copyright (c) 2013 fingertiptech. All rights reserved.
//

#import "MDURLRequest.h"
#import "MDURL.h"
#import "MDNetworking.h"

@implementation MDURLRequest

#pragma mark Inits

+ (MDURLRequest *)requestWithURL:(id)url andHTTPCode:(MDHTTPCode)httpCode
{
    MDURLRequest* req = [[MDURLRequest alloc] init];
    
    if ([url isKindOfClass:[MDURLRequest class]]
        || [url isKindOfClass:[NSURL class]])
    {
        req = [MDURLRequest requestWithURL:url];
    }
    else if ([url isKindOfClass:[NSString class]])
    {
        req = [MDURLRequest requestWithURL:[MDURL URLWithString:url]];
    }
    
    if (httpCode)
    {
        req.HTTPMethod = [MDNetworking stringForMDHTTPCode:httpCode];
    }
    
    return req;
}

// Init with HTTP Auth

+ (MDURLRequest *)requestWithURL:(id)url HTTPCode:(MDHTTPCode)httpCode Username:(NSString *)username andPassword:(NSString *)password
{
    MDURLRequest* req = [[MDURLRequest alloc] init];
    
    if ([url isKindOfClass:[MDURL class]])
    {
        req = [MDURLRequest requestWithURL:url];
    }
    else if ([url isKindOfClass:[NSString class]])
    {
        req = [MDURLRequest requestWithURL:[MDURL URLWithString:url]];
    }
    
    if (httpCode)
    {
        req.HTTPMethod = [MDNetworking stringForMDHTTPCode:httpCode];
    }
    
    NSString* basicAuthString = [NSString stringWithFormat:@"%@:%@", username, password];
    NSData* data = [basicAuthString dataUsingEncoding:NSUTF8StringEncoding];
    NSString* base64String = [data base64EncodedStringWithOptions:0];
    NSString* authString = [NSString stringWithFormat:@"Basic %@", base64String];
    [req addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [req addValue:authString forHTTPHeaderField:@"Authorization"];
    [req addValue:@"application/json" forHTTPHeaderField:@"Accept"];
    
    return req;
}

- (void)startAsynchWithSuccess:(void (^)(NSURLResponse*, NSData*, NSError* ))completition
{
    [NSURLConnection sendAsynchronousRequest:self queue:[NSOperationQueue mainQueue] completionHandler:completition];
}

#pragma mark Post Values

- (void)appendingPostValues:(NSDictionary *)postValues
{
    NSString* paramsString = [[NSString alloc] init];
    for (int i = 0; i < [postValues.allKeys count]; i++)
    {
        if (i == 0)
        {
            paramsString = [NSString stringWithFormat:@"%@=%@", postValues.allKeys[i], [postValues objectForKey:postValues.allKeys[i]]];
        }
        else
        {
            NSString* paramToAdd = [NSString stringWithFormat:@"&%@=%@", postValues.allKeys[i], [postValues objectForKey:postValues.allKeys[i]]];
            paramsString = [paramsString stringByAppendingString:paramToAdd];
        }
    }
    [self setHTTPBody:[paramsString dataUsingEncoding:NSUTF8StringEncoding]];
}


@end

