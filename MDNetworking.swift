//
//  MDNetworking.swift
//  MDNetworking
//
//  Created by Zane Swafford on 6/10/14.
//  Made with love in Kansas
//

import Foundation

enum MDHTTPCode:String {
    case kHTTPGet = "GET"
    case kHTTPPost = "POST"
    case kHTTPPut = "PUT"
    case kHTTPDelete = "DELETE"
}

class MDNetworking {
    class func stringForMDHTTPCode(httpCode: MDHTTPCode)->(String) {
        return httpCode.toRaw()
    }
}