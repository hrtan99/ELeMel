//
//  CreateOrderPageBarUIView.swift
//  ELeMel
//
//  Created by thomas on 2020/5/18.
//  Copyright © 2020 thomas. All rights reserved.
//

import UIKit

class CreateOrderPageBarUIView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    @IBOutlet weak var totalPriceLabel: UILabel!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        let xib = UINib(nibName: "CreateOrderPageBarUIView", bundle: nil)
        let view = xib.instantiate(withOwner: self, options: nil).first as! UIView
        self.addSubview(view)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @IBAction func createOrder(_ sender: Any) {
        let currentVC = UIViewController.current() as! OrderPageViewController
        
        // 获取当前系统时间
        let date = Date()
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "YYY-MM-dd HH:MM:SS"
        let time = timeFormatter.string(from: date)
        debugPrint(time)
        
        
        
        
        // 创建新订单
        var newOrder = OrderModel()
        
        newOrder.totalPrice = currentVC.totalPrice
        newOrder.createdTime = time
        newOrder.paymentMethod = "支付宝"      // 暂时先写死了
        newOrder.userId = AppDelegate.user.userID
        newOrder.restaurantID = currentVC.restaurant?.ID
        newOrder.dishesInfo = ToolClass.convert(from: ShopCartUIView.productions)
        do {
            try newOrder.saveToDB()
        }
        catch{
            print(error.self)
        }
        AppDelegate.user.orders?.append(newOrder)
        
        print("pls check if the order created:")
        debugPrint(DAO.select(tableName: "orderform"))
        debugPrint(DAO.select(tableName: "order2dish"))
    }
    
}