//
//  OrderModel.swift
//  ELeMel
//
//  Created by thomas on 2020/5/15.
//  Copyright © 2020 thomas. All rights reserved.
//

import Foundation

class OrderModel {
    var ID: Int?                   // 订单ID 由数据库自动生成
    var totalPrice: Float?         // 订单总价
    var createdTime: String?       // 创建时间
    var paymentMethod: String?     // 支付方式
    var userId: Int?               // 用户ID
    var restaurantID: Int?         // 餐馆ID
    var dishesInfo: [Int: Int]?    // 包含的菜品ID和对应菜品的数量
    
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
        self.totalPrice = Float(tableEntry?[OrderFormTableField.TotalPrice.rawValue] as! Double)
        self.createdTime = tableEntry?[OrderFormTableField.CreatedTime.rawValue] as? String
        self.paymentMethod = tableEntry?[OrderFormTableField.PaymentMethod.rawValue] as? String
        self.userId = tableEntry?[OrderFormTableField.UserID.rawValue] as? Int
        self.restaurantID = tableEntry?[OrderFormTableField.ReataurantID.rawValue] as? Int
        
        // 获得order2dish表中订单号所对应的所有表项
        let tableEntries = DAO.select(tableName: Order2DishTableField.TableName.rawValue, columns: nil, condition: "\(Order2DishTableField.OrderID.rawValue) = \(self.ID!)")
        self.dishesInfo = [Int: Int]()
        // 根据temp更新dishInfo
        for temp in tableEntries! {
            dishesInfo?.updateValue(temp[Order2DishTableField.DishCount.rawValue] as! Int, forKey: temp[Order2DishTableField.DishID.rawValue] as! Int)
        }
        
        
    }
    
    // 保存到数据库中
    func saveToDB() throws {
        // 只有新订单能保存 因为订单是不能修改的
        if newInstance{
            newInstance = false // 保存以后就不是新订单了
            let order = [
                OrderFormTableField.TotalPrice.rawValue: self.totalPrice!,
                OrderFormTableField.CreatedTime.rawValue: self.createdTime!,
                OrderFormTableField.PaymentMethod.rawValue: self.paymentMethod!,
                OrderFormTableField.UserID.rawValue: self.userId!,
                OrderFormTableField.ReataurantID.rawValue: self.restaurantID!
            ] as [String : AnyObject]
            _ = DAO.insert(tableName: OrderFormTableField.TableName.rawValue, properties: order)
            
            // 更新ID
            let entry = DAO.select(tableName: OrderFormTableField.TableName.rawValue, columns: [OrderFormTableField.ID.rawValue], condition: "\(OrderFormTableField.CreatedTime.rawValue) = \(ToolClass.addSingleQuotes(str: self.createdTime!)) AND \( OrderFormTableField.UserID.rawValue) = \(self.userId!)")?.first
            self.ID = entry?[OrderFormTableField.ID.rawValue] as? Int
            debugPrint(self.ID!)

            // 更新order2dish表
            for (dishID, dishCount) in self.dishesInfo! {
                let entry = [
                    Order2DishTableField.OrderID.rawValue : self.ID!,
                    Order2DishTableField.DishID.rawValue : dishID,
                    Order2DishTableField.DishCount.rawValue : dishCount
                ] as [String: AnyObject]
                let result = DAO.insert(tableName: Order2DishTableField.TableName.rawValue, properties: entry)
                if result {
                    print("save order tenry sucess!")
                }
            }
            
        }
        else {
            throw saveError.saveError("不能修改订单！")
        }
    }
    
    enum saveError: Error {
        case saveError (String)
    }
    
}
