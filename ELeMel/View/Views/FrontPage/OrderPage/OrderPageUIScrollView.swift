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
    
    let SCREEN_WIDTH = UIScreen.main.bounds.width
    let SCREEN_HEIGHT = UIScreen.main.bounds.height
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        initTopColorView()
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
    
    
}


extension OrderPageUIScrollView: UIScrollViewDelegate {
    // 监听滑动事件
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
    }
    
    
}
