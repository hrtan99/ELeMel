//
//  DetailPageContentUIView.swift
//  ELeMel
//
//  Created by thomas on 2020/5/11.
//  Copyright © 2020 thomas. All rights reserved.
//

import UIKit

class DetailPageContentUIView: UIScrollView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    var dishesContentView: DishesListUITableView?
    var commentContentView: CommentListUITableView?
    var restaurantInfoContentView: RestaurantInfoUIView?
    var shopCart: ShopCartUIView?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        // 滑动窗口的大小
        self.contentSize = CGSize(width: 3 * UIScreen.main.bounds.width, height: frame.height)
        initView()
        
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func initView(){
        let SCREEN_WIDTH = UIScreen.main.bounds.width
        
        // 采用scrollview进行左右滑动
        let dishesContentViewFrame = CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: 800-44)
        dishesContentView = DishesListUITableView(frame: dishesContentViewFrame)
        dishesContentView?.showsVerticalScrollIndicator = false    // 隐藏滚动条
        
        let commentContentViewFrame = CGRect(x: SCREEN_WIDTH, y: 0, width: SCREEN_WIDTH, height: 800-44)
        commentContentView = CommentListUITableView(frame: commentContentViewFrame)
        commentContentView?.showsVerticalScrollIndicator = false
        
        let restaurantInfoCardFrame = CGRect(x: 2 * SCREEN_WIDTH, y: 0, width: SCREEN_WIDTH, height: 800-44)
        restaurantInfoContentView = RestaurantInfoUIView(frame: restaurantInfoCardFrame)
        restaurantInfoContentView?.backgroundColor = .systemGray6
        
        
        
//        let shopCartFrame = CGRect(x: 0, y: UIScreen.main.bounds.height - 250 - 44 - 85, width: SCREEN_WIDTH, height: 85)
//        print("UIScreen.main.bounds.height: \(UIScreen.main.bounds.height)" )
//        shopCart = ShopCartUIView(frame: shopCartFrame)
        
        
        self.addSubview(dishesContentView!)
        self.addSubview(commentContentView!)
        self.addSubview(restaurantInfoContentView!)
//        self.dishesContentView!.addSubview(shopCart!)
        self.isScrollEnabled = true
        self.isPagingEnabled = true
        self.showsHorizontalScrollIndicator = false
        self.showsVerticalScrollIndicator = false
        
        
    }
    
    
    // 根据index切换视图， 值为0，1，2
    func changeView(index: Int) {
        
        self.setContentOffset(CGPoint(x: CGFloat(index) * UIScreen.main.bounds.width, y: 0), animated: true)
        
        
        
    }
    
    
    
    
    
    
    
    
    
    
    
    

}


