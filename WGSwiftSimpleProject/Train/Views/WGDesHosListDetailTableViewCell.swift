//
//  WGDesHosListDetailTableViewCell.swift
//  WGSwiftSimpleProject
//
//  Created by wanggang on 2019/6/26.
//  Copyright © 2019 wg. All rights reserved.
//

import UIKit

class WGDesHosListDetailTableViewCell: UITableViewCell {

    let titleLab = UILabel()
    let subTitleLab = UILabel()
    let studyLab = UILabel()
    let imgView = UIImageView()
    let countBtn = UIButton()
    
    var model:WGWGDesHosListDetailTableViewModel?{
        //属性监听
        didSet{
            
            loadContent()
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        createView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createView() {
        
        titleLab.frame = CGRect(x: Common_Margin, y: 5, width: (ScreenWidth-Common_Margin*2)*2/3, height: 30)
        titleLab.textColor = UIColor.black
        titleLab.textAlignment = .left
        titleLab.font = UIFont.systemFont(ofSize: 18)
        self.contentView.addSubview(titleLab)
        
        subTitleLab.frame = CGRect(x: titleLab.left, y: titleLab.bottom, width: titleLab.width, height: 20)
        subTitleLab.textColor = UIColor.lightGray
        subTitleLab.textAlignment = .left
        subTitleLab.font = UIFont.systemFont(ofSize: 15)
        self.contentView.addSubview(subTitleLab)
        
        countBtn.frame = CGRect(x: titleLab.left, y: subTitleLab.bottom, width: 50, height: 30)
        countBtn.setTitleColor(UIColor.red, for: .normal)
        countBtn.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        self.contentView.addSubview(countBtn)
        
        imgView.frame = CGRect(x: ScreenWidth - Common_Margin - (ScreenWidth-Common_Margin*2)/3, y: titleLab.top, width: (ScreenWidth-Common_Margin*2)/3, height: 80)
        self.contentView.addSubview(imgView)
        
        studyLab.frame = CGRect(x: imgView.left-100-10, y: countBtn.top, width: 100, height: 20)
        studyLab.textColor = UIColor.lightGray
        studyLab.textAlignment = .left
        studyLab.font = UIFont.systemFont(ofSize: 15)
        self.contentView.addSubview(studyLab)
        
    }
    
    func loadContent() {
        
        titleLab.text = model!.name
        
        subTitleLab.text = model!.seller
        
        countBtn.set(image: UIImage(named: "newZuanIcon"), title: model!.isDiscount ? model!.discountPrice : model!.price, titlePosition: .right, space: 10, state: .normal)
        
        studyLab.text = model!.nurseReadNum + "人学过"
        
        imgView.sd_setImage(with: URL(string: model!.imgUrl), placeholderImage: UIImage(named: "videoDefault"), options: .retryFailed, completed: nil)
    }
}
