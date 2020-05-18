//
//  paymentInfoCardUIView.swift
//  ELeMel
//
//  Created by thomas on 2020/5/15.
//  Copyright © 2020 thomas. All rights reserved.
//

import UIKit

class paymentInfoCardUIView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        let xib = UINib(nibName: "paymentInfoCardUIView", bundle: nil)
        let view = xib.instantiate(withOwner: self, options: nil).first as! UIView
        self.addSubview(view)
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
}
