//
//  MDNetworking.m
//  MDNetworking
//
//  Created by Michael on 12/17/13.
//  Copyright (c) 2013 fingertiptech. All rights reserved.
//

#import "MDNetworking.h"

#define MDNETWORKING_HTTP_POST @"POST"
#define MDNETWORKING_HTTP_GET @"GET"
#define MDNETWORKING_HTTP_PUT @"PUT"
#define MDNETWORKING_HTTP_DELETE @"DELETE"


@implementation MDNetworking

+ (NSString *)stringForMDHTTPCode:(MDHTTPCode)httpCode
{
    NSString* stringCode;
    
    switch (httpCode) {
        case kHTTPGet:
            stringCode = MDNETWORKING_HTTP_GET;
            break;
        case  kHTTPPost:
            stringCode = MDNETWORKING_HTTP_POST;
            break;
        case kHTTPDelete:
            stringCode = MDNETWORKING_HTTP_DELETE;
            break;
        case kHTTPPut:
            stringCode = MDNETWORKING_HTTP_PUT;
            break;
        default:
            break;
    }
    return stringCode;
}

@end
