//
//  OrderListPageUIScrollView.swift
//  ELeMel
//
//  Created by thomas on 2020/5/18.
//  Copyright © 2020 thomas. All rights reserved.
//

import UIKit

class OrderListPageUIScrollView: UIScrollView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    var topLabel: UILabel?
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        self.backgroundColor = .systemGray6
        self.showsVerticalScrollIndicator = false
        self.delegate = self
        
        initOrderList()
        
    }
    
    
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // 刷新视图
    func refresh() {
        // 移除所有子视图。重绘
        _ = self.subviews.map({$0.removeFromSuperview()})
        initOrderList()
    }
    
    func initOrderList() {
        
        topLabel = UILabel(frame: CGRect(x: 30, y: 0, width: 100, height: 50))
        topLabel!.text = "我的订单"
        topLabel?.font = UIFont(name: topLabel!.font.fontName, size: 24)
        topLabel!.textAlignment = .center
        self.addSubview(topLabel!)
        
        let orders = AppDelegate.user.orders
        if orders?.count != 0 {
            var j = 0
            for i in (0 ... orders!.count - 1).reversed() {
                let orderInfoCard = OrderInfoCardUIView(frame: CGRect(x: 17, y: topLabel!.frame.maxY + 8 + CGFloat(j) * 98, width: UIScreen.main.bounds.width - 34, height: 90))
                
                let res = RestaurantModel(id: orders![i].restaurantID!)
                let dish = ProductionModel(id: (orders![i].dishesInfo?.first!.key)!)
                orderInfoCard.restaurantNameLabel.text = res.name!
                orderInfoCard.restaurantIcon.image = res.restaurantIcon!
                orderInfoCard.totalPriceLabel.text = "¥\(orders![i].totalPrice!)"
                orderInfoCard.timeLabel.text = orders![i].createdTime!
                orderInfoCard.dishNameLabel.text = dish.name
                orderInfoCard.order = orders![i]
                if orders![i].dishesInfo!.count > 1 {
                    orderInfoCard.dishNameLabel.text = orderInfoCard.dishNameLabel.text! + "等\(orders![i].dishesInfo!.count)件商品"
                }
                
                
                self.addSubview(orderInfoCard)
                j = j + 1
            }
            self.contentSize = CGSize(width: UIScreen.main.bounds.width, height: CGFloat(orders!.count) * 98 + 50 + 20)

            
        }
        
        
        
    }
    
}

extension OrderListPageUIScrollView: UIScrollViewDelegate{
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offset = self.contentOffset.y + 88  // y方向的偏移
        
        // 控制顶部的透明度
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
