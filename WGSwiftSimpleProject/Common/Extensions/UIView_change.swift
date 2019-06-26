//
//  UIView_change.swift
//  WGSwiftSimpleProject
//
//  Created by wanggang on 2019/6/25.
//  Copyright © 2019 wg. All rights reserved.
//

import Foundation

extension UIView{
    
    //清空删除所有子视图（子元素）
    func clearViews() {
        for v in self.subviews as [UIView] {
            v.removeFromSuperview()
        }
    }
}
