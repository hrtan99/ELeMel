//
//  DataInit.swift
//  ELeMel
//
//  Created by thomas on 2020/5/18.
//  Copyright © 2020 thomas. All rights reserved.
//

import Foundation
import UIKit

class DataInit {
    
    
    // MARK: 对数据库的数据进行初始化载入
    
    static func initData() {
        let res = RestaurantModel()
        res.name = "绝味鸭脖(河西店)"
        res.notice = "没有什么是一根鸭脖解决不了的，如果有，那就两根！"
        res.category = "快餐"
        res.address = "柳州市柳南区潭中西路19号"
        res.phoneNum = "13617723005"
        res.openTime = "09:30-23:59"
        res.rates = Float(4.7)
        res.productionCount = 2
        res.restaurantIcon = UIImage(named: "jueweiyabologo")
        res.restaurantPoster = UIImage(named: "jwybposter")
        res.restaurantPhoto = [UIImage(named: "jwybphoto1")!, UIImage(named: "jwybphoto2")!]
        
        // 保存了以后才有ID
        res.saveToDB()
        
        let p1 = ProductionModel()
        p1.name = "招牌鸭脖"
        p1.price = 15
        p1.ingredients = "黑鸭鸭脖"
        p1.info = "37.8元/500g 够辣才过瘾！才是鸭脖最性感的姿势。别问为什么那么多人啃，不够味何以做行业老大！"
        p1.saleCount = 129
        p1.restaurantID = res.ID
        p1.rates = 1.0
        p1.productionPhoto = UIImage(named: "yabo")
        
        let p2 = ProductionModel()
        p2.name = "招牌鸭掌"
        p2.price = 16
        p2.ingredients = "黑鸭鸭章"
        p2.info = "48.8元/500g 闻味知香，入口带辣，品之回甜。此等美味，何不大吃一斤"
        p2.saleCount = 53
        p2.restaurantID = res.ID
        p2.rates = 0.85
        p2.productionPhoto = UIImage(named: "yazhang")
        
        let p3 = ProductionModel()
        p3.name = "黑鸭鸭锁骨（204g）"
        p3.price = 15
        p3.ingredients = "鸭锁骨"
        p3.info = "36.8元/500g 以辣撩人，以甜润心。一种食材，双重感受。令人怦然心动。"
        p3.saleCount = 55
        p3.restaurantID = res.ID
        p3.rates = 0.88
        p3.productionPhoto = UIImage(named: "heiyayasuogu")
        
        let p4 = ProductionModel()
        p4.name = "酸辣凤爪（241g）"
        p4.price = 25
        p4.ingredients = "鸡爪、青椒"
        p4.info = "51.8元/500g 酸辣可口，柔嫩味美"
        p4.saleCount = 74
        p4.restaurantID = res.ID
        p4.rates = 0.95
        p4.productionPhoto = UIImage(named: "suanlafengzhua")
        
        let p5 = ProductionModel()
        p5.name = "藤椒翅尖（172g）"
        p5.price = 12
        p5.ingredients = "鸡翅尖"
        p5.info = "34.8元/500g 油亮、诱人，柔嫩的口感，清香麻辣的藤椒风味欲罢不能。"
        p5.saleCount = 61
        p5.restaurantID = res.ID
        p5.rates = 0.9
        p5.productionPhoto = UIImage(named: "tengjiaojichijian")
        
        let p6 = ProductionModel()
        p6.name = "藤椒鸭脖（198g）"
        p6.price = 15
        p6.ingredients = "黑鸭鸭章"
        p6.info = "37.8元/500g 清香麻爽，肉质美味。"
        p6.saleCount = 89
        p6.restaurantID = res.ID
        p6.rates = 0.91
        p6.productionPhoto = UIImage(named: "tengjiaoyabo")
        
        let p7 = ProductionModel()
        p7.name = "五香鸭脖（198g）"
        p7.price = 15
        p7.ingredients = "黑鸭鸭章"
        p7.info = "37.8元/500g 五香入骨，鲜嫩紧实，健康美味，加班狗必备。"
        p7.saleCount = 41
        p7.restaurantID = res.ID
        p7.rates = 0.88
        p7.productionPhoto = UIImage(named: "wuxiangyabo")
        
        let p8 = ProductionModel()
        p8.name = "招牌鸭肠（128g）"
        p8.price = 20
        p8.ingredients = "鸭肠"
        p8.info = "78元/500g 鲜嫩劲脆，细腻耐嚼，堪称脆辣无双！每一口都是对舌头和牙齿的无尽挑逗。"
        p8.saleCount = 76
        p8.restaurantID = res.ID
        p8.rates = 0.95
        p8.productionPhoto = UIImage(named: "zhaopaiyachang")
        
        let p9 = ProductionModel()
        p9.name = "招牌鸭头（个）"
        p9.price = 6
        p9.ingredients = "黑鸭鸭头"
        p9.info = "6元/个 小小的鸭头，大大的用心，老汤是上等的，配方是秘制的，就冲这份诚意，泥萌也该尝尝。"
        p9.saleCount = 45
        p9.restaurantID = res.ID
        p9.rates = 0.87
        p9.productionPhoto = UIImage(named: "zhaopaiyatou")
        
        let p10 = ProductionModel()
        p10.name = "招牌鱿鱼"
        p10.price = 25
        p10.ingredients = "鱿鱼"
        p10.info = "122元/500g 此款产品，味道麻辣，口感q弹，滋阴养胃，补虚润肤，实乃补身不二之选。"
        p10.saleCount = 67
        p10.restaurantID = res.ID
        p10.rates = 0.94
        p10.productionPhoto = UIImage(named: "zhaopaiyouyu")
        

     
        
        res.dishes = [p1, p2, p3, p4, p5, p6, p7, p8, p9, p10]
        res.saveDishesToDB()
        
        initData2()
        
    }
    
