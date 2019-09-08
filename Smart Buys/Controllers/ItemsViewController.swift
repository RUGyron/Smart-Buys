//
//  ViewController.swift
//  Smart Buys
//
//  Created by ipopat on 08/09/2019.
//  Copyright © 2019 rugyron. All rights reserved.
//

import UIKit

class ItemsViewController: UITableViewController {
    
    var currentProduct = [String: Any]()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
//        let button = UIButton.attributedButton(frame: CGRect(x: 20, y: 20, width: 100, height: 40))
//        button.setTitle("Title", for: .normal)
//        self.view.addSubview(button)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as! ItemCell
        cell.setup(product: products[indexPath.row])
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        currentProduct = products[indexPath.row]
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.destination is DetailViewController {
            let viewController = segue.destination as! DetailViewController
            viewController.currentProduct = currentProduct
        }
    }
    
}

