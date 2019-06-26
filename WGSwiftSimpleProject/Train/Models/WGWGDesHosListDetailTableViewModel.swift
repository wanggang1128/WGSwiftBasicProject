//
//  WGWGDesHosListDetailTableViewModel.swift
//  WGSwiftSimpleProject
//
//  Created by wanggang on 2019/6/26.
//  Copyright © 2019 wg. All rights reserved.
//

import UIKit

class WGWGDesHosListDetailTableViewModel: NSObject {

    
    @objc var imgUrl: String = ""
    //名称
    @objc var name: String = ""
    //浏览量 readNum
    @objc var browseNum: String = ""
    //原始价格
    @objc var price: String = ""
    //折扣价格
    @objc var discountPrice: String = ""
    @objc var systemDate: String = ""
    //折扣截止时间  remainTime
    @objc var remainTime: String = ""
    //app会根据这个类型跳转到新的课程详情，还是老的课程详情 1-个人  2-医院 3-后台
    @objc var courseType: String = ""
    //系统类型 1：宣教 2：培训
    @objc var systemType: String = ""
    //分类类型
    @objc var classifyKey: String = ""
    //分类名称
    @objc var classifyName: String = ""
    //id
    @objc var courseId: String = ""
    @objc var useNum: String = ""
    //是否打折
    @objc var isDiscount = false
    @objc var version: String = ""
    //卖家头像
    @objc var sellerImage: String = ""
    //卖家
    @objc var seller: String = ""
    //1:个人 2：医院  3：专家
    @objc var sellerKind: String = ""
    @objc var hospitalName: String = ""
    //多少人学过
    @objc var courseUseNum: String = ""
    @objc var nurseReadNum: String = ""
    //课程类型 1：宣教--医院提交 2：我的医院课程 3：宣教--个人提交 4：培训--医院提交 5： 护士培训专家课程
    @objc var classType: String = ""
    
    //属性名字和后台返回字段不一致
    override static func mj_replacedKeyFromPropertyName() -> [AnyHashable : Any]! {
        
        return ["imgUrl": "bookImage",
                "courseType": "uploadType",
                "courseId" : "classId",
                "browseNum" : "nurseReadNum",
                "useNum" : "courseUseNum",
                "price" : "priceNormal",
                "discountPrice" : "startingPrice",
                "remainTime" : "startingPriceEndDate",
                "sellerImage" : "nurseTrainExpertAvatarFileId",
                "seller" : "nurseTrainExpertName",
                "sellerKind" : "uploadType"
        ]
    }
}
