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
    // 购物车中的商品
    static var productions =  [[String: Any]]()
    
    let currentVC = UIViewController.current()   // 当前的控制器
    let shopCartList = ShopCartListUITableView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), style: .plain)
    
    
    @IBOutlet weak var totalPriceLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let xib = UINib(nibName: "ShopCartUIView", bundle: nil)
        debugPrint(xib)
        let view = xib.instantiate(withOwner: self, options: nil).first as! UIView
        addSubview(view)
        
//        products = [String: Int]()
        addTapGesture()

    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)

//        fatalError("init(coder:) has not been implemented")
    }
    
    
    // 结算按钮按下，进入提交订单页面
    @IBAction func createOrderButtonPressed(_ sender: Any) {
        let createOrderVC = OrderPageViewController()
        UIViewController.current()?.navigationController?.pushViewController(createOrderVC, animated: true)
    }
    
    override class func awakeFromNib() {
        
    }
    
    // 添加触控板事件
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
        debugPrint(ShopCartListUITableView.rows)
    }
    
    
    
}

extension ShopCartUIView {
    // 一次添加一个商品
    class func addProduction(forname: String, price: Double) {
        
        for i in 0 ..< productions.count {
            // 找到对应的商品count加一
            if (productions[i])["name"] as! String == forname {
                print("finded product!")
                (productions[i])["count"] = productions[i]["count"] as! Int + 1
                debugPrint(productions)
                return
            }
            
            
        }
        // 上面没添加成功在这里添加
        productions.append(["name": forname, "price": price, "count": 1 ])
        debugPrint(ShopCartUIView.productions)
    }
    
    class func subProduction(forname: String){
        for i in 0 ..< productions.count {
            // 找到对应的商品count减一
            if productions[i]["name"] as! String == forname {
                productions[i]["count"] = productions[i]["count"] as! Int - 1
                
                if productions[i]["count"] as! Int == 0 {
                    productions.remove(at: i)
                }
                debugPrint(productions)
                return
            }
            
            
        }
        

    }
    
    // 更新购物车视图
    func updateShopCartView(){
        var totalPrice = 0.0
        for production in ShopCartUIView.productions {
            totalPrice = Double((production["count"] as! Int)) * (production["price"] as! Double) + totalPrice
        }
        self.totalPriceLabel.text! = String(totalPrice)
    }
    
    
}
