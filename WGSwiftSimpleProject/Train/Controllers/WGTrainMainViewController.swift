//
//  WGTrainMainViewController.swift
//  WGSwiftSimpleProject
//
//  Created by wanggang on 2019/6/20.
//  Copyright © 2019 wg. All rights reserved.
//

import UIKit

let ItemWidth:CGFloat = ScreenWidth
let ItemHeight:CGFloat = IsIphoneX ? 214: 190

class WGTrainMainViewController: UIViewController {

    //非可选类型
    let tableView = UITableView()
    //隐式解析可选类型
    var collectionView: UICollectionView!
    
    var imgDataArr:[WGAdvertisingModel]?
    var tabDataArr = [WGDescovHospitalListModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "培训"
        view.backgroundColor = UIColor.white
        
        createView()
        loadADData()
        loadHOSData()
    }

    func createView() {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let height:CGFloat = IsIphoneX ? 214: 190
        collectionView = UICollectionView(frame: CGRect(x: 0, y: Top_Height, width: ScreenWidth, height: height), collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = UIColor.white
        collectionView.isPagingEnabled = true
        collectionView.register(WGAdvertisingCollectionViewCell.self, forCellWithReuseIdentifier: "WGAdvertisingCollectionViewCell")
        view.addSubview(collectionView)
        
        tableView.frame = CGRect(x: 0, y: collectionView.bottom, width: ScreenWidth, height: ScreenHeight-Top_Height-TabBar_Height-collectionView.height)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = UIColor.white
        tableView.register(WGDescovHospitalTableViewCell.self, forCellReuseIdentifier: "WGDescovHospitalTableViewCell")
        view.addSubview(tableView)
    }
    
    func loadADData() {
        
        let param = ["nurseId":"0"]
        WGNetRequest.reuqestWith(method: .get, url: "http://uat.317hu.com/care-nurse/hospital/adInfo/317", param: param, token: nil) { (response) in
            
            if response.success{
                
                let json = response.json!
                let arr = json["data"].rawValue
                let list = (WGAdvertisingModel.mj_objectArray(withKeyValuesArray: arr))
                if list != nil {
                    self.imgDataArr = list! as NSArray as? [WGAdvertisingModel]
                }
                
                for model in self.imgDataArr!{
                    
                    model.cover = "http://image.317hu.com/"+model.imageId!
                }
                    
                self.collectionView.reloadData()
            }
        }
    }
    
    func loadHOSData() {
        
        WGNetRequest.reuqestWith(method: .get, url: "https://nursetrainuat.317hu.com/nurse-train-web/nursetrain/app/expertTeam/v2.6.1.1/expertByExpertType/2", param: nil, token: nil) { (response) in
            
            if response.success{
                
                let json = response.json!
                let arr = json["data"].rawValue
                let list = WGDescovHospitalListModel.mj_objectArray(withKeyValuesArray: arr)
                if list != nil{
                    
                    let array = list! as NSArray as? [WGDescovHospitalListModel]
                    self.tabDataArr += array!
                }
                self.tableView.reloadData()
            }
        }
    }
}


extension WGTrainMainViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    
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

extension WGTrainMainViewController : UICollectionViewDelegateFlowLayout {
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


extension WGTrainMainViewController: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.tabDataArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "WGDescovHospitalTableViewCell") as! WGDescovHospitalTableViewCell
        
        cell.model = tabDataArr[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 70;
    }
}
