//
//  FrontPageTableViewController.swift
//  ELeMel
//
//  Created by thomas on 2020/4/29.
//  Copyright © 2020 thomas. All rights reserved.
//

import UIKit

class FrontPageTableViewController: UITableViewController {
    
    var restaurants: [RestaurantModel]?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        restaurants = [RestaurantModel]()
        let count = DAO.getTableEntryCount(tableName: RestaurantTableField.TableName.rawValue)
        // 将所有的餐馆加载出来 直接根据id加载，因为餐馆的id是从1开始的
        for i in 0 ..< count {
            restaurants!.append(RestaurantModel(id: i + 1))
        }
        
        let xib = UINib(nibName: "RestaurantIntroductionTableViewCell", bundle: nil)
        tableView.register(xib, forCellReuseIdentifier: "RestaurantIntroductionCell")
        tableView.rowHeight = 100
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        // 返回餐馆的数目
        return restaurants!.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RestaurantIntroductionCell", for: indexPath) as! RestaurantIntroductionTableViewCell
        let restaurant = restaurants![indexPath.row]
        
        cell.icon.image = restaurant.restaurantIcon
        cell.name.text = restaurant.name
        cell.ratesLabel.text = "\(restaurant.rates!)"
        // Configure the cell...

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc1 = RestaurantDetailPageViewController()
        vc1.restaurant = restaurants![indexPath.row]  // 把餐馆对象传进去
        vc1.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(vc1, animated: true)
    }



    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    

}
