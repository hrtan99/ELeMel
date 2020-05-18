//
//  RestaurantModel.swift
//  ELeMel
//
//  Created by thomas on 2020/5/15.
//  Copyright © 2020 thomas. All rights reserved.
//

import Foundation
import UIKit

class RestaurantModel {
    var ID: Int?                     // 店铺ID
    var name: String?                // 店铺名
    var notice: String?              // 公告
    var category: String?            // 品类
    var address: String?             // 地址
    var phoneNum: String?            // 电话
    var openTime: String?            // 营业时间
    var rates: Float?                // 评分
    var productionCount: Int?        // 商品数
    var restaurantIcon: UIImage?     // 餐馆的图标
    var restaurantPhoto: [UIImage]?  // 餐馆的图片
    var restaurantPoster: UIImage?   // 餐馆首页的海报
    var dishes: [ProductionModel]?   // 餐馆的菜品

    
    private var isNewInstance: Bool  // 是否是新创建的餐馆
    private var isChanged:Bool = false
    
    init(){
        isNewInstance = true
    }
    
    init(id: Int) {
        isNewInstance = false
        loadFromDB(id: id)
    }
    
    func loadDishes() {
        self.dishes = [ProductionModel]()
        // 获得所有餐馆id对应的表项
        let entries = DAO.select(tableName: DishTableField.TableName.rawValue, columns: [DishTableField.ID.rawValue], condition: "\(DishTableField.RestaurantID.rawValue) = \(self.ID!)")
        for entry in entries! {
            let id = entry[DishTableField.ID.rawValue] as! Int
            let production = ProductionModel(id: id)
            self.dishes?.append(production)
        }
        
        print("restaurant's dishes:")
        debugPrint(self.dishes!)
    }
    
    
    // 从数据库加载的函数私有化
    private func loadFromDB(id: Int) {
        let tableEntry = DAO.select(tableName: RestaurantTableField.TableName.rawValue, columns: nil, condition: "id = \(id)")?.first
        
        
        self.ID = tableEntry?[RestaurantTableField.ID.rawValue] as? Int
        self.name = tableEntry?[RestaurantTableField.Name.rawValue] as? String
        self.notice = tableEntry?[RestaurantTableField.Notice.rawValue] as? String
        self.category = tableEntry?[RestaurantTableField.Category.rawValue] as? String
        self.address = tableEntry?[RestaurantTableField.Address.rawValue] as? String
        self.phoneNum = tableEntry?[RestaurantTableField.PhoneNumber.rawValue] as? String
        self.openTime = tableEntry?[RestaurantTableField.OpenTime.rawValue] as? String
        self.rates = Float(tableEntry?[RestaurantTableField.Rates.rawValue] as! Double)
        self.productionCount = tableEntry?[RestaurantTableField.ProductionCount.rawValue] as? Int
        self.restaurantPhoto = [UIImage]()
        
        let imageTableEntries = DAO.select(tableName: ImageTableField.TableName.rawValue, columns: nil, condition: "\(ImageTableField.RestaurantID.rawValue) = \(id)")
        
        // 遍历返回的图片表项
        for i in 0 ..< imageTableEntries!.count {
            // 判断当前项的图片类型
            let type = imageTableEntries![i][ImageTableField.ImageType.rawValue] as! String
            if type == ImageType.RestaurantPoster.rawValue {
                self.restaurantPoster = imageTableEntries![i][ImageTableField.ImageData.rawValue] as? UIImage
            }
            else if type == ImageType.RestaurantIcon.rawValue {
                self.restaurantIcon = imageTableEntries![i][ImageTableField.ImageData.rawValue] as? UIImage
            }
            else if type == ImageType.RestaurantPhoto.rawValue {
                self.restaurantPhoto?.append((imageTableEntries![i][ImageTableField.ImageData.rawValue] as? UIImage)!)
            }
            else {
                // 这是菜品图片的情况
            }
        }
        
        // 加载菜品
        loadDishes()
    }
    
