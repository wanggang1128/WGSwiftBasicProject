//
//  WGDescovHospitalListModel.swift
//  WGSwiftSimpleProject
//
//  Created by wanggang on 2019/6/21.
//  Copyright © 2019 wg. All rights reserved.
//

import UIKit

class WGDescovHospitalListModel: NSObject {

    @objc var coverPage: String?
    @objc var email: String?
    //医院logo（专家头像）
    @objc var headPortrait: String?
    @objc var information: String?
    //医院（专家）名称
    @objc var name: String?
    @objc var position: String?
    @objc var title: String?
    @objc var answerCnt = 0
    //课程数量
    @objc var courseCnt = 0
    @objc var fanCntReal = 0
    @objc var fanCntShift = 0
    //医院（专家）
    @objc var ID: String?
    @objc var isRecommend = 0
    @objc var isZhongwei = 0
    @objc var mobile = 0
    @objc var tradeSum = 0
    @objc var unAnswerCnt = 0
    
    //属性名字和后台返回字段不一致
    override static func mj_replacedKeyFromPropertyName() -> [AnyHashable : Any]! {
        
        return ["ID":"id"]
    }
}