    static func initData2() {
        let res = RestaurantModel()
        res.name = "大师烧烤 鸭脚煲 小龙虾"
        res.notice = "我们郑重承诺，为您提供优质的美食，上等的服务，欢迎您的光临！"
        res.category = "烧烤/其他小吃"
        res.address = "柳州市文笔路63号一楼门面"
        res.phoneNum = "18276889796"
        res.openTime = "10:30-5:00"
        res.rates = Float(4.1)
        res.productionCount = 10
        res.restaurantIcon = UIImage(named: "IMG_7172")
        res.restaurantPoster = UIImage(named: "IMG_7172")
        res.restaurantPhoto = [UIImage(named: "IMG_7183")!, UIImage(named: "IMG_7184")!, UIImage(named: "IMG_7185")!]
        
        // 保存了以后才有ID
        res.saveToDB()
        
        let p1 = ProductionModel()
        p1.name = "鱿鱼"
        p1.price = 4
        p1.ingredients = "鱿鱼"
        p1.info = "纯炭火烧烤，不要辣，微辣中辣特辣变态辣，请备注。（默认=微辣）"
        p1.saleCount = 203
        p1.restaurantID = res.ID
        p1.rates = 1.0
        p1.productionPhoto = UIImage(named: "IMG_7173")
        
        let p2 = ProductionModel()
        p2.name = "掌中宝"
        p2.price = Float(3.5)
        p2.ingredients = "鸭掌、鸡爪"
        p2.info = "纯炭火烧烤，不要辣，微辣中辣特辣变态辣，请备注。（默认=微辣）"
        p2.saleCount = 162
        p2.restaurantID = res.ID
        p2.rates = 0.85
        p2.productionPhoto = UIImage(named: "IMG_7174")
        
        let p3 = ProductionModel()
        p3.name = "牛肉"
        p3.price = 4
        p3.ingredients = "牛肉"
        p3.info = "纯炭火烧烤，不要辣，微辣中辣特辣变态辣，请备注。（默认=微辣）"
        p3.saleCount = 211
        p3.restaurantID = res.ID
        p3.rates = 0.88
        p3.productionPhoto = UIImage(named: "IMG_7175")
        
        let p4 = ProductionModel()
        p4.name = "肥牛"
        p4.price = 4
        p4.ingredients = "牛肉"
        p4.info = "纯炭火烧烤，不要辣，微辣中辣特辣变态辣，请备注。（默认=微辣）"
        p4.saleCount = 254
        p4.restaurantID = res.ID
        p4.rates = 0.95
        p4.productionPhoto = UIImage(named: "IMG_7176")
        
        let p5 = ProductionModel()
        p5.name = "肥羊"
        p5.price = 4
        p5.ingredients = "羊肉"
        p5.info = "纯炭火烧烤，不要辣，微辣中辣特辣变态辣，请备注。（默认=微辣）"
        p5.saleCount = 203
        p5.restaurantID = res.ID
        p5.rates = 0.9
        p5.productionPhoto = UIImage(named: "IMG_7177")
        
        let p6 = ProductionModel()
        p6.name = "五花肉"
        p6.price = 2
        p6.ingredients = "猪肉"
        p6.info = "纯炭火烧烤，不要辣，微辣中辣特辣变态辣，请备注。（默认=微辣）"
        p6.saleCount = 68
        p6.restaurantID = res.ID
        p6.rates = 0.91
        p6.productionPhoto = UIImage(named: "IMG_7178")
        
        let p7 = ProductionModel()
        p7.name = "热狗（单点不送）"
        p7.price = 3
        p7.ingredients = "猪肉"
        p7.info = "纯炭火烧烤，健康！！！又香又好吃。"
        p7.saleCount = 227
        p7.restaurantID = res.ID
        p7.rates = 0.88
        p7.productionPhoto = UIImage(named: "IMG_7179")
        
        let p8 = ProductionModel()
        p8.name = "鸡小腿（单点不送）"
        p8.price = Float(4.5)
        p8.ingredients = "鸡肉"
        p8.info = "纯炭火烧烤，健康！！！又香又好吃。"
        p8.saleCount = 113
        p8.restaurantID = res.ID
        p8.rates = 0.95
        p8.productionPhoto = UIImage(named: "IMG_7180")
        
        let p9 = ProductionModel()
        p9.name = "烤玉米籽（单点不送）"
        p9.price = Float(2.5)
        p9.ingredients = "玉米"
        p9.info = "玉米籽串好，一串串的吃的方便"
        p9.saleCount = 82
        p9.restaurantID = res.ID
        p9.rates = 0.87
        p9.productionPhoto = UIImage(named: "IMG_7181")
        
        let p10 = ProductionModel()
        p10.name = "烤多春鱼"
        p10.price = 6
        p10.ingredients = "鱿鱼"
        p10.info = "脆口，下酒烧烤"
        p10.saleCount = 18
        p10.restaurantID = res.ID
        p10.rates = 0.94
        p10.productionPhoto = UIImage(named: "IMG_7182")
        

        res.dishes = [p1, p2, p3, p4, p5, p6, p7, p8, p9, p10]
        res.saveDishesToDB()
        
        initData3()
    }
    
