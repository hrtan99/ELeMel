//
//  DAO.swift
//  ELeMel
//
//  Created by thomas on 2020/5/15.
//  Copyright © 2020 thomas. All rights reserved.
//

import Foundation
//import UIKit.UIImage
import UIKit

// 图片类型
enum ImageType: String {
    case RestaurantIcon = "restaurantIcon"
    case RestaurantPhoto = "restaurantPhoto"
    case RestaurantPoster = "restaurantPoster"
    case ProductionPhoto = "productionPhoto"
    static var count: Int{ return ImageType.ProductionPhoto.hashValue + 1 }
}
// 表类型
enum DishTableField: String {
    case TableName = "dish"
    case ID = "id"
    case Name = "name"
    case Price = "price"
    case Ingredients = "ingredient"
    case Infomation = "info"
    case SaleCount = "salecount"
    case RestaurantID = "restaurantid"
    case Rates = "rates"
    static var count: Int{ return DishTableField.Rates.hashValue }
}

enum RestaurantTableField: String {
    case TableName = "restaurant"
    case ID = "id"
    case Name = "name"
    case Notice = "notice"
    case Category = "type"
    case Address = "address"
    case PhoneNumber = "phonenumber"
    case OpenTime = "opentime"
    case Rates = "rates"
    case ProductionCount = "productioncount"
    static var count: Int{ return RestaurantTableField.ProductionCount.hashValue }
}

enum ImageTableField: String {
    case TableName = "image"
    case ID = "id"
    case ImageType = "type"
    case DishID = "dishid"
    case RestaurantID = "restaurantid"
    case ImageData = "data"
    static var count: Int{ return ImageTableField.ImageData.hashValue }
}

enum OrderFormTableField: String {
    case TableName = "orderform"
    case ID = "id"
    case TotalPrice = "totalprice"
    case CreatedTime = "createdtime"
    case PaymentMethod = "paymentmethod"
    case UserID = "userid"
    case ReataurantID = "restaurantid"
    static var count: Int{ return OrderFormTableField.ReataurantID.hashValue }
}

enum Order2DishTableField: String {
    case TableName = "order2dish"
    case OrderID = "orderid"
    case DishID = "dishid"
    case DishCount = "dishcount"
    static var count: Int{ return Order2DishTableField.DishCount.hashValue }
}

enum UserTableField: String {
    case TableName = "user"
    case ID = "id"
    case Name = "username"
    case Password = "password"
    case RealName = "name"
    case PhoneNumber = "phonenumber"
    case Email = "email"
    case Address = "address"
    static var count: Int{ return UserTableField.Address.hashValue }
}

class DAO {
    static var DBManager = SQLiteManager()   // 数据库管理器
    
    static func initDB() {
        _ = DBManager.openDB()
        clearDB()
        let createDishTable = "CREATE TABLE IF NOT EXISTS dish('id' INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, 'name' TEXT NOT NULL, 'price' FLOAT NOT NULL, 'ingredient' TEXT NOT NULL, 'info' TEXT NOT NULL, 'salecount' INT NOT NULL, 'restaurantid' INT NOT NULL, 'rates' FLOAT NOT NULL);"
        let createRestaurantTable = "CREATE TABLE IF NOT EXISTS restaurant('id' INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, 'name' TEXT NOT NULL, 'notice' TEXT NOT NULL, 'type' TEXT NOT NULL, 'address' TEXT NOT NULL, 'phonenumber' TEXT NOT NULL, 'opentime' TEXT NOT NULL, 'rates' FLOAT NOT NULL, 'productioncount' INT NOT  NULL);"
        let createImageTable = "CREATE TABLE IF NOT EXISTS image('id' INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, 'type' TEXT NOT NULL, 'dishid' INT NOT NULL, 'restaurantid' INT NOT NULL, 'data' BLOB NOT NULL);"
        let createOrderTable = "CREATE TABLE IF NOT EXISTS orderform('id' INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, 'totalprice' FLOAT NOT NULL, 'createdtime' TEXT NOT NULL, 'paymentmethod' TEXT NOT NULL, 'userid' INT NOT NULL, 'restaurantid' INT NOT NULL);"
        let createOrder2DishTable = "CREATE TABLE IF NOT EXISTS order2dish('orderid' INT NOT NULL, 'dishid' INT NOT NULL, 'dishcount' INT NOT NULL, PRIMARY KEY(orderid, dishid));"
        let createUserTable = "CREATE TABLE IF NOT EXISTS user('id' INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, 'username' TEXT NOT NULL, 'password' TEXT NOT NULL, 'name' TEXT NOT NULL, 'phonenumber' TEXT NOT NULL, 'email' TEXT NOT NULL, 'address' TEXT NOT NULL);"
        
        // 执行sql尝试创建数据表 返回的bool值存在六个匿名变量里面
        _ = DBManager.execNoneQuerySQL(sql: createDishTable)
        _ = DBManager.execNoneQuerySQL(sql: createRestaurantTable)
        _ = DBManager.execNoneQuerySQL(sql: createImageTable)
        _ = DBManager.execNoneQuerySQL(sql: createOrderTable)
        _ = DBManager.execNoneQuerySQL(sql: createOrder2DishTable)
        _ = DBManager.execNoneQuerySQL(sql: createUserTable)
        
        // 检查insert语句
//        let a = ["type": "icon", "dishid": 1, "restaurantid":1, "data": UIImage(systemName: "folder")!] as [String : AnyObject]
//        insert(tableName: "image", properties: a)
        
        // 检查update语句
//        let a = ["id": 12, "name": "thomas", "price": 1.5, "image": UIImage(systemName: "folder")] as [String : AnyObject]
//        let condition = "thomas = 6"
//        update(tableName: "dish", properties: a, condition: condition)
        
        // 检查delete语句
//        delete(tableName: "image")
        
//        checkProductionModel()
//        checkRestaurantModel()
//        checkOrderModel()
//        checkUserModel()
        
        DataInit.initData()
        
        // 检查查询语句
//        _ = select(tableName: "image")
//        _ = select(tableName: "restaurant")
//        _ = select(tableName: "dish")
        
        DBManager.closeDB()
    }
    
