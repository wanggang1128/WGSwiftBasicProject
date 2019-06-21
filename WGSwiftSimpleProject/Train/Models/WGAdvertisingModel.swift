//
//  WGAdvertisingModel.swift
//  WGSwiftSimpleProject
//
//  Created by wanggang on 2019/6/21.
//  Copyright © 2019 wg. All rights reserved.
//

import UIKit

class WGAdvertisingModel: NSObject {

    @objc var adUrl: URL?
    @objc var createTime: String?
    @objc var hospitalNames: String?
    @objc var ID: String?
    @objc var imageId: String?
    @objc var title: String?
    //准备跳转的页面id
    @objc var content: String?
    //为3时跳转指定原生页面
    @objc var contentType: String?
    //图片地址
    @objc var cover: String?
    
    //属性名字和后台返回字段不一致
    override static func mj_replacedKeyFromPropertyName() -> [AnyHashable : Any]! {
        
        return ["ID":"id"]
    }
}
