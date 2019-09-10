//
//  ViewController.swift
//  Smart Buys
//
//  Created by ipopat on 08/09/2019.
//  Copyright © 2019 rugyron. All rights reserved.
//

import UIKit

class ItemsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var footerView: UIView!
    @IBOutlet weak var addProductButton: UIButton!
    @IBOutlet weak var setBudgetButton: UIButton!
    @IBOutlet weak var freeLocalBudget: UILabel!
    @IBOutlet weak var freePublicBudget: UILabel!
    
    var userBudget = Int()
    
    @IBAction func setBudgetBtnPressed(sender: UIButton) {
        setBudgetFromAlert()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        addButton
        addProductButton.addTarget(self, action: Selector(("addBtnPressed")), for: .touchUpInside)
        footerView.addSubview(addProductButton)

//        myBudget
        
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = CGRect(x: 10.0, y: 0.0, width: UIScreen.main.bounds.width - 20, height: UIScreen.main.bounds.height - 160)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let budgets = calculateBudgets()
        
        var freeLocal = userBudget - budgets["localBudget"]!
        var freePublic = userBudget - budgets["publicBudget"]!
        
        if freeLocal < 0 {
            freeLocalBudget.textColor = .red
            freeLocal = -freeLocal
        } else {
            freeLocalBudget.textColor = .green
        }
        self.freeLocalBudget.text = "\(freeLocal)"
        
        if freePublic < 0 {
            freePublicBudget.textColor = .red
            freePublic = -freePublic
        } else {
            freePublicBudget.textColor = .green
        }
        freePublicBudget.text = "\(freePublic)"
    }
    
    @objc func addBtnPressed() {
//        let detailViewController = DetailViewController(currentProduct: products[0])
        currentProduct = ["Name": "", "My price": "", "Public price": "", "Image URL": ""]
        let detailViewController = UIStoryboard(name:"Main", bundle:nil).instantiateViewController(withIdentifier: "detailViewController") as! DetailViewController
        detailViewController.currentProduct = currentProduct
        navigationController?.pushViewController(detailViewController, animated: true)
    }
    
    var currentProduct = [String: String]()
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as! ItemCell
        cell.setup(product: products[indexPath.section])
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10.0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        return headerView
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        currentProduct = products[indexPath.section]
        let detailViewController = UIStoryboard(name:"Main", bundle:nil).instantiateViewController(withIdentifier: "detailViewController") as! DetailViewController
        detailViewController.currentProduct = currentProduct
        navigationController?.pushViewController(detailViewController, animated: true)
    }
    
    func calculateBudgets() -> [String: Int] {
        var localSum = Int()
        var publicSum = Int()
        for product in products {
            localSum += Int(product["My price"]!)!
            publicSum += Int(product["Public price"]!)!
        }
        return ["localBudget": localSum, "publicBudget": publicSum]
    }
    
    func setBudgetFromAlert() {
        //1. Create the alert controller.
        let alert = UIAlertController(title: "Введите свой бюджет", message: "Бюджет должен быть указан в рублях", preferredStyle: .alert)
        
        
        //2. Add the text field. You can configure it however you need.
        alert.addTextField { (textField) in
            textField.keyboardType = .numberPad
            textField.placeholder = "Число в рублях"
        }
        
        // 3. Grab the value from the text field, and print it when the user clicks OK.
        alert.addAction(UIAlertAction(title: "Отмена", style: .default, handler: { [weak alert] (_) in
            let _ = alert
        }))
        
        alert.addAction(UIAlertAction(title: "ОК", style: .default, handler: { [weak alert] (_) in
            let textField = alert?.textFields![0]
            self.userBudget = Int(textField!.text!)!
            let budgets = self.calculateBudgets()
            
            var freeLocal = self.userBudget - budgets["localBudget"]!
            var freePublic = self.userBudget - budgets["publicBudget"]!
            
            if freeLocal < 0 {
                self.freeLocalBudget.textColor = .red
                freeLocal = -freeLocal
            } else {
                self.freeLocalBudget.textColor = .green
            }
            self.freeLocalBudget.text = "\(freeLocal)"
            
            if freePublic < 0 {
                self.freePublicBudget.textColor = .red
                freePublic = -freePublic
            } else {
                self.freePublicBudget.textColor = .green
            }
            self.freePublicBudget.text = "\(freePublic)"
            
            self.setBudgetButton.setTitle("\(self.userBudget)", for: .normal)
        }))
        
        // 4. Present the alert.
        self.present(alert, animated: true, completion: nil)
    }
    
}

//        Constraints example

//        addProductButton.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint(item: addProductButton, attribute: .centerY, relatedBy: .equal, toItem: footerView, attribute: .centerY, multiplier: 1, constant: 0).isActive = true
//        NSLayoutConstraint (item: addProductButton, attribute: .width,relatedBy: .equal,toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 40).isActive = true
//        NSLayoutConstraint (item: addProductButton, attribute: .height,relatedBy: .equal,toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 40).isActive = true
//        NSLayoutConstraint(item: addProductButton, attribute: .right, relatedBy: .equal, toItem: footerView, attribute: .rightMargin, multiplier: 1, constant: -10).isActive = true
