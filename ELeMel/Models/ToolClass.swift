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
    
    static func convert(from: [[Int: Int]]) -> [Int: Int] {
        var result = [Int:Int]()
        for dic in from {
            for (key, value) in dic {
                result.updateValue(value, forKey: key)
            }
            
        }
        return result
    }
    
    static func convert(from: [Int: Int]) -> [[Int: Int]]{
        var result = [[Int: Int]]()
        for (key, value) in from {
            result.append([key: value])
        }
        return result
    }
    
    
    
    
}
