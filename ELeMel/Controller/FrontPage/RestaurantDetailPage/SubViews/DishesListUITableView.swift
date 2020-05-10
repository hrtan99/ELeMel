//
//  DishesListUITableView.swift
//  ELeMel
//
//  Created by thomas on 2020/5/9.
//  Copyright © 2020 thomas. All rights reserved.
//

import UIKit

class DishesListUITableView: UITableView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    init(frame: CGRect) {
        super.init(frame: frame, style: .plain)
        let xib = UINib(nibName: "DishesTableViewCell", bundle: nil)
        self.register(xib, forCellReuseIdentifier: "DishesTableViewCell")
        self.delegate = self
        // 设置数据源为自己
        self.dataSource = self
        self.rowHeight = 120
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

extension DishesListUITableView: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DishesTableViewCell", for: indexPath) as! DishesTableViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        debugPrint("exec selected func")
        let currentVC = UIViewController.current()
        
        let newVC = UIViewController()
        newVC.view.backgroundColor = .white
        currentVC?.present(newVC, animated: true, completion: nil)
        
        
        
    }
}


