//
//  WGLoginModel.swift
//  WGSwiftSimpleProject
//
//  Created by wanggang on 2019/6/20.
//  Copyright © 2019 wg. All rights reserved.
//

import UIKit

class WGLoginModel: NSObject {

    @objc var name: String?
    @objc var itsId: String?
    //子model嵌套
    @objc var attributesMap: WGLoginAttributesMapModel?
    //子model数组
    @objc var hospitalsList:Array<WGHospitalModel>?
    
    //属性名字和后台返回字段不一致
    override static func mj_replacedKeyFromPropertyName() -> [AnyHashable : Any]! {
        
        return ["itsId":"id"]
    }
    
    //因为有子model数据,需要重写如下方法
    override func mj_keyValuesDidFinishConvertingToObject() {
        if self.hospitalsList != nil {
            
            let list = WGHospitalModel.mj_objectArray(withKeyValuesArray: self.hospitalsList)
            if list != nil {
                self.hospitalsList = list! as NSArray as? [WGHospitalModel]
            }
        }
    }
}

class WGLoginAttributesMapModel: NSObject {
    
    @objc var userDeptIds:String?
    @objc var userGudiceTag:Int = 0
    @objc var yunXinInfor:String?
}

class WGHospitalModel: NSObject {
    
    @objc var bedNum = 0
    @objc var openFlag = false
    @objc var sortOrder:String?
    @objc var satisfaction:String?
    @objc var name:String?
    @objc var nurseAssessFlag:String?
    @objc var followUp:String?
    @objc var nurseTrain:String?
    @objc var inner:String?
    @objc var ID:String?
    
    //属性名字和后台返回字段不一致
    override static func mj_replacedKeyFromPropertyName() -> [AnyHashable : Any]! {
        
        return ["ID":"id"]
    }
}