    static func checkProductionModel() {
        let production = ProductionModel()
        production.name = "thomas"
        production.price = 1.85
        production.ingredients = "牛肉"
        production.info = "大学生"
        production.saleCount = 99
        production.restaurantID = 1
        production.rates = 0.99
        production.productionPhoto = UIImage(named: "yabo")
        
        production.saveToDB()
//        debugPrint(production.ID!)
//        debugPrint(production)
        
    }
    
    static func checkRestaurantModel() {
        var res = RestaurantModel()
        res.name = "绝味鸭脖店"
        res.notice = "满减优惠"
        res.category = "快餐"
        res.address = "河西路"
        res.phoneNum = "110"
        res.openTime = "8:30-20:00"
        res.rates = 4.7
        res.productionCount = 2
        res.restaurantIcon = UIImage(named: "yabo")
        res.restaurantPoster = UIImage(named: "yabo")
        res.restaurantPhoto = [UIImage(named: "yabo")!]
        
        // 保存了以后才有ID
        res.saveToDB()

        
        let p1 = ProductionModel()
        p1.name = "thomas"
        p1.price = 1.85
        p1.ingredients = "牛肉"
        p1.info = "大学生"
        p1.saleCount = 99
        p1.restaurantID = res.ID
        p1.rates = 0.99
        p1.productionPhoto = UIImage(named: "yabo")
        
        let p2 = ProductionModel()
        p2.name = "ali"
        p2.price = 1.85
        p2.ingredients = "牛肉"
        p2.info = "大学生"
        p2.saleCount = 99
        p2.restaurantID = res.ID
        p2.rates = 0.99
        p2.productionPhoto = UIImage(named: "yabo")
        
        res.dishes = [p1, p2]
        res.saveDishesToDB()
        res = RestaurantModel(id: 1)
        
//        debugPrint(res)
//        debugPrint(res.productionCount)
    }
    

    
    static func checkOrderModel() {
        let order = OrderModel()
        order.totalPrice = 99.9
        order.createdTime = "10:30"
        order.paymentMethod = "支付宝"
        order.userId = 1
        order.restaurantID = 1
        order.dishesInfo = [
            1: 10,
            2: 30
        ]
        do {
            try order.saveToDB()
        }
        catch {
            print(Error.self)
        }

        let id = order.ID!
        let order2 = OrderModel(id: id)
        
    }
    
    static func checkUserModel() {
        let user = UserModel()
        user.userName = "root"
        user.userPassword = "123"
        user.phoneNumber = "123456798"
        user.email = "@whu.edu.cn"
        user.address = "河西路185号"
        
        user.saveToDB()
//        debugPrint(DAO.select(tableName: "user"))
    }
    
    
    
    static func clearDB() {
        dropTable(tableName: "dish")
        dropTable(tableName: "image")
        dropTable(tableName: "restaurant")
        dropTable(tableName: "user")
        dropTable(tableName: "orderform")
        dropTable(tableName: "order2dish")
        
    }
    
    // 返回表中记录的数量
    static func getTableEntryCount(tableName: String) -> Int{
        DBManager.openDB()
        return select(tableName: tableName)!.count
        DBManager.closeDB()
    }
    
    
    // MARK: 生成标准的sql语句，并调用sqlManager的接口执行
    
