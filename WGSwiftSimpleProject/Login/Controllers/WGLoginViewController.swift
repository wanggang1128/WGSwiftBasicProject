//
//  WGLoginViewController.swift
//  WGSwiftSimpleProject
//
//  Created by wanggang on 2019/6/19.
//  Copyright © 2019 wg. All rights reserved.
//

import UIKit

class WGLoginViewController: UIViewController {

    //可选类型
    var backgroundImageView:UIImageView?
    
    //非可选类型
    let accountTextField = UITextField()
    let pswTextField = UITextField()
    let loginBnt = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "登录"
        view.backgroundColor = UIColor.white
        
        createView()
    }

    //创建视图
    func createView() {
        
        //背景图
        backgroundImageView = UIImageView(frame: view.frame)
        backgroundImageView?.image = UIImage(named: "backgroundImage")
        backgroundImageView?.isUserInteractionEnabled = true
        view.addSubview(backgroundImageView!)
        
        //用户名输入框
        accountTextField.frame = CGRect(x: Common_Margin*2, y: Top_Height+50, width: (ScreenWidth-Common_Margin*4), height: 40)
        accountTextField.placeholder = "请输入手机号"
        accountTextField.text = "13738172768"
        accountTextField.layer.borderWidth = 0.6
        accountTextField.layer.borderColor = UIColor.gray.cgColor
        accountTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 40))
        accountTextField.leftViewMode = .always
        accountTextField.delegate = self
        backgroundImageView?.addSubview(accountTextField)
        
        //密码输入框
        pswTextField.frame = CGRect(x: accountTextField.left, y: accountTextField.bottom+30, width: accountTextField.width, height: accountTextField.height)
        pswTextField.placeholder = "请输入密码"
        pswTextField.text = "wy123456"
        pswTextField.layer.borderWidth = 0.6
        pswTextField.layer.borderColor = UIColor.gray.cgColor
        pswTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 40))
        pswTextField.leftViewMode = .always
        pswTextField.delegate = self
        backgroundImageView?.addSubview(pswTextField)
        
        //登录按钮
        loginBnt.frame = CGRect(x: accountTextField.left, y: pswTextField.bottom+30, width: accountTextField.width, height: accountTextField.height)
        loginBnt.backgroundColor = UIColor.blue
        loginBnt.setTitle("登录", for: .normal)
        loginBnt.setTitleColor(UIColor.white, for: .normal)
        loginBnt.layer.shadowOffset = CGSize(width: 0, height: 5)
        loginBnt.layer.shadowColor = UIColor.blue.cgColor
        loginBnt.layer.shadowOpacity = 0.5
        loginBnt.layer.cornerRadius = 5
        loginBnt.addTarget(self, action: #selector(loginBtnClicked), for: .touchUpInside)
        backgroundImageView?.addSubview(loginBnt)
        
    }
    
    //登录
    @objc func loginBtnClicked(){
        
        let param:[String:Any] = ["mobile":accountTextField.text!,
                                  "password":pswTextField.text!.md5(),
                                  ]
        ShowHUD()
        
        let url01 = "http://317hu.com/care-nurse/nurse/account/login/byPassword"
        
        WGNetRequest.reuqestWith(method: .post, url: url01, param: param, token: nil) { (response) in
            
            HideHUD()
            
            if response.success {
                let json = response.json!
                let dic = json["data"].rawValue
                let model = WGLoginModel.mj_object(withKeyValues: dic)
                
                //存储登录信息
                UserDefaults.standard.set(model?.itsId, forKey: "NURSEID")
                UserDefaults.standard.set(model?.name, forKey: "NURSENAME")
                
                let tabbar = WGTabBarController()
                UIApplication.shared.delegate?.window??.rootViewController = tabbar
                
                print("登陆成功")
            }else{
                print("登陆失败")
            }
        }
        
    }
    
    //取消第一响应
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.accountTextField.resignFirstResponder()
        self.pswTextField.resignFirstResponder()
    }
}

//通过extension,让WGLoginViewController实现UITextFieldDelegate代理
extension WGLoginViewController: UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == self.accountTextField {
            
            self.accountTextField.resignFirstResponder()
            self.pswTextField.becomeFirstResponder()
        }else{
            self.pswTextField.resignFirstResponder()
        }
        
        return true
    }
}
