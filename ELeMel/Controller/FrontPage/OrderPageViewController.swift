//
//  OrderPageViewController.swift
//  ELeMel
//
//  Created by thomas on 2020/5/14.
//  Copyright © 2020 thomas. All rights reserved.
//

import UIKit

class OrderPageViewController: UIViewController {
    
    var totalPrice: Float?
    var bottomBar: CreateOrderPageBarUIView?
    var scrollView: OrderPageUIScrollView?
    var restaurant: RestaurantModel?
    
    let SCREEN_WIDTH = UIScreen.main.bounds.width
    let SCREEN_HEIGHT = UIScreen.main.bounds.height
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        
        // Do any additional setup after loading the view.
        
        
        scrollView = OrderPageUIScrollView(frame: CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT))
        scrollView?.contentSize = CGSize(width: SCREEN_WIDTH, height: 1000)
        self.view.addSubview(scrollView!)
        
        bottomBar = CreateOrderPageBarUIView(frame: CGRect(x: 0, y: UIScreen.main.bounds.height - 84, width: UIScreen.main.bounds.width, height: 84))
        bottomBar?.totalPriceLabel.text = "总价：¥" + "\(self.totalPrice!)"
        self.view.addSubview(bottomBar!)
        
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
