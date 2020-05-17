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
    
    var imageChanged: Bool = false      // 图片修改标志
    
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
        
        // 记载图片
        let photo = DAO.select(tableName: ImageTableField.TableName.rawValue, columns: [ImageTableField.ImageData.rawValue], condition: "\(ImageTableField.DishID) = \(id) AND type = \(ToolClass.addSingleQuotes(str: ImageType.ProductionPhoto.rawValue))")?.first
        self.productionPhoto = photo?[ImageTableField.ImageData.rawValue] as? UIImage
        
    }
    
    // 保存到数据库中
    func saveToDB() {
        // 新创建的用插入语句 否则用更新语句
        var p = [
            DishTableField.Name.rawValue: self.name!,
            DishTableField.Price.rawValue: self.price!,
            DishTableField.Ingredients.rawValue: self.ingredients!,
            DishTableField.Infomation.rawValue: self.info!,
            DishTableField.SaleCount.rawValue: self.saleCount!,
            DishTableField.RestaurantID.rawValue: self.restaurantID!,
            DishTableField.Rates.rawValue: self.rates!
            ] as [String : AnyObject]
        
        if self.ID != nil {
            p.updateValue(self.ID as AnyObject, forKey: DishTableField.ID.rawValue)
        }
        _ = DAO.insert(tableName: DishTableField.TableName.rawValue, properties: p)
        // 如果刚刚是新加入的菜品，还要获取ID来保存图片
        if self.ID == nil {
            // 获取刚刚插入的菜品的ID
            let temp = DAO.select(tableName: DishTableField.TableName.rawValue, columns: [DishTableField.ID.rawValue], condition: "name = \(ToolClass.addSingleQuotes(str: self.name!))")?.first
            let id = temp![DishTableField.ID.rawValue] as! Int
            self.ID = id        // 更新ID
            let image = [
                ImageTableField.ImageType.rawValue: ImageType.ProductionPhoto.rawValue,
                ImageTableField.DishID.rawValue: self.ID!,
                ImageTableField.RestaurantID.rawValue: self.restaurantID!,
                ImageTableField.ImageData.rawValue: self.productionPhoto!
            ] as [String: AnyObject]
            // 插入新图片
            _ = DAO.insert(tableName: ImageTableField.TableName.rawValue, properties: image)
            
        }
        else if self.imageChanged {
            // 更新图片
            _ = DAO.update(tableName: ImageTableField.TableName.rawValue, properties: [ImageTableField.ImageData.rawValue: self.productionPhoto as AnyObject], condition: "\(DishTableField.ID.rawValue) = \(ImageTableField.DishID.rawValue)")
        }
        
        
    }
    
}
