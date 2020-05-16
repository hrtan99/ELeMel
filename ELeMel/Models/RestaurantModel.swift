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
    var ID: Int?                    // 店铺ID
    var name: String?               // 店铺名
    var notice: String?             // 公告
    var category: String?           // 品类
    var address: String?            // 地址
    var phoneNum: String?           // 电话
    var openTime: Date?             // 营业时间
    var rates: Float?               // 评分
    var productionCount: Int?       // 商品数
    var restaurantIcon: UIImage?     // 餐馆的图标
    var restaurantPhoto: [UIImage]?  // 餐馆的图片
    var restaurantPoster: UIImage?   // 餐馆首页的海报
    

    
    init(){
        
    }
    
    
    // 从数据库加载的函数私有化
    private func loadFromDB() {
        
    }
    
    // 保存到数据库中
    func saveToDB() {
        
        
        
    }
    
}
