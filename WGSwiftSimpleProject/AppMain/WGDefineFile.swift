//
//  WGDefineFile.swift
//  WGSwiftSimpleProject
//
//  Created by wanggang on 2019/6/19.
//  Copyright © 2019 wg. All rights reserved.
//

import Foundation
import UIKit

//屏幕常规尺寸
let ScreenSize = UIScreen.main.bounds.size
let ScreenWidth = ScreenSize.width
let ScreenHeight = ScreenSize.height

let ScreenLengthMax = max(ScreenWidth, ScreenHeight)
let ScreenLengthMin = min(ScreenWidth, ScreenHeight)

//是否是PAD
let ISPad = UIDevice.current.userInterfaceIdiom == .pad

//判断iPhone4系列
let Device_Iphone_4 = __CGSizeEqualToSize(CGSize(width: 640/2, height: 960/2), ScreenSize)
//判断iPhone5系列
let Device_Iphone_5 = __CGSizeEqualToSize(CGSize(width: 640/2, height: 1136/2), ScreenSize)
//判断iPhone6系列
let Device_Iphone_6 = __CGSizeEqualToSize(CGSize(width: 750/2, height: 1334/2), ScreenSize)
//判断iphone6+系列
let Device_Iphone_6P = __CGSizeEqualToSize(CGSize(width: 1242/2, height: 2208/2), ScreenSize)
//判断iPhoneX
let Device_Iphone_X = __CGSizeEqualToSize(CGSize(width: 1125/3, height: 2436/3), ScreenSize)
//判断iPHoneXr
let Device_Iphone_XR = __CGSizeEqualToSize(CGSize(width: 828/2, height: 1792/2), ScreenSize)
//判断iPhoneXs
let Device_Iphone_XS = __CGSizeEqualToSize(CGSize(width: 1125/3, height: 2436/3), ScreenSize)
//判断iPhoneXs Max
let Device_Iphone_XS_MAX = __CGSizeEqualToSize(CGSize(width: 1242/3, height: 2688/3), ScreenSize)

//状态栏高度
let StateBar_Height:CGFloat = ((Device_Iphone_X||Device_Iphone_XR||Device_Iphone_XS||Device_Iphone_XS_MAX) ? 44.0: 20.0)
//顶部总高度=状态栏+导航栏
let Top_Height:CGFloat = ((Device_Iphone_X||Device_Iphone_XR||Device_Iphone_XS||Device_Iphone_XS_MAX) ? 88.0: 64.0)
//底部安全区域高度
let Bottom_Safe_Height:CGFloat = ((Device_Iphone_X||Device_Iphone_XR||Device_Iphone_XS||Device_Iphone_XS_MAX) ? 34.0: 0.0)
//底部总区域=49+安全区域
let TabBar_Height:CGFloat = ((Device_Iphone_X||Device_Iphone_XR||Device_Iphone_XS||Device_Iphone_XS_MAX) ? 83.0: 49.0)

//距离边缘宽度
let Common_Margin:CGFloat = 15.0;


let NURSEID = UserDefaults.standard.value(forKey: "NURSEID")
let NURSENAME = UserDefaults.standard.value(forKey: "NURSENAME")
