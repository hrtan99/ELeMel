//
//  RestaurantDetailPageViewController.swift
//  ELeMel
//
//  Created by thomas on 2020/5/8.
//  Copyright © 2020 thomas. All rights reserved.
//

import UIKit

class RestaurantDetailPageViewController: UIViewController {
    
//    var toolBarFrame:CGRect?
//    var tableViewFrame:CGRect?
//    var shopCartViewFrame:CGRect?
//
//    var toolBar:UIToolbar?
//    var tableView:UITableView?
//    var shopCartView:UIView?
    
    var scrollView:RestaurantPageUIScrollView?
    
   
    let STATUS_BAR_HEIGHT = UIApplication.shared.windows.first?.windowScene?.statusBarManager?.statusBarFrame.height   // 状态栏高度

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.hidesBottomBarWhenPushed = true
        initView()
    }
    
    
    
    
    func initView(){
        let NAVI_BAR_HEIGHT = self.navigationController!.navigationBar.frame.height
        
        self.view.backgroundColor = .white
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()   // 去除navigationbar下方的阴影横线
        self.navigationController?.navigationBar.isTranslucent = true
        
        // 让scrollview从屏幕顶端开始
        scrollView = RestaurantPageUIScrollView(frame: CGRect(x: 0, y: 0 - NAVI_BAR_HEIGHT - STATUS_BAR_HEIGHT!, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        debugPrint(scrollView?.frame)
        scrollView?.isScrollEnabled = true
        scrollView?.showsVerticalScrollIndicator = false
        scrollView?.contentSize = CGSize(width: 414, height: 1800)

//        // 工具栏 下面tableview 购物车的框架
//        toolBarFrame = CGRect(x: 0, y: 40, width: UIScreen.main.bounds.width, height: 40)
//        tableViewFrame = CGRect(x: 0, y: 80, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - self.navigationController!.navigationBar.frame.maxY-40)
//        shopCartViewFrame = CGRect(x: 0, y: UIScreen.main.bounds.height - self.tabBarController!.tabBar.bounds.height - self.navigationController!.navigationBar.frame.maxY, width: UIScreen.main.bounds.width, height: 80)
//        debugPrint(self.tabBarController!.tabBar.bounds.height)
//
//        toolBar = UIToolbar(frame: toolBarFrame!)
//
//        tableView = DishesListUITableView(frame: tableViewFrame!)
//        shopCartView = ShopCartUIView(frame: shopCartViewFrame!)
//        // 隐藏滚动条
//        tableView?.showsVerticalScrollIndicator = false
//
//        toolBarAddItem()
//
//        var view1 = UIView(frame: CGRect(x: 0, y: 0, width: 414, height: 40))
//        view1.backgroundColor = .brown
//        scrollView?.addSubview(view1)
//        scrollView!.addSubview(toolBar!)
//        scrollView!.addSubview(tableView!)
        self.view.addSubview(scrollView!)
//        debugPrint(scrollView!)
////        self.view.addSubview(toolBar!)
////        self.view.addSubview(tableView!)
//        self.view.addSubview(shopCartView!)
        
        
    }
    
    
//    func toolBarAddItem() {
//        let bookMealBtn = UIBarButtonItem(title: "点餐", style: .plain, target: self, action: #selector(bookMealBtnPressed))
//        let commentBtn = UIBarButtonItem(title: "评价", style: .plain, target: self, action: #selector(commentBtnPressed))
//        let restaurantInfoBtn = UIBarButtonItem(title: "商家", style: .plain, target: self, action: #selector(restaurantInfoBtnPressed))
//
//        toolBar!.setItems([bookMealBtn, commentBtn, restaurantInfoBtn], animated: false)
//
//    }
    
    
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
