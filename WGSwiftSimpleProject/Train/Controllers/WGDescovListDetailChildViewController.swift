//
//  WGDescovListDetailChildViewController.swift
//  WGSwiftSimpleProject
//
//  Created by wanggang on 2019/6/24.
//  Copyright © 2019 wg. All rights reserved.
//

import UIKit

class WGDescovListDetailChildViewController: UIViewController {

    var model:WGDescovListSagmentModel?
    var nurseTrainExpertId:String = ""
    
    //非可选类型
    let tableView = UITableView()
    //非可选类型
    var dataArr = [WGWGDesHosListDetailTableViewModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white
        
        createView()
        
        if model != nil {
            loadNetData()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    func createView() {
        
        tableView.frame = CGRect(x: 0, y: 0, width: ScreenWidth, height: ScreenHeight-Top_Height-TabBar_Height)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = UIColor.white
        tableView.register(WGDesHosListDetailTableViewCell.self, forCellReuseIdentifier: "WGDesHosListDetailTableViewCell")
        view.addSubview(tableView)
    }
    
    func loadNetData() {
        
        let param = ["systemType":"2",
                     "classSort":model!.code!,
                     "pageNum":"1",
                     "pageSize":"200",
                     "nurseTrainExpertId":self.nurseTrainExpertId,
            ]
        
        WGNetRequest.reuqestWith(method: .get, url: "http://coursecenter.317hu.com/course-center-web/coursecenter/app/course/read/publicCourseLibrary/list", param: param, token: nil) { (response) in
            
            if response.success{
                let json = response.json!
                let arr = json["data"]["result"].rawValue
                let list = WGWGDesHosListDetailTableViewModel.mj_objectArray(withKeyValuesArray: arr)
                
                if list != nil{
                    
                    let array = list! as NSArray as? [WGWGDesHosListDetailTableViewModel]
                    //数组拼接,即把array中的元素添加到tabDataArr中
                    self.dataArr += array!
                    
                    self.tableView.reloadData()
                }
            }
        }
    }

}

extension WGDescovListDetailChildViewController: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.dataArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "WGDesHosListDetailTableViewCell") as! WGDesHosListDetailTableViewCell
        cell.model = dataArr[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 90;
    }
}
