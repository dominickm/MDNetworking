//
//  MDURL.swift
//  MDNetworking
//
//  Created by Zane Swafford on 6/10/14.
//  Made with love in Kansas
//

import Cocoa

class MDURL: NSURL {
    // Extension is a keyword
    class func urlFromExtension(anExtension:String, offOfBase base:String)->(MDURL) {
        return MDURL.URLWithString(base + anExtention)
    }
}
