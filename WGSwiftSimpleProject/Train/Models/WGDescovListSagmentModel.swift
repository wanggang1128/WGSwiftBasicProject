//
//  WGDescovListSagmentModel.swift
//  WGSwiftSimpleProject
//
//  Created by wanggang on 2019/6/26.
//  Copyright © 2019 wg. All rights reserved.
//

import UIKit

class WGDescovListSagmentModel: NSObject {

    @objc var groupId: String?
    @objc var ID: String?
    @objc var code: String?
    @objc var parentId: String?
    @objc var remark: String?
    @objc var type: String?
    @objc var value: String?
    
    //属性名字和后台返回字段不一致
    override static func mj_replacedKeyFromPropertyName() -> [AnyHashable : Any]! {
        
        return ["ID":"id",
                "value":"name"
        ]
    }
}
