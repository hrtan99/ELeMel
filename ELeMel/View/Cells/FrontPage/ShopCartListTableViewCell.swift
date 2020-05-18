//
//  ShopCartListTableViewCell.swift
//  ELeMel
//
//  Created by thomas on 2020/5/13.
//  Copyright © 2020 thomas. All rights reserved.
//

import UIKit

class ShopCartListTableViewCell: UITableViewCell {

    @IBOutlet weak var numLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func addButtonPressed(_ sender: Any) {
        for i in 0 ..< ShopCartListUITableView.cells.count {
            if ShopCartListUITableView.cells[i].nameLabel.text == self.nameLabel.text {
                ShopCartListUITableView.cells[i].addButtonPressed(self)
            }
            
        }
        (self.superview as! ShopCartListUITableView).reloadData()
    }
    @IBAction func subButtonPressed(_ sender: Any) {
        for i in 0 ..< ShopCartListUITableView.cells.count {
            if ShopCartListUITableView.cells[i].nameLabel.text == self.nameLabel.text {
                ShopCartListUITableView.cells[i].subButtonPressed(self)
            }
        }
        (self.superview as! ShopCartListUITableView).reloadData()

    }
}
