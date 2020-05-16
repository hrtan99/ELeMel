//
//  ToolClass.swift
//  ELeMel
//
//  Created by thomas on 2020/5/15.
//  Copyright © 2020 thomas. All rights reserved.
//

import Foundation


class ToolClass {
    
    static func addSingleQuotes(str: String) -> String {
        return "'\(str)'"
    }
    
    static func getType(obj: AnyObject) -> Int {
        if obj is Int {
            return 0
        }
        if obj is Float {
            return 1
        }
        if obj is Double {
            return 2
        }
        if obj is NSData {
            return 3
        }
        if obj is String{
            return 4
        }
        return 5
    }
    
}
