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
    var myBackgroundView: UIView?

    // 动画开始和结束时的frame
    let initFrame = CGRect(x: 0, y: 810, width: UIScreen.main.bounds.width, height: 0)
//    let finalFrame = CGRect(x: 0, y: 550, width: UIScreen.main.bounds.width, height: 260)
    let cellHeight:Int = 44
    let animationDuration:TimeInterval = 0.5 // 动画时间
    
    override init(frame: CGRect, style: UITableView.Style) {
        
        super.init(frame: initFrame, style: style)
        
        let xib = UINib(nibName: "ShopCartListTableViewCell", bundle: nil)
        self.register(xib, forCellReuseIdentifier: "cell")
        
        // 设置headerView
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 44))
        headerView.backgroundColor = .brown
        self.tableHeaderView = headerView
        
        self.rowHeight = CGFloat(cellHeight)
        
        myBackgroundView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - 85))
        myBackgroundView?.backgroundColor = .gray
        myBackgroundView?.alpha = 0
        
        
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
            
        }
        else {
            showShopCartList(flag: true)
            ShopCartListUITableView.isShow = true
        }
        
        
    }
    
    
    
    func showShopCartList(flag: Bool){
        superview?.addSubview(myBackgroundView!)
        superview?.addSubview(self)
        
        let finalFrame = CGRect(x: 0, y: UIScreen.main.bounds.height - self.rowHeight - 85 - 44, width: UIScreen.main.bounds.width, height: self.rowHeight + 50)
        if flag {
            
            UIView.animate(withDuration: animationDuration){
                self.myBackgroundView?.alpha = 0.5
                self.frame = finalFrame
                
                
                
            }
            
            
            
        }
        else{
            
            
            
            
        }
        
        
        
        
        
        
        
        
        
        
    }
    
    
    
    
    
}

extension ShopCartListUITableView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        
        return ShopCartListUITableView.rows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.dequeueReusableCell(withIdentifier: "cell")!
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    
    
    
    
    
    
}
