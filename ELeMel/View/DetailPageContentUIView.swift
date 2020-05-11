//
//  DetailPageContentUIView.swift
//  ELeMel
//
//  Created by thomas on 2020/5/11.
//  Copyright © 2020 thomas. All rights reserved.
//

import UIKit

class DetailPageContentUIView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    var dishesContentView: DishesListUITableView?
    var commentContentView: CommentListUITableView?
    var RestaurantInfoContentView: RestaurantInfoUIView?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        initView()
        
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
//        fatalError("init(coder:) has not been implemented")
    }
    
    func initView(){
        // 先只放一个contentview测试一下
        
        let dishesContentViewFrame = CGRect(x: 0, y: 44, width: UIScreen.main.bounds.width, height: 800-44)
        dishesContentView = DishesListUITableView(frame: dishesContentViewFrame)
        dishesContentView?.showsVerticalScrollIndicator = false    // 隐藏滚动条
        
        self.addSubview(dishesContentView!)
        
        
    }

}

