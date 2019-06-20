//
//  WGNetRequest.swift
//  WGSwiftSimpleProject
//
//  Created by wanggang on 2019/6/19.
//  Copyright © 2019 wg. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class WGNetRequest: NSObject {

    struct responseData {
        
        var request: URLRequest?
        var response: URLResponse?
        var data: Data?
        var json: JSON?
        var error: NSError?
        var success = false
    }
    
    class func reuqestWith(method: HTTPMethod, url: String, param: [String:Any]?, token: String?, complete:@escaping (responseData)->Void){
        
//        var dicToken:[String:String]!
//        if token != nil {
//            dicToken = ["tokenId":token!]
//        }
        var paramDic = [String:Any]()
        if let param = param {
            paramDic.merge(param: param)
            paramDic["platform"] = "Iph"
            paramDic["version"] = "4.8.2"
            paramDic["hospitalId"] = "-3"
            paramDic["nurseId"] = "11359"
        }
        
        let manager = Alamofire.SessionManager.default
        manager.session.configuration.timeoutIntervalForRequest = 10;
        manager.request(url, method: method, parameters: paramDic, encoding: URLEncoding.default, headers: nil).response { (response) in
            
            do{
                let json = try JSON(data: response.data!)
                let suc = json["success"].bool!
                
                if JSON.null != json {
                    let res = responseData(request: response.request, response: response.response, data: response.data, json: json, error: response.error as NSError?, success: suc)
                    
                    complete(res)
                }
            }catch{}
        }
    }
}
