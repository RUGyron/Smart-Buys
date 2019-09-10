//
//  ItemCellTableViewCell.swift
//  Smart Buys
//
//  Created by ipopat on 08/09/2019.
//  Copyright © 2019 rugyron. All rights reserved.
//

import UIKit

class ItemCell: UITableViewCell {
    
    var name = String()
    var myPrice = String()
    var pubPrice = String()
    var imageUrl = String()
    
    @IBOutlet weak var nameObject: UILabel!
    @IBOutlet weak var myPriceObject: UILabel!
    @IBOutlet weak var pubPriceObject: UILabel!
    @IBOutlet weak var imageObject: UIImageView!
    
    
//    @IBOutlet weak var btn: UIButton!
//    @IBAction func btnAction(_ sender: UIButton) {
//        print(1)
//    }
    
    func setup(product: [String: String]) {
        nameObject.text = product["Name"]
        myPriceObject.text = product["My price"]
        pubPriceObject.text = product["Public price"]
        setImage(from: product["Image URL"]!, imageView: imageObject)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
//        self.bounds.size.width = UIScreen.main.bounds.width - 40
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

//    override func layoutMarginsDidChange() {
//        super.layoutMarginsDidChange()
//        self.layoutMargins = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
//        self.contentView.layoutMargins = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
//    }
    
}
