//
//  RestaurantPageUIScrollView.swift
//  ELeMel
//
//  Created by thomas on 2020/5/11.
//  Copyright © 2020 thomas. All rights reserved.
//

import UIKit

class RestaurantPageUIScrollView: UIScrollView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    var restaurantImageView: UIImageView?  // 餐馆首页的图片
    var restaurantInfoCard: RestaurantInfoCardUIView?   // 餐馆信息卡片
    var detailPage: DetailPageUIView?    // 点餐 评价等细节页面
    
    var originY: CGFloat?   // 初始的y坐标
    let ORIGIN_HEIGHT: CGFloat = 150
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        originY = frame.minY  // 记录初始的y坐标
        self.showsVerticalScrollIndicator = false //隐藏滑动条
        self.delegate = self
        initView()
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
//        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    func initView(){
        
        // 初始化餐馆首页图片
        let restaurantImageFrame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: ORIGIN_HEIGHT)
        restaurantImageView = UIImageView(frame: restaurantImageFrame) //暂时随便放个图
        restaurantImageView?.image = UIImage(named: "yabo")
        restaurantImageView?.contentMode = .scaleAspectFill
        
        // 初始化餐馆信息卡片
        let restaurantInfoCardFrame = CGRect(x: 0, y: 150, width: UIScreen.main.bounds.width, height: 150)
        restaurantInfoCard = RestaurantInfoCardUIView(frame: restaurantInfoCardFrame)
        
        // 初始化点餐评论等细节页面
        let detailPageFrame = CGRect(x: 0, y: 300, width: UIScreen.main.bounds.width, height: 800)
        detailPage = DetailPageUIView(frame: detailPageFrame)
        
        
        self.addSubview(restaurantImageView!)
        self.addSubview(restaurantInfoCard!)
        self.addSubview(detailPage!)
    }
    
    
    
    

}

extension RestaurantPageUIScrollView: UIScrollViewDelegate{
    // 监听滑动事件
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let yOffset = self.contentOffset.y - originY!    // y方向偏移 需要减掉初始的y坐标来修正
        debugPrint("scrollView offset: \(yOffset)")
        debugPrint("restaurantImageView y position: \(restaurantImageView!.frame.minY)")
        
        
        // 手指向下滑动的情况
        if(yOffset<0){
            var frame = restaurantImageView!.frame
            frame.origin.y = yOffset
            frame.size.height = ORIGIN_HEIGHT - yOffset
            restaurantImageView!.frame = frame
        }
        
        
        
    }
    
    
    
    
}
