//
//  WGTabBarController.swift
//  WGSwiftSimpleProject
//
//  Created by wanggang on 2019/6/20.
//  Copyright © 2019 wg. All rights reserved.
//

import UIKit

class WGTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.addChildViewController(controller: WGTrainMainViewController(), title: "首页", defaultImg: UIImage(named:"shouye")!, selectorImg: UIImage(named:"shouyes")!)
        self.addChildViewController(controller: WGMyMainViewController(), title: "我的", defaultImg: UIImage(named:"wode")!, selectorImg: UIImage(named:"wodes")!)
    }

    
    func addChildViewController(controller: UIViewController, title: String, defaultImg: UIImage, selectorImg: UIImage){
        
        controller.tabBarItem = UITabBarItem(title: title, image: defaultImg.withRenderingMode(.alwaysOriginal), selectedImage: selectorImg.withRenderingMode(.alwaysOriginal))
    controller.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.blue, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 30)], for: .selected)
        
        let nav = UINavigationController(rootViewController: controller)
        self.addChild(nav)
    }
}
