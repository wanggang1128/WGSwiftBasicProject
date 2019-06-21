//
//  WGDesHospitalHeaderView.swift
//  WGSwiftSimpleProject
//
//  Created by wanggang on 2019/6/21.
//  Copyright © 2019 wg. All rights reserved.
//

import UIKit

let ItemWidth:CGFloat = ScreenWidth
let ItemHeight:CGFloat = IsIphoneX ? 214: 190

class WGDesHospitalHeaderView: UIView {

    //隐式解析可选类型
    var collectionView: UICollectionView!
    var imgDataArr:[WGAdvertisingModel]?
    
    var imgArr: [WGAdvertisingModel]?{
        
        didSet{
            
            self.collectionView.reloadData()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        createView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createView() {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let height:CGFloat = IsIphoneX ? 214: 190
        collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: ScreenWidth, height: height), collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = UIColor.white
        collectionView.isPagingEnabled = true
        collectionView.register(WGAdvertisingCollectionViewCell.self, forCellWithReuseIdentifier: "WGAdvertisingCollectionViewCell")
        self.addSubview(collectionView)
    }
}

extension WGDesHospitalHeaderView: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return imgDataArr?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WGAdvertisingCollectionViewCell", for: indexPath) as! WGAdvertisingCollectionViewCell
        cell.dataModel = imgDataArr?[indexPath.row]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        collectionView.deselectItem(at: indexPath, animated: true)
    }
}

extension WGDesHospitalHeaderView : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: ItemWidth, height: ItemHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
}
