//
//  UserModel.swift
//  ELeMel
//
//  Created by thomas on 2020/5/15.
//  Copyright © 2020 thomas. All rights reserved.
//

import Foundation

class UserModel {
    var userID: Int?                         // 用户ID
    var userName: String?                    // 用户名
    var userPassword: String?                // 用户密码
    var phoneNumber: String?                 // 用户电话号码
    var email: String?                       // 邮箱
    var address: String?                     // 地址
    
    init() {
        
    }
    
    // 从数据库加载的函数私有化
    private func loadFromDB() {
        
    }
    
    // 保存到数据库中
    func saveToDB() {
        
        
        
    }
}
