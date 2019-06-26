//
//  UIButton_text.swift
//  WGSwiftSimpleProject
//
//  Created by wanggang on 2019/6/26.
//  Copyright © 2019 wg. All rights reserved.
//

import Foundation

extension UIButton{
    
    //设置文字和图片
    @objc func set(image:UIImage?, title: String, titlePosition: UIView.ContentMode, space: CGFloat, state: UIControl.State){
        
        self.setTitle(title, for: state)
        self.setImage(image, for: state)
        
        lableToImage(titlePosition: titlePosition, space: space)
        
    }
    
    //已有文字和图片,直接调整位置
    @objc func lableToImage(titlePosition: UIView.ContentMode, space: CGFloat){
        
        let imageSize = self.imageRect(forContentRect: self.frame)
        let titleFont = self.titleLabel?.font!
        let titleSize = self.titleLabel?.text?.size(withAttributes: [kCTFontAttributeName as NSAttributedString.Key: titleFont!]) ?? CGSize.zero
        
        var titleInsets: UIEdgeInsets
        var imageInsets: UIEdgeInsets
        
        switch titlePosition {
        case .top:
            //标题在上
            titleInsets = UIEdgeInsets(top: -(imageSize.height+titleSize.height+space)/2, left: -imageSize.width, bottom: 0, right: 0)
            imageInsets = UIEdgeInsets(top: (imageSize.height + titleSize.height + space)/2, left: 0, bottom: 0, right: -titleSize.width)
            
        case .left:
            //标题在左
            titleInsets = UIEdgeInsets(top: 0, left: -(imageSize.width*2), bottom: 0, right: 0)
            imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: -(titleSize.width*2+space))
            
        case .bottom:
            //标题在下
            titleInsets = UIEdgeInsets(top: (imageSize.height+titleSize.height+space)/2, left: -imageSize.width, bottom: 0, right: 0)
            imageInsets = UIEdgeInsets(top: -(imageSize.height + titleSize.height + space)/2, left: 0, bottom: 0, right: -titleSize.width)
            
        case .right:
            //标题在右
            titleInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: -space)
            imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            
        default:
            
            titleInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            break
        }
        
        self.titleEdgeInsets = titleInsets
        self.imageEdgeInsets = imageInsets
    }
}
