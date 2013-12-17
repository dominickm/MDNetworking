//
//  MDURL.m
//  MDNetworking
//
//  Created by Michael on 12/17/13.
//  Copyright (c) 2013 fingertiptech. All rights reserved.
//

#import "MDURL.h"

@implementation MDURL

#pragma mark Inits

+ (MDURL *)urlFromExtention:(NSString *)extention offOfBase:(NSString *)base
{
    NSString* fullURLString = [extention stringByAppendingString:base];
    
    return [MDURL URLWithString:fullURLString];
}

@end
