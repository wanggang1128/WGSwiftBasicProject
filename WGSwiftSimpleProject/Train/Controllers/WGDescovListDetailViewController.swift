//
//  WGDescovListDetailViewController.swift
//  WGSwiftSimpleProject
//
//  Created by wanggang on 2019/6/24.
//  Copyright © 2019 wg. All rights reserved.
//

import UIKit

class WGDescovListDetailViewController: UIViewController {

    
    let sagment = WGSegmentView()
    var scrollView = UIScrollView()
    
    var sagmentDataArr = [WGDescovListSagmentModel]()
    
    var model:WGDescovHospitalListModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "规培课堂"
        view.backgroundColor = UIColor.white
        
        loadSagmentData()
        
    }
    
    func loadSagmentData() {
        
        let param = ["expertId":model.ID!]
        WGNetRequest.reuqestWith(method: .get, url: "https://nursetrainuat.317hu.com/nurse-train-web/nursetrain/app/expertTeam/v2.6.1.1/expertCourseCategoryList", param: param, token: nil) { (response) in
            
            if response.success{
                
                let json = response.json!
                let arr = json["data"]["children"].rawValue
                let list = WGDescovListSagmentModel.mj_objectArray(withKeyValuesArray: arr)
                if nil != list{
                    
                    let array = list! as NSArray as? [WGDescovListSagmentModel]
                    
                    self.sagmentDataArr += array!
                    
                    self.createView()
                    self.addChildVC()
                    self.addScrollView()
                }
            }
        }
    }
    
    func createView() {
        
        sagment.frame = CGRect(x: 0, y: Top_Height, width: ScreenWidth, height: 40)
        var titleArr = [String]()
        for item in sagmentDataArr {
            
            titleArr.append(item.value ?? "")
            
        }
        sagment.dataArr = titleArr;
        sagment.BtnClickBlock = {
            (index)->Void in
            
            var point = self.scrollView.contentOffset
            point.x = ScreenWidth * CGFloat(index)
            UIView.animate(withDuration: 0.3, animations: {
                self.scrollView.contentOffset = point
            })
        }
        self.view.addSubview(sagment)
    }
    
    func addChildVC() {
        
        for model in sagmentDataArr {
            
            let vc = WGDescovListDetailChildViewController()
            vc.model = model
            self.addChild(vc)
        }
    }
    
    func addScrollView() {
        
        scrollView.frame = CGRect(x: 0, y: sagment.bottom, width: ScreenWidth, height: ScreenHeight-Top_Height-sagment.height)
        scrollView.bounces = false
        scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        scrollView.contentOffset = CGPoint(x:0, y:0)
        scrollView.isPagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.isScrollEnabled = true
        scrollView.isUserInteractionEnabled = true
        scrollView.delegate = self
        for i in 0..<self.children.count {
            let vc = self.children[i] as UIViewController
            vc.view.frame = CGRect(x:CGFloat(i) * ScreenWidth, y:0, width:ScreenWidth, height:ScreenHeight - Top_Height - sagment.height)
            scrollView.addSubview(vc.view)
        }
        scrollView.contentSize = CGSize(width:CGFloat(sagmentDataArr.count) * ScreenWidth, height:ScreenHeight - Top_Height - sagment.height)
        self.view.addSubview(scrollView)
    }
}

extension WGDescovListDetailViewController: UIScrollViewDelegate{
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let offsetX = scrollView.contentOffset.x
        let index = offsetX / ScreenWidth + 1
        sagment.chageStatus(tag: Int(index))
    }
}
