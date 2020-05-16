//
//  ProductionModel.swift
//  ELeMel
//
//  Created by thomas on 2020/5/15.
//  Copyright © 2020 thomas. All rights reserved.
//

import Foundation
import UIKit

class ProductionModel {
    var ID: Int?                        // 菜品ID
    var name: String?                   // 菜品名
    var price: Float?                   // 菜品单价
    var ingredients: String?            // 菜品原料
    var info: String?                   // 菜品简介
    var saleCount: Int?                 // 菜品月销售量
    var restaurantID: Int?              // 所属餐馆ID  外键
    var rates: Float?                   // 好评率
    var productionPhoto: UIImage?       // 菜品图片 就1张
    
    init() {
        
    }
    init (id: Int) {
        loadFromDB(id: id)
    }
    
    // 从数据库加载的函数 私有
    private func loadFromDB(id: Int) {
        let dishTableEnrty = DAO.select(tableName: DishTableField.TableName.rawValue, columns: nil, condition: "id = \(id)")?.first    // 返回的是只有一个字典的数组，把字典提出来
        self.ID = dishTableEnrty?[DishTableField.ID.rawValue] as? Int
        self.name = dishTableEnrty?[DishTableField.Name.rawValue] as? String
        self.price = dishTableEnrty?[DishTableField.Price.rawValue] as? Float
        self.ingredients = dishTableEnrty?[DishTableField.Ingredients.rawValue] as? String
        self.info = dishTableEnrty?[DishTableField.Infomation.rawValue] as? String
        self.saleCount = dishTableEnrty?[DishTableField.SaleCount.rawValue] as? Int
        self.restaurantID = dishTableEnrty?[DishTableField.RestaurantID.rawValue] as? Int
        self.rates = dishTableEnrty?[DishTableField.Rates.rawValue] as? Float
        
        let photo = DAO.select(tableName: ImageTableField.TableName.rawValue, columns: [ImageTableField.ImageData.rawValue], condition: "id = \(id) AND type = \(ImageType.ProductionPhoto.rawValue)")?.first
        self.productionPhoto = photo?[ImageTableField.ImageData.rawValue] as? UIImage
        
    }
    
    // 保存到数据库中
    func saveToDB() {
        // 新创建的用插入语句 否则用更新语句
        var p = [String: AnyObject]()
        for _ in 0 ..< DishTableField.count {
            p.updateValue(self.ID as AnyObject, forKey: DishTableField.ID.rawValue)
        }
        if self.ID == nil {
            
            _ = DAO.insert(tableName: DishTableField.TableName.rawValue, properties: p)
        }
        else {
            
            
            
        }
        
        
        
        
        
        
    }
    
}
