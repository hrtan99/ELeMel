//
//  ShopCartViewController.swift
//  ELeMel
//
//  Created by thomas on 2020/5/13.
//  Copyright © 2020 thomas. All rights reserved.
//

import UIKit

class ShopCartViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let tableview = UITableView(frame: CGRect(x: 0, y: 0, width: 414, height: 100))
        self.view.frame = CGRect(x: 0, y: 0, width: 414, height: 100)
        self.view.addSubview(tableview)
        
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
