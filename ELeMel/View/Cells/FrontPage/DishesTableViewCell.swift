//
//  DishesTableViewCell.swift
//  ELeMel
//
//  Created by thomas on 2020/5/9.
//  Copyright © 2020 thomas. All rights reserved.
//

import UIKit

class DishesTableViewCell: UITableViewCell {

    @IBOutlet weak var subButton: UIButton!
    @IBOutlet weak var numberLabel: UILabel!   // 商品数量标签
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    var num: Int?  // 商品数量
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.selectionStyle = .none
        self.num = 0 // 初始点餐数量为0
        self.subButton.isHidden = true
        self.numberLabel.isHidden = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func addButtonPressed(_ sender: Any) {
        num! = num! + 1
        numberLabel.text = "\(num!)"
        if num! == 1 {
            subButton.isHidden = false
            numberLabel.isHidden = false
        }
        ShopCartUIView.addProduction(forname: nameLabel.text!, price: (priceLabel.text! as NSString).doubleValue)
        
        // 更新购物车列表
        ShopCartListUITableView.rows = ShopCartUIView.productions.count

        
    }
    @IBAction func subButtonPressed(_ sender: Any) {
        num! = num! - 1
        numberLabel.text = "\(num!)"   // 更新label
        if num == 0 {
            subButton.isHidden = true
            numberLabel.isHidden = true
        }
        ShopCartUIView.subProduction(forname: nameLabel.text!)
        
        // 更新购物车列表
        ShopCartListUITableView.rows = ShopCartUIView.productions.count

        
    }
    
}
