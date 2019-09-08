//
//  ItemCellTableViewCell.swift
//  Smart Buys
//
//  Created by ipopat on 08/09/2019.
//  Copyright © 2019 rugyron. All rights reserved.
//

import UIKit

class ItemCell: UITableViewCell {
    
    func setup(product: [String: Any]) {
        
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = #colorLiteral(red: 0.1992599666, green: 0.2039227486, blue: 0.2126126289, alpha: 1)
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
