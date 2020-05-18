//
//  MealInfoViewController.swift
//  ELeMel
//
//  Created by thomas on 2020/5/12.
//  Copyright © 2020 thomas. All rights reserved.
//

import UIKit

class MealInfoViewController: UIViewController {

    var cell: DishesTableViewCell?
    var superViewController: RestaurantDetailPageViewController?
    var dish: ProductionModel?
    
    @IBOutlet weak var numLabel: UILabel!
    @IBOutlet weak var subButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var saleCountLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var ingredientLabel: UILabel!
    var num: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.num = cell?.num
        self.numLabel.text = "\(num!)"
        if num == 0{
            numLabel.isHidden = true
            subButton.isHidden = true
        }
        initLabels()
    }
    
    func initLabels() {
        nameLabel.text = dish!.name
        saleCountLabel.text = "月售" + String(dish!.saleCount!)
        priceLabel.text = String(dish!.price!)
        infoLabel.text = dish!.info
        ingredientLabel.text = "主要原料:" + dish!.ingredients!
        imageView.image = dish!.productionPhoto!
        imageView.contentMode = .scaleAspectFill
    }
    
    
    // MARK:- 处理选择商品
    @IBAction func addButtonPressed(_ sender: Any) {
        cell?.addButtonPressed(self)
        num! = num! + 1
        numLabel.text = "\(num!)"
        if num == 1 {
            numLabel.isHidden = false
            subButton.isHidden = false
        }
    }
    
    @IBAction func subButtonPressed(_ sender: Any) {
        cell?.subButtonPressed(self)
        num! = num! - 1
        numLabel.text = "\(num!)"
        if num == 0 {
            numLabel.isHidden = true
            subButton.isHidden = true
        }
    }
    @IBAction func closeButtonPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func chooseButtonPressed(_ sender: Any) {
        if num == 0 {
            self.addButtonPressed(self)
        }
//        cell?.addButtonPressed(self)
        self.dismiss(animated: true, completion: nil)
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
