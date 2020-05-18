//
//  ShopCartListHeaderView.swift
//  ELeMel
//
//  Created by thomas on 2020/5/14.
//  Copyright © 2020 thomas. All rights reserved.
//

import UIKit

class ShopCartListHeaderView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    var shopList: ShopCartListUITableView?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let xib = UINib(nibName: "ShopCartListHeaderView", bundle: nil)
        let headerView = xib.instantiate(withOwner: self, options: nil).first as! UIView
        self.addSubview(headerView)
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    @IBAction func removeAll(_ sender: Any) {
        // 调用购物车列表中所有cell的subButton函数来清空
        for i in 0 ..< ShopCartListUITableView.cells.count {
            for _ in 0 ..< ShopCartListUITableView.cells[i].num! {
                ShopCartListUITableView.cells[i].subButtonPressed(self)
            }
        }
        // headerview的父视图的父视图是shoplist
        (self.superview?.superview as! ShopCartListUITableView).showShopCartList(flag: false)
//        print("ShopCartListHeaderView.superView:")
//        debugPrint(self.superview?.superview)
    }
}