    static func initData3() {
        let res = RestaurantModel()
        res.name = "王味螺（五菱店）"
        res.notice = "今日的供应蔬菜：空心菜"
        res.category = "螺蛳粉/米粉米线"
        res.address = "柳州市柳南区河西路18号"
        res.phoneNum = "18376285076"
        res.openTime = "10:30-00：00"
        res.rates = Float(4.6)
        res.productionCount = 10
        res.restaurantIcon = UIImage(named: "wangweiluo")
        res.restaurantPoster = UIImage(named: "luosifen")
        res.restaurantPhoto = [UIImage(named: "IMG_7198")!, UIImage(named: "IMG_7199")!]
        
        // 保存了以后才有ID
        res.saveToDB()
        
        let p1 = ProductionModel()
        p1.name = "原味螺蛳粉"
        p1.price = 9
        p1.ingredients = "米粉"
        p1.info = "配菜请备注：葱花、酸笋、腐竹、花生"
        p1.saleCount = 146
        p1.restaurantID = res.ID
        p1.rates = 1.0
        p1.productionPhoto = UIImage(named: "IMG_7186")
        
        let p2 = ProductionModel()
        p2.name = "螺蛳粉套餐"
        p2.price = 16
        p2.ingredients = "米粉"
        p2.info = "二两+鸭脚+豆腐泡+腐竹"
        p2.saleCount = 121
        p2.restaurantID = res.ID
        p2.rates = 0.85
        p2.productionPhoto = UIImage(named: "IMG_7188")
        
        let p3 = ProductionModel()
        p3.name = "炒螺蛳粉"
        p3.price = 15
        p3.ingredients = "米粉"
        p3.info = "配菜请备注：葱花、酸笋、腐竹、花生"
        p3.saleCount = 64
        p3.restaurantID = res.ID
        p3.rates = 0.88
        p3.productionPhoto = UIImage(named: "IMG_7189")
        
        let p4 = ProductionModel()
        p4.name = "鸭翅（单点不送）"
        p4.price = 3
        p4.ingredients = "鸭翅"
        p4.info = "味美肉嫩"
        p4.saleCount = 74
        p4.restaurantID = res.ID
        p4.rates = 0.95
        p4.productionPhoto = UIImage(named: "IMG_7190")
        
        let p5 = ProductionModel()
        p5.name = "香肠（单点不送）"
        p5.price = Float(2.5)
        p5.ingredients = "猪肉"
        p5.info = "请搭配螺蛳粉下单"
        p5.saleCount = 61
        p5.restaurantID = res.ID
        p5.rates = 0.9
        p5.productionPhoto = UIImage(named: "IMG_7191")
        
        let p6 = ProductionModel()
        p6.name = "腐竹条（单点不送）"
        p6.price = 2
        p6.ingredients = "黑鸭鸭章"
        p6.info = "请搭配螺蛳粉下单，单点不送"
        p6.saleCount = 64
        p6.restaurantID = res.ID
        p6.rates = 0.91
        p6.productionPhoto = UIImage(named: "IMG_7192")
        
        let p7 = ProductionModel()
        p7.name = "鸭掌（单点不送）"
        p7.price = 15
        p7.ingredients = "鸭掌"
        p7.info = "又香又好吃。"
        p7.saleCount = 70
        p7.restaurantID = res.ID
        p7.rates = 0.88
        p7.productionPhoto = UIImage(named: "IMG_7193")
        
        let p8 = ProductionModel()
        p8.name = "豆腐泡（单点不送）"
        p8.price = Float(1.5)
        p8.ingredients = "豆腐"
        p8.info = "纯炭火烧烤，健康！！！又香又好吃。"
        p8.saleCount = 76
        p8.restaurantID = res.ID
        p8.rates = 0.95
        p8.productionPhoto = UIImage(named: "IMG_7194")
        
        let p9 = ProductionModel()
        p9.name = "加粉（单点不送）"
        p9.price = 2
        p9.ingredients = "米粉"
        p9.info = "请搭配螺蛳粉下单，单点不送"
        p9.saleCount = 45
        p9.restaurantID = res.ID
        p9.rates = 0.87
        p9.productionPhoto = UIImage(named: "IMG_7195")
        
        let p10 = ProductionModel()
        p10.name = "卤蛋（单点不送）"
        p10.price = Float(1.5)
        p10.ingredients = "鸡蛋"
        p10.info = "请搭配螺蛳粉下单，单点不送"
        p10.saleCount = 64
        p10.restaurantID = res.ID
        p10.rates = 0.94
        p10.productionPhoto = UIImage(named: "IMG_7196")
        
        let p11 = ProductionModel()
        p11.name = "煎蛋（单点不送）"
        p11.price = Float(2.5)
        p11.ingredients = "鸡蛋"
        p11.info = "搭配螺蛳粉更美味！"
        p11.saleCount = 71
        p11.restaurantID = res.ID
        p11.rates = 0.94
        p11.productionPhoto = UIImage(named: "IMG_7197")
     
        
        res.dishes = [p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11]
        res.saveDishesToDB()
        
        initUserData()
        
    }
    
    static func initUserData() {
        let user = UserModel()
        user.userName = "thomas"
        user.userPassword = "123"
        user.realName = "谭惠日"
        user.phoneNumber = "18977224133"
        user.email = "@whu.edu.cn"
        user.address = "东岸花园5栋3单元201室"
        
        user.saveToDB()
        debugPrint(DAO.select(tableName: "user"))
    }
    
    
}
