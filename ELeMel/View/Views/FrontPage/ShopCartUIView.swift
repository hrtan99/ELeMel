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
    static var productions =  [String: [String: Any]]()
    
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
    
    override class func awakeFromNib() {
        
    }
    
    func addTapGesture(){
        self.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapGestureAction))
        tapGesture.numberOfTapsRequired = 1
        self.addGestureRecognizer(tapGesture)
        
    }
    
    // 单击时触发的函数
    @objc func tapGestureAction() {
//        let newVC = ShopCartViewController()
//        let currentVC = UIViewController.current()
//        currentVC?.present(newVC, animated: true, completion: nil)
        
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
        
        
        let VC = UIViewController.current()
        let tbView = ShopCartListUITableView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), style: .plain)
        VC?.view.addSubview(tbView)
        
        tbView.shopCartDidPressed()
        debugPrint(ShopCartListUITableView.rows)
    }
    
    
    
}

extension ShopCartUIView {
    // 一次添加一个商品
    class func addProduction(forname: String, price: Double) {
        let production = productions[forname] // 得到产品
        if production == nil {
            productions.updateValue(["count": 0, "price": price], forKey: forname)
        }
        var newValue = productions[forname]
        let newCount = newValue!["count"] as! Int + 1
        newValue?.updateValue(newCount, forKey: "count")
        productions.updateValue(newValue!, forKey: forname)

        debugPrint(ShopCartUIView.productions)
    }
    
    class func subProduction(forname: String){
        var production = productions[forname]
        let newCount = production!["count"] as! Int - 1
        if newCount == 0 {
            // 数量为0删除商品
            productions.removeValue(forKey: forname)
            return
        }
        production!.updateValue(newCount, forKey: "count")
        productions.updateValue(production!, forKey: forname)
        
        debugPrint(productions)
    }
    
    
}
