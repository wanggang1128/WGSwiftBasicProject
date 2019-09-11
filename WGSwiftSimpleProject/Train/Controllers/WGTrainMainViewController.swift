//
//  WGTrainMainViewController.swift
//  WGSwiftSimpleProject
//
//  Created by wanggang on 2019/6/20.
//  Copyright © 2019 wg. All rights reserved.
//

import UIKit

class WGTrainMainViewController: UIViewController {

    //非可选类型
    let tableView = UITableView()
    let headerView = WGDesHospitalHeaderView(frame: CGRect(x: 0, y: 0, width: ScreenWidth, height: ItemHeight))
    
    //可选类型
    var imgDataArr:[WGAdvertisingModel]?
    //非可选类型
    var tabDataArr = [WGDescovHospitalListModel]()
    
    //创建调度组
    let group = DispatchGroup()
    //创建队列
    let groupQueue = DispatchQueue(label: "wangg")
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "培训"
        view.backgroundColor = UIColor.white
        
        createView()
        //所有接口都完成后,统一刷新UI
        loadNetData()
    }

    func createView() {
        
        tableView.frame = CGRect(x: 0, y: Top_Height, width: ScreenWidth, height: ScreenHeight-Top_Height-TabBar_Height)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = UIColor.white
        tableView.register(WGDescovHospitalTableViewCell.self, forCellReuseIdentifier: "WGDescovHospitalTableViewCell")
        view.addSubview(tableView)
    }
    
    func loadNetData() {
        
        //入组
        group.enter()
        //异步网络请求
        groupQueue.async {
            
            //广告轮播图接口
            self.loadADData()
        }
        
        group.enter()
        groupQueue.async {
            
            self.loadHOSData()
        }
        
        //调度组里的任务都执行完毕,主线程更新
        group.notify(queue: DispatchQueue.main) {
            
            self.headerView.imgDataArr = self.imgDataArr
            self.tableView.tableHeaderView = self.headerView
            
            self.tableView.reloadData()
        }
    }
    
    func loadADData() {
        
        let param = ["nurseId":NURSEID]
        WGNetRequest.reuqestWith(method: .get, url: "http://uat.317hu.com/care-nurse/hospital/adInfo/317", param: param, token: nil) { (response) in
            
            // 出组
            self.group.leave()
            
            if response.success{
                
                let json = response.json!
                let arr = json["data"].rawValue
                //返回的是OC类型数组
                let list = (WGAdvertisingModel.mj_objectArray(withKeyValuesArray: arr))
                
                if list != nil {
                    //转为Swift类型数组
                    self.imgDataArr = list! as NSArray as? [WGAdvertisingModel]
                }
                
                for model in self.imgDataArr!{
                    
                    model.cover = "http://image.317hu.com/"+model.imageId!
                }
            }
        }
    }
    
    func loadHOSData() {
        
        WGNetRequest.reuqestWith(method: .get, url: "https://nursetrainuat.317hu.com/nurse-train-web/nursetrain/app/expertTeam/v2.6.1.1/expertByExpertType/2", param: nil, token: nil) { (response) in
            
            // 出组
            self.group.leave()
            
            if response.success{
                
                let json = response.json!
                let arr = json["data"].rawValue
                let list = WGDescovHospitalListModel.mj_objectArray(withKeyValuesArray: arr)
                if list != nil{
                    
                    let array = list! as NSArray as? [WGDescovHospitalListModel]
                    //数组拼接,即把array中的元素添加到tabDataArr中
                    self.tabDataArr += array!
                }
            }
        }
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
        
        let vc = WGDescovListDetailViewController()
        vc.model = tabDataArr[indexPath.row]
        vc.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 70;
    }
}
