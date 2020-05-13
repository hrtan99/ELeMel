//
//  DetailPageTitleUIView.swift
//  ELeMel
//
//  Created by thomas on 2020/5/11.
//  Copyright © 2020 thomas. All rights reserved.
//

import UIKit

class DetailPageTitleUIView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let xib = UINib(nibName: "DetailPageTitleUIView", bundle: nil)
        let view = xib.instantiate(withOwner: self, options: nil).first as! UIView
        addSubview(view)
        
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // 按下对应的按钮 contentview应该进行切换
    @IBAction func bookMealBttonPressed(_ sender: UIButton) {
        let controller = UIViewController.current() as! RestaurantDetailPageViewController
        controller.scrollView?.detailPage?.contentView?.changeView(index: 0)
    }
    

    @IBAction func commentBttonPressed(_ sender: UIButton) {
        let controller = UIViewController.current() as! RestaurantDetailPageViewController
        controller.scrollView?.detailPage?.contentView?.changeView(index: 1)
    }
    

    @IBAction func restaurantButtonPressed(_ sender: UIButton) {
        let controller = UIViewController.current() as! RestaurantDetailPageViewController
        controller.scrollView?.detailPage?.contentView?.changeView(index: 2)
        
        
    }
    
}
