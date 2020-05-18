//
//  OrderDishListUIView.swift
//  ELeMel
//
//  Created by thomas on 2020/5/18.
//  Copyright © 2020 thomas. All rights reserved.
//

import UIKit

class OrderDishListUIView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    @IBOutlet weak var imageLabel: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var numLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let xib = UINib(nibName: "OrderDishList", bundle: nil)
        let view = xib.instantiate(withOwner: self, options: nil).first as! UIView
        self.addSubview(view)
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
