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
    
    var newInstance: Bool
    
    init() {
        newInstance = true
    }
    init(id: Int) {
        newInstance = false
        loadFromDB(id: id)
    }
    
    // 从数据库加载的函数私有化
    private func loadFromDB(id: Int) {
        let tableEntry = DAO.select(tableName: UserTableField.TableName.rawValue, columns: nil, condition: "\(UserTableField.ID.rawValue) = \(id)")?.first
        self.userID = tableEntry?[UserTableField.ID.rawValue] as? Int
        self.userName = tableEntry?[UserTableField.Name.rawValue] as? String
        self.userPassword = tableEntry?[UserTableField.Password.rawValue] as? String
        self.phoneNumber = tableEntry?[UserTableField.PhoneNumber.rawValue] as? String
        self.email = tableEntry?[UserTableField.Email.rawValue] as? String
        self.address = tableEntry?[UserTableField.Address.rawValue] as? String
        
    }
    
    // 保存到数据库中
    func saveToDB() {
        var User = [
            UserTableField.Address.rawValue: self.address!,
            UserTableField.Name.rawValue: self.userName,
            UserTableField.Password.rawValue: self.userPassword,
            UserTableField.PhoneNumber.rawValue: self.phoneNumber,
            UserTableField.Email.rawValue: self.email
        ] as [String: AnyObject]
        
        if newInstance {
            _ = DAO.insert(tableName: UserTableField.TableName.rawValue, properties: User)
        }
        else {
            User.updateValue(self.userID as AnyObject, forKey: UserTableField.ID.rawValue)
            _ = DAO.update(tableName: UserTableField.TableName.rawValue, properties: User, condition: "\(UserTableField.ID.rawValue) = \(self.userID!)")
        }
        
    }
}
