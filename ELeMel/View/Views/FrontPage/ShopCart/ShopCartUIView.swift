//
//  ShopCartUIView.swift
//  ELeMel
//
//  Created by thomas on 2020/5/9.
//  Copyright © 2020 thomas. All rights reserved.
//

import UIKit

class ShopCartUIView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    // 购物车中的商品 ID: count 类型的键值对
    static var productions =  [[Int: Int]]()
    
    let currentVC = UIViewController.current()   // 当前的控制器
    let shopCartList = ShopCartListUITableView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), style: .plain)
    
    
    @IBOutlet weak var shopCartImage: UIImageView!
    @IBOutlet weak var totalPriceLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let xib = UINib(nibName: "ShopCartUIView", bundle: nil)
        debugPrint(xib)
        let view = xib.instantiate(withOwner: self, options: nil).first as! UIView
        addSubview(view)
        
        shopCartImage.layer.zPosition = .greatestFiniteMagnitude
//        products = [String: Int]()
        addTapGesture()

    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)

//        fatalError("init(coder:) has not been implemented")
    }
    
    
    // 结算按钮按下，进入提交订单页面
    @IBAction func createOrderButtonPressed(_ sender: Any) {
        if ShopCartUIView.productions.count == 0 {
            let alert = UIAlertController(title: "系统提示", message: "您还没有选择商品哦～\n请选择商品再来结算吧～", preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "取消", style: .cancel, handler: nil)
            let confirmAction = UIAlertAction(title: "好的", style: .default, handler: nil)
            alert.addAction(cancelAction)
            alert.addAction(confirmAction)
            UIViewController.current()?.present(alert, animated: true, completion: nil)
            return
            
        }
        let createOrderVC = OrderPageViewController()
        let VC = UIViewController.current() as! RestaurantDetailPageViewController
        createOrderVC.restaurant = VC.restaurant
        UIViewController.current()?.navigationController?.pushViewController(createOrderVC, animated: true)
    }
    

    
    // 添加触控事件
    func addTapGesture() {
        self.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapGestureAction))
        tapGesture.numberOfTapsRequired = 1
        self.addGestureRecognizer(tapGesture)
        
    }
    
    
    // 购物车单击时触发的函数
    @objc func tapGestureAction() {
        
        // 如果还没有选择商品就点购物车，弹窗提醒一下
        if ShopCartListUITableView.rows == 0 {
            let alert = UIAlertController(title: "系统提示", message: "您还没有选择商品哦～", preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "取消", style: .cancel, handler: nil)
            let confirmAction = UIAlertAction(title: "好的", style: .default, handler: nil)
            alert.addAction(cancelAction)
            alert.addAction(confirmAction)
            UIViewController.current()?.present(alert, animated: true, completion: nil)
            return
        }
        
        currentVC!.view.addSubview(shopCartList)
        
        shopCartList.shopCartDidPressed()
        debugPrint("ShopCartListUITableView.rows: " + String(ShopCartListUITableView.rows))
    }
    
    
    
}

extension ShopCartUIView {
    // 一次添加一个商品
    class func addProduction(forid: Int) {
        print("value of 'forid': " + String(forid))
        for i in 0 ..< productions.count {
            // 找到了对应id的count 更新并直接返回
            if productions[i][forid] != nil {
                let value = productions[i][forid]
                productions[i].updateValue(value! + 1, forKey: forid)
                return
            }
        }
        // 上面循环正常退出救市还没有设置对应商品
        productions.append([forid: 1])
        print("ShopCartUIView.productions:")
        debugPrint(ShopCartUIView.productions)
    }
    
    class func subProduction(forid: Int){
        for i in 0 ..< productions.count {
            // 找到了对应id的count 更新并直接返回
            if productions[i][forid] != nil {
                let value = productions[i][forid]
                // 如果value等于1直接移除
                if value == 1 {
                    productions.remove(at: i)
                    return
                }
                productions[i].updateValue(value! - 1, forKey: forid)
            }
        }
//        debugPrint(ShopCartUIView.productions)
    }
    
    // 更新购物车视图
    func updateShopCartView(){
        var totalPrice = 0.0
        for production in ShopCartUIView.productions {
            let dishes = (currentVC as! RestaurantDetailPageViewController).restaurant!.dishes!
            for dish in dishes {
                if let count = production[dish.ID!] {
                    totalPrice = totalPrice + Double(dish.price! * Float(count))
                }
            }
        }
        self.totalPriceLabel.text! = String(totalPrice)
    }
    
    
}
