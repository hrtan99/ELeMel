//
//  OrderInfoCardUIView.swift
//  ELeMel
//
//  Created by thomas on 2020/5/18.
//  Copyright © 2020 thomas. All rights reserved.
//

import UIKit

class OrderInfoCardUIView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    @IBOutlet weak var restaurantIcon: UIImageView!
    @IBOutlet weak var restaurantNameLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var dishNameLabel: UILabel!
    @IBOutlet weak var totalPriceLabel: UILabel!
    
    var order: OrderModel?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        let xib = UINib(nibName: "OrderInfoCardUIView", bundle: nil)
        let view = xib.instantiate(withOwner: self, options: nil).first as! UIView
        self.addSubview(view)
        restaurantIcon.layer.cornerRadius = 10
        view.layer.cornerRadius = 10
        self.layer.cornerRadius = 10
        addTapGesture()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // 添加单击事件
    func addTapGesture() {
        self.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapAction))
        tapGesture.numberOfTouchesRequired = 1
        self.addGestureRecognizer(tapGesture)
        
    }
    
    @objc func tapAction() {
        let currentVC = UIViewController.current()
        let newVC = OrderFormPageViewController()
        newVC.order = self.order
        currentVC?.navigationController?.pushViewController(newVC, animated: true)
    }
    
    
}
