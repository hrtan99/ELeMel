//
//  OrderPageUIScrollView.swift
//  ELeMel
//
//  Created by thomas on 2020/5/14.
//  Copyright © 2020 thomas. All rights reserved.
//

import UIKit

class OrderPageUIScrollView: UIScrollView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    // 顶部的渐变颜色块
    var topColorView: UIView?
    var paymentCard: UIView?
    var orderListView: UIView?
    var baseView: UIView?
    
    let SCREEN_WIDTH = UIScreen.main.bounds.width
    let SCREEN_HEIGHT = UIScreen.main.bounds.height
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .systemGray5
        self.showsVerticalScrollIndicator = false
        self.delegate = self
        
        initTopColorView()
        initBaseView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // 初始化顶部的渐变颜色块
    func initTopColorView() {
        topColorView = UIView(frame: CGRect(x: 0, y: 0 - UIViewController.currentNaviBarHeight(), width: SCREEN_WIDTH, height: SCREEN_HEIGHT * 0.3))
        
        // 定义渐变的颜色 从橙色到黄色
        let topColor = UIColor(red: 0xfc/255, green: 0x68/255, blue: 0x20/255, alpha: 1)    // 顶部颜色为橙色
        let bottomColor = UIColor(red: 0xfe/255, green: 0xd3/255, blue: 0x2f/255, alpha: 1)     // 中部颜色为黄色
        
        let grandientColors = [topColor.cgColor, bottomColor.cgColor, UIColor.white.cgColor]
        
        // 定义grandientColors中每种颜色所在位置
        let grandientLocations: [NSNumber] = [0.0, 0.5, 1]
        
        // 创建CAGrandientLayer对象并设置参数
        let grandientLayer = CAGradientLayer()
        grandientLayer.colors = grandientColors
        grandientLayer.locations = grandientLocations
        
        // 设置为topColorView的layer
        grandientLayer.frame = topColorView!.frame
        topColorView!.layer.insertSublayer(grandientLayer, at: 0)

        self.addSubview(topColorView!)
    }
    
    func initPaymentCard() {
        paymentCard = paymentInfoCardUIView(frame: CGRect(x: 0, y: 0, width: baseView!.frame.size.width, height: 200))
        debugPrint(baseView!.frame.size.width)
        baseView!.addSubview(paymentCard!)
    }
    
    // 订单中的菜品列表
    func initOrderListView() {
        let currentVC = UIViewController.current() as! OrderPageViewController
        
        let headView = UIView(frame: CGRect(x:0, y: 0, width:baseView!.bounds.width, height: 50))
        let headLabel = UILabel(frame: CGRect(x:20, y: 0, width:baseView!.bounds.width - 20, height: 50))
        headView.backgroundColor = .white
        headLabel.text = currentVC.restaurant?.name
        headLabel.textAlignment = .left
        headView.addSubview(headLabel)
        
        var dishesView =  [OrderDishListUIView]()
         // 根据购物车添加菜品
        var totalPrice:Float = 0
        var i = 0
        for dic in ShopCartUIView.productions {
            // 找到id对应的dish
            for dish in currentVC.restaurant!.dishes! {
                if let count = dic[dish.ID!] {
                    let newView = OrderDishListUIView(frame: CGRect(x: 0, y: 50 + i * 50, width: Int(baseView!.bounds.width), height: 50))
                    newView.imageLabel.image = dish.productionPhoto
                    newView.numLabel.text = String(count)
                    newView.nameLabel.text = dish.name
                    newView.priceLabel.text = "\(dish.price!)"
                    
                    totalPrice = totalPrice + dish.price! * Float(count)
                    dishesView.append(newView)
                    i = i + 1
                    
                }
                
            }
            
        }
        debugPrint(dishesView)
        
        let footView = UIView(frame: CGRect(x: 0, y: dishesView.last!.frame.origin.y + 50, width: baseView!.bounds.width, height: 50))
        let footViewLabel = UILabel(frame: CGRect(x: 0, y: 0, width: (baseView?.bounds.width)! - 30, height: 50))
        footView.backgroundColor = .white
        footViewLabel.textAlignment = .right
        footViewLabel.text = "总计： ¥" + "\(totalPrice)"
        footView.addSubview(footViewLabel)
        
        orderListView = UIView(frame: CGRect(x: 0, y: paymentCard!.frame.maxY + 8, width: baseView!.bounds.width, height: footView.frame.maxY + 50))
        
        orderListView?.addSubview(headView)
        for i in 0 ..< dishesView.count {
            orderListView?.addSubview(dishesView[i])
        }
        orderListView?.addSubview(footView)
        
        baseView?.addSubview(orderListView!)
        
        // 顺便更新底部bar的总价
        currentVC.totalPrice = totalPrice
        
        
        
    }
    
    
    
    func initBaseView() {
        baseView = UIView(frame: CGRect(x: 8, y: 0, width: SCREEN_WIDTH - 16, height: 1000))
        baseView!.backgroundColor = .systemGray6
        
        
        
        self.addSubview(baseView!)
        
        initPaymentCard()
        initOrderListView()
        
    }
    
    
    
    
}


extension OrderPageUIScrollView: UIScrollViewDelegate {
    // 监听滑动事件
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offset = self.contentOffset.y + 88  // y方向的偏移
//        debugPrint(self.contentOffset.y)
        if offset < 0 {
            var frame = topColorView!.frame
            frame.origin.y = offset - 88
            frame.size.height = SCREEN_HEIGHT * 0.3 - offset
            topColorView!.frame = frame
        }

        let naviVC = UIViewController.current()?.navigationController
        if offset < 44 {
            let alpha = offset / 44
            naviVC?.navigationBar.subviews.first?.alpha = max(0, alpha)
        }
        else {
            naviVC?.navigationBar.subviews.first?.alpha = 1
        }
            

        
        
        
    }
    
    
}
