//
//  UIButton_UI.swift
//  WGSwiftSimpleProject
//
//  Created by wanggang on 2019/6/24.
//  Copyright © 2019 wg. All rights reserved.
//

import Foundation


class WGCreateUI: NSObject {
    
    //创建UIButton
    class func createBtn(frame:CGRect?, title:String?, titleColor: UIColor?, font: UIFont?, backGroundColor:UIColor?, textAliment: NSTextAlignment?) -> UIButton {
        
        let btn = UIButton(type: .custom)
        btn.frame = frame ?? CGRect(x: 0, y: 0, width: 0, height: 0)
        btn .setTitle(title, for: .normal)
        btn.setTitleColor(titleColor, for: .normal)
        btn.titleLabel?.font = font
        btn.backgroundColor = backGroundColor
        btn.titleLabel?.textAlignment = textAliment ?? NSTextAlignment.center
        
        return btn
    }
}
