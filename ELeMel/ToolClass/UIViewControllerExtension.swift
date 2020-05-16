//
//  Extensions.swift
//  ELeMel
//
//  Created by thomas on 2020/5/9.
//  Copyright © 2020 thomas. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController{
    // 获取当前的viewcontroller
    class func current(base: UIViewController? = UIApplication.shared.keyWindow?.rootViewController ) -> UIViewController? {
        if let nav = base as? UINavigationController{
            return current(base: nav.visibleViewController)
        }
        else if let tab = base as? UITabBarController {
            return current(base: tab.selectedViewController)
        }
        else if let presented = base?.presentedViewController {
            return current(base: presented)
        }
        
        return base
    }
    
    // 获取当前状态栏和导航栏高度
    class func sumOfCurrentNaviBarHeightAndStatusBarHeight() -> CGFloat {
        return currentNaviBarHeight() + currentStatusBarHeight()
        
    }
    // 获取导航栏高度
    class func currentNaviBarHeight() -> CGFloat {

        return current()!.navigationController!.navigationBar.frame.size.height
    }
    // 获取状态栏高度
    class func currentStatusBarHeight() -> CGFloat {
        return UIApplication.shared.windows.first!.windowScene!.statusBarManager!.statusBarFrame.height
        
    }
}