    // 插入函数 假设properties都是数据表里标准的属性名
    static func insert(tableName: String, properties: [String: AnyObject]) -> Bool {
        var ImageData: NSData? = nil
        var sql1 = "INSERT OR REPLACE INTO " + tableName + "("
        var sql2 = " VALUES ("
        var newValue: String
        for (key, value) in properties {
            // 如果不是第一个属性，前面需要加逗号和一个空格
            if sql1[sql1.index(before: sql1.endIndex)] != "(" {
                sql1 = sql1 + ", "
                sql2 = sql2 + ", "
            }
            sql1 = sql1 + key
            // 如果当前的值是string类型，要加单引号，图片类型要单独处理
            // 其他类型则直接转换为String类型
            if value is String {
                newValue = ToolClass.addSingleQuotes(str: value as! String)
            }
            else if value is UIImage {
                sql2 = sql2 + "?"
                ImageData = UIImageToNSData(image: value as! UIImage)
                continue
            }
            else{
                newValue = anyobjConvertToStr(obj: value)!
            }
            sql2 = sql2 + newValue
        }
        sql1 = sql1 + ")"
        let sql = sql1 + sql2 + ");"
        
        print("exec \(sql)!")
        let result = DBManager.execNoneQuerySQL(sql: sql, imageData: ImageData)
        return result
    }
    
    // 更新函数 假设properties都是数据表里标准的属性名
    static func update(tableName: String, properties: [String: AnyObject], condition: String? = nil) -> Bool {
        var sql: String
        let sql1 = "UPDATE \(tableName) "
        var sql2 = "SET "
        var ImageData: NSData? = nil
        
        for (key, value) in properties {
            // sql2最后一个字符不是空格，那么要加上逗号和空格
            if sql2[sql2.index(before: sql2.endIndex)] != " " {
                sql2 = sql2 + ", "
            }
            var newValue: String
            // 根据value的值进行对应的转换
            if value is String {
                newValue = ToolClass.addSingleQuotes(str: value as! String)
            }
            else if value is UIImage {
                newValue = "?"
                ImageData = UIImageToNSData(image: value as! UIImage)
            }
            else{
                newValue = anyobjConvertToStr(obj: value)!
            }
            sql2 = sql2 + key + " = " + newValue
        }
        sql = sql1 + sql2
        if condition != nil {
            sql = sql + " WHERE " + condition!
        }
        sql = sql + ";"
        print(sql)
        let result = DBManager.execNoneQuerySQL(sql: sql, imageData: ImageData)
        return result
    }
    
    // 删除函数
    static func delete(tableName: String, condition: String? = nil) -> Bool {
        let sql: String
        if condition == nil {
            sql = "DELETE FROM \(tableName);"
        }
        else{
            sql = "DELETE FROM \(tableName) WHERE \(condition!);"

        }
        print(sql)
        let result = DBManager.execNoneQuerySQL(sql: sql)
        return result
    }
    
    
    // 查询函数
    static func select(tableName: String, columns: [String]? = nil, condition: String? = nil) -> [[String: AnyObject]]? {
        if columns == nil {
            var sql = "SELECT * FROM \(tableName)"
            if condition != nil {
                sql = sql + " WHERE \(condition!);"
            }
            else{
                sql = sql + ";"
            }
            print("exec " + sql)
            let result = DBManager.execQuerySQL(sql: sql)
//            debugPrint(result)
            return result
        }
        else {
            var sql: String
            var sql1 = "SELECT "
            let sql2 = " FROM \(tableName)"
            for column in columns! {
                if sql1[sql1.index(before: sql1.endIndex)] != " " {
                    sql1 = sql1 + ", "
                }
                sql1 = sql1 + column
            }
            sql = sql1 + sql2
            if condition != nil {
                sql = sql + " WHERE \(condition!);"
            }
            else{
                sql = sql + ";"
            }
            let result = DBManager.execQuerySQL(sql: sql)
//            debugPrint(result)
            return result
        }
        
    }
    
    static func dropTable(tableName: String) {
        _ = DBManager.execNoneQuerySQL(sql: "DROP TABLE \(tableName);")
    }
    
    // 将Anyobject转换为String类型
    static func anyobjConvertToStr(obj: AnyObject) -> String? {
        switch ToolClass.getType(obj: obj) {
        case 0:
            return String(obj as! Int)
        case 1:
            return String(obj as! Float)
        case 2:
            return String(obj as! Double)
        case 4:
            return obj as? String
        default:
            return nil
        }
    }
    
    // 将UIImage转化为NSData类型
    static func UIImageToNSData (image: UIImage) -> NSData {
        let data = image.jpegData(compressionQuality: 1)! as NSData
        return data
    }
}
