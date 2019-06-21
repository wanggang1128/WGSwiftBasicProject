//
//  WGMyMainViewController.swift
//  WGSwiftSimpleProject
//
//  Created by wanggang on 2019/6/20.
//  Copyright © 2019 wg. All rights reserved.
//

import UIKit

class WGMyMainViewController: UIViewController {

    //可选类型
    var tableView:UITableView?
    let dataArr = ["学分查询","意见反馈","积分商城","我的收藏","系统设置"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "我的"
        view.backgroundColor = UIColor.white
        
        createView()
    }
    
    func createView() {
        
        tableView = UITableView(frame: CGRect(x: 0, y: Top_Height, width: ScreenWidth, height: ScreenHeight-Top_Height-TabBar_Height), style: .grouped)
        tableView?.backgroundColor = UIColor.white
        tableView?.delegate = self
        tableView?.dataSource = self
        view.addSubview(tableView!)
    }
    
}

extension WGMyMainViewController: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.dataArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell")
        if nil == cell {
            
            cell = UITableViewCell(style: .default, reuseIdentifier: "UITableViewCell")
        }
        let imgName = (indexPath.row == 0) ? "huCreditQuery":(indexPath.row == 1) ? "huFeedBack": (indexPath.row == 2) ? "huIntegralMall": (indexPath.row == 3) ? "huMyCollection": "huEmployeeSatisfaction"
        cell?.imageView?.image = UIImage(named: imgName)
        cell?.textLabel?.text = self.dataArr[indexPath.row]
        cell?.accessoryType = .disclosureIndicator
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        let vc = WGSetingViewController()
        vc.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 55;
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        return nil
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        
        return nil
    }
}
