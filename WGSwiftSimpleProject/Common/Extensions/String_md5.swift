//
//  File.swift
//  WGSwiftSimpleProject
//
//  Created by wanggang on 2019/6/19.
//  Copyright © 2019 wg. All rights reserved.
//

import Foundation
import CommonCrypto

extension String{
    
    func md5() -> String {
        
        let cStr = self.cString(using: String.Encoding.utf8)
        let buffer = UnsafeMutablePointer<UInt8>.allocate(capacity: 16)
        CC_MD5(cStr!,(CC_LONG)(strlen(cStr!)), buffer)
        let md5String = NSMutableString();
        for i in 0 ..< 16{
            md5String.appendFormat("%02x", buffer[i])
        }
        free(buffer)
        return md5String as String
    }
}
