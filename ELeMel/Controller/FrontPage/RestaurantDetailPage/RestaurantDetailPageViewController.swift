//
//  RestaurantDetailPageViewController.swift
//  ELeMel
//
//  Created by thomas on 2020/5/8.
//  Copyright © 2020 thomas. All rights reserved.
//

import UIKit

class RestaurantDetailPageViewController: UIViewController {
    
    var toolBarFrame:CGRect?
    var tableViewFrame:CGRect?
    var subViewFrame:CGRect?
    var shopCartViewFrame:CGRect?
    
    var toolBar:UIToolbar?
    var tableView:UITableView?
    var subView:UIView?
    var shopCartView:UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.hidesBottomBarWhenPushed = true
        initView()
    }
    
    
    
    
    func initView(){
        self.view.backgroundColor = .white
        let navBarHeight = self.navigationController?.navigationBar.frame.height
        subViewFrame = CGRect(x: 0, y: navBarHeight!, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - navBarHeight!)
        toolBarFrame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 80)
        tableViewFrame = CGRect(x: 0, y: 80, width: UIScreen.main.bounds.width, height: subViewFrame!.height - 80)
        shopCartViewFrame = CGRect(x: 0, y: UIScreen.main.bounds.height - 80, width: UIScreen.main.bounds.width, height: 80)
        
        
        toolBar = UIToolbar(frame: toolBarFrame!)
        tableView = DishesListUITableView(frame: tableViewFrame!)
        shopCartView = ShopCartUIView(frame: shopCartViewFrame!)
        debugPrint(shopCartView)
        
        toolBarAddItem()
        
        
        subView = UIView(frame: subViewFrame!)
        
        subView!.addSubview(toolBar!)
        subView!.addSubview(tableView!)
        self.view.addSubview(subView!)
        self.view.addSubview(shopCartView!)
        
        
    }
    
    
    func toolBarAddItem() {
        let bookMealBtn = UIBarButtonItem(title: "点餐", style: .plain, target: self, action: #selector(bookMealBtnPressed))
        let commentBtn = UIBarButtonItem(title: "评价", style: .plain, target: self, action: #selector(commentBtnPressed))
        let restaurantInfoBtn = UIBarButtonItem(title: "商家", style: .plain, target: self, action: #selector(restaurantInfoBtnPressed))
        
        toolBar!.setItems([bookMealBtn, commentBtn, restaurantInfoBtn], animated: false)
        
    }
    
    
    // MARK: 设置按钮处理函数
    
    @objc func bookMealBtnPressed() {
        
    }
    
    @objc func commentBtnPressed() {
        
    }
    
    @objc func restaurantInfoBtnPressed() {
        
        
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
