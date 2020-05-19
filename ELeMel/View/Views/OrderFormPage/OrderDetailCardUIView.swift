//
//  OrderDetailCardUIView.swift
//  ELeMel
//
//  Created by thomas on 2020/5/19.
//  Copyright © 2020 thomas. All rights reserved.
//

import UIKit

class OrderDetailCardUIView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

    @IBOutlet weak var orderIDLabel: UILabel!
    @IBOutlet weak var createdTimeLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var paymentMethodLabel: UILabel!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        let xib = UINib(nibName: "OrderDetailCardUIView", bundle: nil)
        let view = xib.instantiate(withOwner: self, options: nil).first as! UIView
        self.addSubview(view)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
    
}
