//
//  WGSegmentView.swift
//  WGSwiftSimpleProject
//
//  Created by wanggang on 2019/6/24.
//  Copyright © 2019 wg. All rights reserved.
//

import UIKit

class WGSegmentView: UIView {

    var dataArr:[Any]?{
        
        didSet{
            
            createView()
        }
    }
    
    var BtnClickBlock:((Int)->Void)?

    func createView() {
        
        self.clearViews()
        
        let itemWith:CGFloat = 100
        
        let width = Int(self.width) - (dataArr?.count)! * Int(itemWith)
        let margin = CGFloat(width / ((dataArr?.count)! + 1))
        
        for i in 0..<(dataArr?.count)! {
            
            let btn = WGCreateUI.createBtn(frame: CGRect(x: margin + CGFloat(i) * (itemWith + margin), y: 0, width: itemWith, height: self.height), title: (dataArr?[i] as! String), titleColor: UIColor.black, font: UIFont.systemFont(ofSize: 12), backGroundColor: UIColor.white, textAliment: .center)
            btn.tag = i+1
            btn.addTarget(self, action: #selector(btnClicked(sender:)), for: .touchUpInside)
            self.addSubview(btn)
            
            let lineView = UIView(frame: CGRect(x: margin + CGFloat(i) * (itemWith + margin), y: self.height-2, width: itemWith, height: 2))
            lineView.tag = i*10+100
            self.addSubview(lineView)
            
            if i == 0{
                btn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
                btn.setTitleColor(UIColor.blue, for: .normal)
                lineView.backgroundColor = UIColor.blue
            }
        }
    }
    
    
    @objc func btnClicked(sender: UIButton) {
        
        let btn = sender as UIButton
        if nil != BtnClickBlock {
            BtnClickBlock!(btn.tag-1)
        }
        chageStatus(tag: btn.tag)
    }
    
    func chageStatus(tag:Int) {
        
        for subView in self.subviews {
            
            if subView is UIButton{
                
                let btn = subView as! UIButton
                if subView.tag != tag{
                    
                    btn.setTitleColor(UIColor.black, for: .normal)
                    btn.titleLabel?.font = UIFont.systemFont(ofSize: 12)
                }else{
                    btn.setTitleColor(UIColor.blue, for: .normal)
                    btn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
                }
            }
            
            for subView in self.subviews {
                
                if subView.tag == (tag-1)*10+100{
                    //下划线
                    subView.backgroundColor = UIColor.blue
                }else{
                    subView.backgroundColor = UIColor.white
                }
            }
        }
    }
}
