//
//  DishesListUITableView.swift
//  ELeMel
//
//  Created by thomas on 2020/5/9.
//  Copyright © 2020 thomas. All rights reserved.
//

import UIKit

class DishesListUITableView: UITableView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
//    var shopCart:ShopCartUIView
    var dishes: [ProductionModel]?
    
    
    init(frame: CGRect) {
        super.init(frame: frame, style: .plain)
        let xib = UINib(nibName: "DishesTableViewCell", bundle: nil)
        self.register(xib, forCellReuseIdentifier: "DishesTableViewCell")
        self.delegate = self
        // 设置数据源为自己
        self.dataSource = self
        self.rowHeight = 120
        
        // 初始化商品
        let currentVC = UIViewController.current() as! RestaurantDetailPageViewController
        dishes = currentVC.restaurant!.dishes
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

extension DishesListUITableView: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dishes!.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DishesTableViewCell", for: indexPath) as! DishesTableViewCell
        let dish = dishes![indexPath.row]
        cell.id = dish.ID // 吧id传进去
        cell.icon.image = dish.productionPhoto
        cell.nameLabel.text = dish.name
        cell.infoLabel.text = dish.info
        cell.saleCountLabel.text = String(dish.saleCount!)
        cell.priceLabel.text = String(dish.price!)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let currentVC = UIViewController.current() as! RestaurantDetailPageViewController
        let cell = cellForRow(at: indexPath) as! DishesTableViewCell
        let newVC = MealInfoViewController()
        // 设置相关属性
        newVC.cell = cell
        newVC.superViewController = currentVC
        newVC.dish = dishes![indexPath.row]
        
        currentVC.present(newVC, animated: true, completion: nil)
        
        
        
    }
}


