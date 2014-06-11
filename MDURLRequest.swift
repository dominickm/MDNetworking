//
//  MDURLRequest.swift
//  MDNetworking
//
//  Created by Zane Swafford on 6/10/14.
//  Made with love in Kansas
//

import Cocoa

class MDURLRequest: NSMutableURLRequest {
    class func requestWithURL(url:MDURL, andHTTPCode httpCode:MDHTTPCode? = nil) -> (MDURLRequest) {
        var req = MDURLRequest(URL: url)
        
        if httpCode {
            req.HTTPMethod = MDNetworking.stringForMDHTTPCode(httpCode!)
        }
        
        return req
    }
    
    class func requestWithURL(url:MDURL, andHTTPCode httpCode:MDHTTPCode? = nil, andUsername username:String, andPassword password:String) -> (MDURLRequest) {
        var req = MDURLRequest(URL: url)
        
        if httpCode {
            req.HTTPMethod = MDNetworking.stringForMDHTTPCode(httpCode!)
        }
        
        var basicAuthString = username + ":" + password
        var data = NSData(data: basicAuthString.dataUsingEncoding(NSUTF8StringEncoding))
        var base64String = data.base64EncodedStringWithOptions(nil)
        var authString = "Basic " + base64String
        
        req.addValue("application/json", forHTTPHeaderField:"Content-Type")
        req.addValue("application/json", forHTTPHeaderField:"Accept")
        req.addValue(authString, forHTTPHeaderField:"Authorization")
        
        return req
    }
    
    func startAsynchWithSuccess(completion:(NSURLResponse?, NSData?, NSError?)->()) {
        NSURLConnection.sendAsynchronousRequest(self, queue:NSOperationQueue.mainQueue(), completionHandler:completion)
    }

}
