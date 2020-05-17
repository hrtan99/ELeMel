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
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var saleCountLabel: UILabel!
    @IBOutlet weak var icon: UIImageView!
    
    var num: Int?  // 商品数量
    var id: Int?   // 对应的production的id
    
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
            
            // 从0变成1，把自己这个cell加入到shopcartlist的cells中，方便更新
            ShopCartListUITableView.cells.append(self)
        }
        
        // 将对应的production加一
        ShopCartUIView.addProduction(forid: self.id!)
        
        // 更新购物车列表
        ShopCartListUITableView.rows = ShopCartUIView.productions.count
        
        var VC = UIViewController.current()
        if VC is MealInfoViewController {
            VC = (VC as! MealInfoViewController).superViewController!
        }
        
        (VC as! RestaurantDetailPageViewController).shopCart!.updateShopCartView()
        
    }
    
    @IBAction func subButtonPressed(_ sender: Any) {
        num! = num! - 1
        numberLabel.text = "\(num!)"   // 更新label
        if num == 0 {
            subButton.isHidden = true
            numberLabel.isHidden = true
            
            // 变成0， 从cells中移除
            ShopCartListUITableView.cells.append(self)
        }
        ShopCartUIView.subProduction(forid: self.id!)
        
        // 更新购物车列表
        ShopCartListUITableView.rows = ShopCartUIView.productions.count
        
        let VC = UIViewController.current()
        // 先判断类型
        if VC is RestaurantDetailPageViewController {
            (VC as! RestaurantDetailPageViewController).shopCart!.updateShopCartView()
        }
        else {
            (VC as! MealInfoViewController).superViewController!.shopCart!.updateShopCartView()
            
        }
        
    }
    
}
