//
//  MDURLRequest.m
//  MDNetworking
//
//  Created by Michael on 12/17/13.
//  Copyright (c) 2013 fingertiptech. All rights reserved.
//

#import "MDURLRequest.h"

@implementation MDURLRequest

- (void)startAsynchWithSuccess:(void (^)(NSURLResponse*, NSData*, NSError* ))completition
{
    [NSURLConnection sendAsynchronousRequest:self queue:[NSOperationQueue mainQueue] completionHandler:completition];
}

@end

