//
//  OrderModel.swift
//  ELeMel
//
//  Created by thomas on 2020/5/15.
//  Copyright © 2020 thomas. All rights reserved.
//

import Foundation

class OrderModel {
    var ID: Int?                 // 订单ID 由数据库自动生成
    var totalPrice: Float?       // 订单总价
    var createdTime: String?       // 创建时间
    var paymentMethod: String?  // 支付方式
    var userId: Int?            // 用户ID
    var restaurantID: Int?       // 餐馆ID
    
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
        let tableEntry = DAO.select(tableName: OrderFormTableField.TableName.rawValue, columns: nil, condition: "\(OrderFormTableField.ID.rawValue) = \(id)")?.first
        
        self.ID = tableEntry?[OrderFormTableField.ID.rawValue] as? Int
        self.totalPrice = tableEntry?[OrderFormTableField.TotalPrice.rawValue] as? Float
        self.createdTime = tableEntry?[OrderFormTableField.CreatedTime.rawValue] as? String
        self.paymentMethod = tableEntry?[OrderFormTableField.PaymentMethod.rawValue] as? String
        self.userId = tableEntry?[OrderFormTableField.UserID.rawValue] as? Int
        self.restaurantID = tableEntry?[OrderFormTableField.ReataurantID.rawValue] as? Int

        
    }
    
    // 保存到数据库中
    func saveToDB() throws {
        // 只有新订单能保存 因为订单是不能修改的
        if newInstance{
            let order = [
                OrderFormTableField.TotalPrice.rawValue: self.totalPrice!,
                OrderFormTableField.CreatedTime.rawValue: self.createdTime!,
                OrderFormTableField.PaymentMethod.rawValue: self.paymentMethod!,
                OrderFormTableField.UserID.rawValue: self.userId!,
                OrderFormTableField.ReataurantID.rawValue: self.restaurantID!
            ] as [String : AnyObject]
            _ = DAO.insert(tableName: OrderFormTableField.TableName.rawValue, properties: order)
        }
        else {
            throw saveError.saveError("不能修改订单！")
        }
    }
    
    enum saveError: Error {
        case saveError (String)
    }
    
}
