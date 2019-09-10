//
//  DetailViewController.swift
//  Smart Buys
//
//  Created by ipopat on 08/09/2019.
//  Copyright © 2019 rugyron. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var currentProduct = [String: String]()
    init(currentProduct: [String: String]) {
        super.init(nibName: nil, bundle: nil)
        self.currentProduct = currentProduct
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if currentProduct["Name"] != "" {
            navigationItem.title = "Настройки продукта"
        } else {
            navigationItem.title = "Добавление продукта"
        }

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
}
