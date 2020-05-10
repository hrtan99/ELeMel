//
//  ShopCartUIView.swift
//  ELeMel
//
//  Created by thomas on 2020/5/9.
//  Copyright © 2020 thomas. All rights reserved.
//

import UIKit

class ShopCartUIView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let xib = UINib(nibName: "ShopCartUIView", bundle: nil)
        debugPrint(xib)
        let view = xib.instantiate(withOwner: self, options: nil).first as! UIView
        addSubview(view)

    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)

//        fatalError("init(coder:) has not been implemented")
    }
    
    override class func awakeFromNib() {
        
    }
}
