//
//  MDURL.h
//  MDNetworking
//
//  Created by Michael on 12/17/13.
//  Copyright (c) 2013 fingertiptech. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MDURL : NSURL

+ (MDURL *)urlFromExtention:(NSString *)extention offOfBase:(NSString *)base;

@end
