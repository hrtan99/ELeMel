//
//  RestaurantDetailPageViewController.swift
//  ELeMel
//
//  Created by thomas on 2020/5/8.
//  Copyright © 2020 thomas. All rights reserved.
//

import UIKit

class RestaurantDetailPageViewController: UIViewController {
    

    var scrollView:RestaurantPageUIScrollView?
    
   
    let STATUS_BAR_HEIGHT = UIApplication.shared.windows.first?.windowScene?.statusBarManager?.statusBarFrame.size.height   // 状态栏高度

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.hidesBottomBarWhenPushed = true
        initView()
    }

    func initView(){
        
        
        self.view.backgroundColor = .white

        self.navigationController?.navigationBar.barTintColor = .white
        self.navigationController?.navigationBar.shadowImage = UIImage()   // 去除navigationbar下方的阴影横线
        self.navigationController?.navigationBar.isTranslucent = true
        
        // 让scrollview从屏幕顶端开始
        scrollView = RestaurantPageUIScrollView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
//        debugPrint(scrollView?.frame)
        scrollView?.isScrollEnabled = true
        scrollView?.showsVerticalScrollIndicator = false
        scrollView?.contentSize = CGSize(width: 414, height: 1800)


        self.view.addSubview(scrollView!)
        
        
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
