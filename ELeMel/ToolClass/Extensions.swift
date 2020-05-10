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
    
}
