//
//  WGSetingViewController.swift
//  WGSwiftSimpleProject
//
//  Created by wanggang on 2019/6/20.
//  Copyright © 2019 wg. All rights reserved.
//

import UIKit
import PKHUD

class WGSetingViewController: UIViewController {

    let logoutBtn = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white
        title = "设置"
        
        logoutBtn.frame = CGRect(x: -ScreenWidth, y: (ScreenHeight-50)/2, width: ScreenWidth-Common_Margin*2, height: 50)
        logoutBtn.setTitle("退出", for: .normal)
        logoutBtn.setTitleColor(UIColor.red, for: .normal)
        logoutBtn.backgroundColor = UIColor.cyan
        logoutBtn.alpha = 0;
        logoutBtn.addTarget(self, action: #selector(logoutBtnClicked), for: .touchUpInside)
        view.addSubview(logoutBtn)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        UIView.animate(withDuration: 1) {
            
            self.logoutBtn.frame = CGRect(x: Common_Margin, y: (ScreenHeight-50)/2, width: ScreenWidth-Common_Margin*2, height: 50)
            self.logoutBtn.alpha = 1
        }
    }
    
    @objc func logoutBtnClicked(){
        
        ShowHUD()

        //模拟退出
        DispatchQueue.main.asyncAfter(deadline: .now()+2) {

            HideHUD()

            UserDefaults.standard.removeObject(forKey: "NURSEID")
            UserDefaults.standard.removeObject(forKey: "NURSENAME")

            UIApplication.shared.delegate?.window??.rootViewController = WGLoginViewController()
        }
    }
}
