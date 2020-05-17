//
//  ShopCartListUITableView.swift
//  ELeMel
//
//  Created by thomas on 2020/5/13.
//  Copyright © 2020 thomas. All rights reserved.
//

import UIKit

class ShopCartListUITableView: UITableView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    static var isShow: Bool = false
    static var rows: Int = 0   // 行数，对应商品的种类
    static var cells: [DishesTableViewCell] = [DishesTableViewCell]()

    var myBackgroundView: UIView?

    let cellHeight:Int = 44
    let animationDuration:TimeInterval = 0.25 // 动画时间
    let maxHeight = UIScreen.main.bounds.height * 0.6
    // 动画开始和结束时的frame
    let initFrame = CGRect(x: 0, y: UIScreen.main.bounds.height - 85, width: UIScreen.main.bounds.width, height: 0)

    
    let bgInitFrame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - 85)
    
    // 记录顶部导航栏透明度
    static var recordNaviBarAlpha:CGFloat = 0
     
    override init(frame: CGRect, style: UITableView.Style) {
        
        super.init(frame: initFrame, style: style)
        
        let xib = UINib(nibName: "ShopCartListTableViewCell", bundle: nil)
        self.register(xib, forCellReuseIdentifier: "cell")
        
        self.dataSource = self
        self.delegate = self
        self.bounces = false
        self.alwaysBounceVertical = false
        
        // 设置headerView
        let headerView = ShopCartListHeaderView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 35))
        headerView.shopList = self
        print("headerView.shopList = self: ")
        debugPrint(headerView.shopList ?? nil!)
        self.tableHeaderView = headerView
        
        // cell的行高
        self.rowHeight = CGFloat(cellHeight)
        
        myBackgroundView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - 85))
        myBackgroundView?.backgroundColor = .gray
        myBackgroundView?.alpha = 0
        addTapGestrueForBackground()
        
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
        
    // 购物车被点击会执行这个函数
    func shopCartDidPressed(){
        // 当前是展开状态则关闭
        if ShopCartListUITableView.isShow {
            showShopCartList(flag: false)
            ShopCartListUITableView.isShow = false
            return
            
        }
        else {
            showShopCartList(flag: true)
            ShopCartListUITableView.isShow = true
            return
        }
        
        
    }
    
    
    // 显示购物车列表
    func showShopCartList(flag: Bool){
        let finalFrame = CGRect(x: 0, y: UIScreen.main.bounds.height - self.rowHeight * CGFloat(ShopCartListUITableView.rows) - 85 - 35, width: UIScreen.main.bounds.width, height: self.rowHeight * CGFloat(ShopCartListUITableView.rows) + 35)
        let bgFinalFrame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: finalFrame.origin.y)
        
        if flag {
            UIApplication.shared.windows.first?.addSubview(myBackgroundView!)
//            superview?.addSubview(myBackgroundView!)
            superview?.addSubview(self)
            self.reloadData()
            UIView.animate(withDuration: animationDuration){
                self.myBackgroundView?.alpha = 0.5
                self.myBackgroundView?.frame = bgFinalFrame
                self.frame = finalFrame
                
            }
            
        }
        else{
            UIView.animate(withDuration: animationDuration, animations: {
                // 背景先变透明 菜单先收缩
                self.myBackgroundView?.alpha = 0
                self.myBackgroundView?.frame = self.bgInitFrame
                self.frame = self.initFrame
            })
            {   // 然后从父视图移除
                (_) in
                self.myBackgroundView?.removeFromSuperview()
                self.removeFromSuperview()
            }
            
            
        }
        
        
    }
    
    
}

extension ShopCartListUITableView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        
        return ShopCartListUITableView.rows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("value of indexpath.row: " + String(indexPath.row))
        let cell = self.dequeueReusableCell(withIdentifier: "cell") as! ShopCartListTableViewCell
        cell.selectionStyle = .none
         
        // 根据productions修改购物车的cell 改为和商品对应的数据
        let production = ShopCartUIView.productions[indexPath.row]
        let VC = UIViewController.current() as! RestaurantDetailPageViewController
        
        for d in VC.restaurant!.dishes! {
            if let count = production[d.ID!] {
                cell.numLabel.text! = String(count)
                cell.nameLabel.text! = d.name!
                cell.priceLabel.text! = String(d.price!)
            }
        }
        
        
        return cell
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    
    
    
}

// 为背景添加点击事件
extension ShopCartListUITableView {
    func addTapGestrueForBackground() {
        self.myBackgroundView?.isUserInteractionEnabled = true  // 设置可交互
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(myBackgroundTapped))
        
        tapGesture.numberOfTouchesRequired = 1
        self.myBackgroundView?.addGestureRecognizer(tapGesture)
        
    }
    
    // 单击背景收起购物车
    @objc func myBackgroundTapped() {
        print("myBackgroundTapped!")
        showShopCartList(flag: false)
    }
    
    
}
