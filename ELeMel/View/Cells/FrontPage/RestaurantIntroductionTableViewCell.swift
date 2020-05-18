//
//  RestaurantIntroductionTableViewCell.swift
//  ELeMel
//
//  Created by thomas on 2020/5/7.
//  Copyright © 2020 thomas. All rights reserved.
//

import UIKit

class RestaurantIntroductionTableViewCell: UITableViewCell {

    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var ratesLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
