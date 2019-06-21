//
//  WGAdvertisingCollectionViewCell.swift
//  WGSwiftSimpleProject
//
//  Created by wanggang on 2019/6/21.
//  Copyright © 2019 wg. All rights reserved.
//

import UIKit

class WGAdvertisingCollectionViewCell: UICollectionViewCell {
    
    let imgView = UIImageView()
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        createView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createView() {
        
        imgView.frame = CGRect(x: 0, y: 0, width: self.width, height: self.height)
        self.contentView.addSubview(imgView)
    }
    
    var dataModel: WGAdvertisingModel? {
        
        didSet{
            loadContent()
        }
    }
    
    func loadContent() {
        
        imgView.sd_setImage(with: URL(string: dataModel!.cover!), placeholderImage: nil, options: .retryFailed, context: nil)
    }
}
