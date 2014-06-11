//
//  MDURLRequest.swift
//  MDNetworking
//
//  Created by Zane Swafford on 6/10/14.
//  Made with love in Kansas
//

import Cocoa

class MDURLRequest: NSMutableURLRequest {
    class func requestWithURL(url:id, andHTTPCode httpCode:MDHTTPCode) -> (MDURLRequest) {
        req = MDURLRequest()
        
        if url is MDURL || url is NSURL {
            req = MDURLRequest.requestWithURL(url)
        } else if url is String {
            req = MDURLReques.requestWithURL(MDURL(url))
        }
        
        if httpCode {
            req.HTTPMethod = MDNetworking.stringForMDHTTPCode(httpCode)
        }
        
        return req
    }
    
    class func requestWithURL(url:id, andHTTPCode httpCode:MDHTTPCode, andUsername username:String, andPassword password:String) -> (MDURLRequest) {
        req = MDURLRequest()
        
        if url is MDURL || url is NSURL {
            req = MDURLRequest.requestWithURL(url)
        } else if url is String {
            req = MDURLRequest.requestWithURL(MDURL.URLWithString(url))
        }
        
        if httpCode {
            req.HTTPMethod = MDNetworking.stringForMDHTTPCode(httpCode)
        }
        
        basicAuthString = username + ":" + password
        data = basicAuthString.dataUsingEncoding(NSUTF8StringEncoding)
        base64String = data.base64EncodedStringWithOptions(0)
        authString = "Basic " + base64String
        
        req.addValue("application/json", forHTTPHeaderField:"Content-Type")
        req.addValue("application/json", forHTTPHeaderField:"Accept")
        req.addValue(authString, forHTTPHeaderField:"Authorization")
        
        return req
    }
    
    func startAsynchWithSuccess(completion:(NSURLResponse, NSData, NSError)->()) {
        NSURLConnection.sendAsynchronousRequest(self, queue:NSOperationQueue.mainQueue, completionHandler:completion)
    }

}
