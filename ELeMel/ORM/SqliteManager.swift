//
//  SqliteManager.swift
//  ELeMel
//
//  Created by thomas on 2020/5/15.
//  Copyright © 2020 thomas. All rights reserved.
//

import Foundation
import UIKit

class SQLiteManager:NSObject{
    private var dbPath:String!          // 数据库路径
    private var dataBase:OpaquePointer? = nil           // 数据库指针 指向数据库
    
    static var sharedInstance:SQLiteManager{
        return SQLiteManager()
        
    }
    
    override init() {
        super.init()
        
        let dirPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        
        dbPath = dirPath.appendingPathComponent("app.sqlite").path
        
        
    }
    
    // 打开数据库连接
    func openDB() -> Bool {
        let result = sqlite3_open(dbPath, &dataBase)    // 数据库如果不存在会自动创建
        if result != SQLITE_OK {                        // 返回OK表示成功打开连接
            print("open database failed!")
            return false
        }
        return true
    }
    
    // 关闭数据库连接
    func closeDB() {
        sqlite3_close(dataBase)
    }
    
    // 可以执行增删改创建操作
    func execNoneQuerySQL(sql: String, imageData:NSData? = nil) -> Bool{
        
        var errMsg:UnsafeMutablePointer<Int8>? = nil
        let cSql = sql.cString(using: String.Encoding.utf8)!
        
        // 如果有图片数据
        if imageData != nil {
            var statement:OpaquePointer? = nil
            if sqlite3_prepare_v2(dataBase, sql, -1, &statement, nil) != SQLITE_OK {
                print("prepare error for \(sql)")
                return false
                
            }
            let count = sqlite3_bind_parameter_count(statement)
            if count != 1 {
                print("parameters number error when exec \(sql)")
                return false
            }
            if sqlite3_bind_blob(statement, 1, imageData!.bytes, Int32(imageData!.length), nil) != SQLITE_OK{
                print("bind blob error:\(sql)")
                sqlite3_finalize(statement)
                return false
            }
            // 执行
            let rslt = sqlite3_step(statement)
            if rslt != SQLITE_OK && rslt != SQLITE_DONE{
                print("extue blob error:\(sql)")
                sqlite3_finalize(statement)
                return false
            }
            // 释放资源
            sqlite3_finalize(statement)
            return true
            
        }
        
        /*
         参数
         1.db：OpaquePointer！ 已打开的数据库具柄
         2.sql：执行的sql
         3.callback：回调函数
         4.自定义指针，会传递到回调函数内
         5.errmsg：错误信息
         */
        
        if sqlite3_exec(dataBase, cSql, nil, nil, &errMsg) == SQLITE_OK{
            return true
        }
        
        let msg = String.init(cString: errMsg!)
        print(msg)
        return false
        
    }
    
    // 执行查询操作
    func execQuerySQL(sql: String) -> [[String:AnyObject]]? {
        let cSql = sql.cString(using: String.Encoding.utf8)!
        var statement:OpaquePointer? = nil
        
        /*
         参数：
         1. db： 已打开的数据库句柄
         2. sql： 要执行的sql语句
         3. nByte： 以字节为单位的sql语句长度 -1表示使用整个字符串
         4. statement： 语句句柄，据此获得查询结果，需要sqlite3_finalize来释放内存
         5. _ pzTail： 未使用的指针地址，通常为nil
         */
        if sqlite3_prepare_v2(dataBase, sql, -1, &statement, nil) != SQLITE_OK{
            
            //失败释放内存
            sqlite3_finalize(statement)
            print("exec\(sql)failed\n")
            let errmsg = sqlite3_errmsg(dataBase)
            if errmsg != nil{
                print(errmsg!)
            }
            return nil
        }
        // 存储返回的数据
        var rows = [[String:AnyObject]]()
        // 每次添加一行
        while sqlite3_step(statement) == SQLITE_ROW {
            rows.append(record(stmt: statement!))
        }
        
        sqlite3_finalize(statement)
        return rows
    }
    
    // 每次转换一行
    private func record(stmt: OpaquePointer) -> [String:AnyObject]{
        
        var row = [String:AnyObject]()
        // 遍历所有列，获取每一列的信息
        for col in 0 ..< sqlite3_column_count(stmt){
            //获取列名
            let cName = sqlite3_column_name(stmt, col)
            let name = String(cString: cName!, encoding: String.Encoding.utf8)
            
            var value:AnyObject?
            
            switch sqlite3_column_type(stmt, col) {
            case SQLITE_FLOAT:
                value = sqlite3_column_double(stmt, col) as AnyObject
                break
            case SQLITE_INTEGER:
                value = sqlite3_column_int(stmt, col) as AnyObject
                break
            case SQLITE3_TEXT:
                let cText = sqlite3_column_text(stmt, col)
                value = String.init(cString: cText!) as AnyObject
                break
            case SQLITE_BLOB:
                if let blob = sqlite3_column_blob(stmt, col) {
                    let blobLen = sqlite3_column_bytes(stmt, col)
                    let data = Data(bytes: blob, count: Int(blobLen))
                    value = UIImage(data: data)
                }
                else{
                    print("error when convert blob!")
                }
                break
            case SQLITE_NULL:
                value = NSNull()
            default:
                print("data type not surpport!")
            }
            
            row[name!] = value ?? NSNull()
            
        }
        
        return row
        
        
    }
    
}
