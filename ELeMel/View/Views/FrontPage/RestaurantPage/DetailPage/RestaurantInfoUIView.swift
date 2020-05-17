//
//  RestaurantInfoUIView.swift
//  ELeMel
//
//  Created by thomas on 2020/5/11.
//  Copyright © 2020 thomas. All rights reserved.
//

import UIKit

class RestaurantInfoUIView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

    
    @IBOutlet weak var restaurantName: UILabel!
    @IBOutlet weak var category: UILabel!
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var phoneNumber: UILabel!
    @IBOutlet weak var openTime: UILabel!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let xib = UINib(nibName: "RestaurantInfoUIView", bundle: nil)
        let view = xib.instantiate(withOwner: self, options: nil).first as! UIView
        
        
        let currentVC = UIViewController.current() as! RestaurantDetailPageViewController
        let restaurant = currentVC.restaurant!
        
        // 设置商家图片
        for i in 0 ..< restaurant.restaurantPhoto!.count {
            let imageView = UIImageView(frame: CGRect(x: 8 + i * 78, y: 68, width: 70, height: 70))
            imageView.image = restaurant.restaurantPhoto![i]
            imageView.contentMode = .scaleToFill
            view.addSubview(imageView)
        }
        
        restaurantName.text = restaurant.name
        category.text = restaurant.category
        address.text = restaurant.address
        phoneNumber.text = restaurant.phoneNum
        openTime.text = restaurant.openTime
        self.addSubview(view)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
    
    

}