    // 保存到数据库中
    func saveToDB() {
        if isNewInstance {
            // 修改属性
            isNewInstance = false
            let restaurant = [
                RestaurantTableField.Name.rawValue: self.name!,
                RestaurantTableField.Notice.rawValue: self.notice!,
                RestaurantTableField.Category.rawValue: self.category!,
                RestaurantTableField.Address.rawValue: self.address!,
                RestaurantTableField.PhoneNumber.rawValue: self.phoneNum!,
                RestaurantTableField.OpenTime.rawValue: self.openTime!,
                RestaurantTableField.Rates.rawValue: self.rates!,
                RestaurantTableField.ProductionCount.rawValue: self.productionCount!
            ] as [String : AnyObject]
            _ = DAO.insert(tableName: RestaurantTableField.TableName.rawValue, properties: restaurant)
            
            // 更新ID
            let entry = DAO.select(tableName: RestaurantTableField.TableName.rawValue, columns: [RestaurantTableField.ID.rawValue], condition: "\(RestaurantTableField.Name.rawValue) = \(ToolClass.addSingleQuotes(str: self.name!)) AND \( RestaurantTableField.Notice.rawValue) = \(ToolClass.addSingleQuotes(str: self.notice!))")?.first
            self.ID = entry?[RestaurantTableField.ID.rawValue] as? Int

            
            let iconImage = [
                ImageTableField.ImageType.rawValue: ImageType.RestaurantIcon.rawValue,
                ImageTableField.DishID.rawValue: -1,
                ImageTableField.RestaurantID.rawValue: self.ID!,
                ImageTableField.ImageData.rawValue: self.restaurantIcon!
            ] as [String : AnyObject]
            _ = DAO.insert(tableName: ImageTableField.TableName.rawValue, properties: iconImage)
            let posterImage = [
                ImageTableField.ImageType.rawValue: ImageType.RestaurantPoster.rawValue,
                ImageTableField.DishID.rawValue: -1,
                ImageTableField.RestaurantID.rawValue: self.ID!,
                ImageTableField.ImageData.rawValue: self.restaurantPoster!
            ] as [String : AnyObject]
            _ = DAO.insert(tableName: ImageTableField.TableName.rawValue, properties: posterImage)
            
            for i in 0 ..< self.restaurantPhoto!.count {
                let Image = [
                    ImageTableField.ImageType.rawValue: ImageType.RestaurantPhoto.rawValue,
                    ImageTableField.DishID.rawValue: -1,
                    ImageTableField.RestaurantID.rawValue: self.ID!,
                    ImageTableField.ImageData.rawValue: self.restaurantPhoto![i]
                ] as [String : AnyObject]
                
                _ = DAO.insert(tableName: ImageTableField.TableName.rawValue, properties: Image)
            }

//            saveDishesToDB()
        }
        else {
            // 不是新的数据 那么只有修改了才写回数据库
            if isChanged {
                let restaurant = [
                    RestaurantTableField.ID.rawValue: self.ID!,
                    RestaurantTableField.Name.rawValue: self.name!,
                    RestaurantTableField.Notice.rawValue: self.notice!,
                    RestaurantTableField.Category.rawValue: self.category!,
                    RestaurantTableField.Address.rawValue: self.address!,
                    RestaurantTableField.PhoneNumber.rawValue: self.phoneNum!,
                    RestaurantTableField.OpenTime.rawValue: self.openTime!,
                    RestaurantTableField.Rates.rawValue: self.rates!,
                    RestaurantTableField.ProductionCount.rawValue: self.productionCount!
                ] as [String : AnyObject]
                _ = DAO.update(tableName: RestaurantTableField.TableName.rawValue, properties: restaurant, condition: "\(RestaurantTableField.ID.rawValue) = \(self.ID!)")
                
                let iconImage = [
                    ImageTableField.ImageType.rawValue: ImageType.RestaurantIcon.rawValue,
                    ImageTableField.DishID.rawValue: -1,
                    ImageTableField.RestaurantID.rawValue: self.ID!,
                    ImageTableField.ImageData.rawValue: self.restaurantIcon!
                ] as [String : AnyObject]
                _ = DAO.update(tableName: ImageTableField.TableName.rawValue, properties: iconImage, condition: "\(ImageTableField.RestaurantID.rawValue) = \(self.ID!)")
                let posterImage = [
                    ImageTableField.ImageType.rawValue: ImageType.RestaurantPoster.rawValue,
                    ImageTableField.DishID.rawValue: -1,
                    ImageTableField.RestaurantID.rawValue: self.ID!,
                    ImageTableField.ImageData.rawValue: self.restaurantPoster!
                ] as [String : AnyObject]
                _ = DAO.update(tableName: ImageTableField.TableName.rawValue, properties: posterImage, condition: "\(ToolClass.addSingleQuotes(str: ImageTableField.RestaurantID.rawValue)) = \(self.ID!)")
                
                for i in 0 ..< self.restaurantPhoto!.count {
                    let Image = [
                        ImageTableField.ImageType.rawValue: ImageType.ProductionPhoto.rawValue,
                        ImageTableField.DishID.rawValue: -1,
                        ImageTableField.RestaurantID.rawValue: self.ID!,
                        ImageTableField.ImageData.rawValue: self.restaurantPhoto![i]
                    ] as [String : AnyObject]
                    
                    _ = DAO.update(tableName: ImageTableField.TableName.rawValue, properties: Image, condition: "\(ToolClass.addSingleQuotes(str: ImageTableField.RestaurantID.rawValue)) = \(self.ID!)")
                }
                
                saveDishesToDB()
            }
        }
        
    }
    
    
     func saveDishesToDB() {
        for i in 0 ..< self.dishes!.count {
            self.dishes![i].saveToDB()
        }
        
    }
    
    
    
}
