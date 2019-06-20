//
//  WGHUD.swift
//  WGSwiftSimpleProject
//
//  Created by wanggang on 2019/6/20.
//  Copyright © 2019 wg. All rights reserved.
//

import Foundation
import UIKit
import PKHUD

public func ShowHUD(state: Bool = true) {
    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+0.26) {
        if state{
            HUD.show(.progress)
        }else {
            HUD.hide()
        }
    }
    
}

public func HideHUD() {
    
    HUD.hide()
    
}

public func RemindHUD(text: String) {
    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+0.26) {
        HUD.show(.label(text))
        HUD.hide(afterDelay: 2)
    }
}
