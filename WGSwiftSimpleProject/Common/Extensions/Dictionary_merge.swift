//
//  Dictionary_merge.swift
//  WGSwiftSimpleProject
//
//  Created by wanggang on 2019/6/19.
//  Copyright © 2019 wg. All rights reserved.
//

import Foundation

extension Dictionary{
    
    mutating func merge<S>(param:S) where S: Sequence, S.Iterator.Element == (key: Key, value: Value){

        for (k, v) in param {
            self[k] = v
        }
    }
}
