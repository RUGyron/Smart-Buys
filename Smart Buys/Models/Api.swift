//
//  Api.swift
//  Smart Buys
//
//  Created by ipopat on 08/09/2019.
//  Copyright © 2019 rugyron. All rights reserved.
//

import Foundation
import UIKit

var products = [
    ["Name": "Apple0", "My price": "52", "Public price": "34", "Image URL": "https://chudesalegko.ru/wp-content/uploads/2013/07/yabloko.jpg"],
    ["Name": "Apple1", "My price": "52", "Public price": "34", "Image URL": "https://chudesalegko.ru/wp-content/uploads/2013/07/yabloko.jpg"],
    ["Name": "Apple2", "My price": "52", "Public price": "34", "Image URL": "https://chudesalegko.ru/wp-content/uploads/2013/07/yabloko.jpg"],
    ["Name": "Apple3", "My price": "52", "Public price": "34", "Image URL": "https://chudesalegko.ru/wp-content/uploads/2013/07/yabloko.jpg"],
    ["Name": "Apple4", "My price": "52", "Public price": "34", "Image URL": "https://chudesalegko.ru/wp-content/uploads/2013/07/yabloko.jpg"],
    ["Name": "Apple5", "My price": "52", "Public price": "34", "Image URL": "https://chudesalegko.ru/wp-content/uploads/2013/07/yabloko.jpg"],
    ["Name": "Apple6", "My price": "52", "Public price": "34", "Image URL": "https://chudesalegko.ru/wp-content/uploads/2013/07/yabloko.jpg"],
    ["Name": "Apple7", "My price": "52", "Public price": "34", "Image URL": "https://chudesalegko.ru/wp-content/uploads/2013/07/yabloko.jpg"],
    ["Name": "Apple0", "My price": "52", "Public price": "34", "Image URL": "https://chudesalegko.ru/wp-content/uploads/2013/07/yabloko.jpg"],
    ["Name": "Apple1", "My price": "52", "Public price": "34", "Image URL": "https://chudesalegko.ru/wp-content/uploads/2013/07/yabloko.jpg"],
    ["Name": "Apple2", "My price": "52", "Public price": "34", "Image URL": "https://chudesalegko.ru/wp-content/uploads/2013/07/yabloko.jpg"],
    ["Name": "Apple3", "My price": "52", "Public price": "34", "Image URL": "https://chudesalegko.ru/wp-content/uploads/2013/07/yabloko.jpg"],
    ["Name": "Apple4", "My price": "52", "Public price": "34", "Image URL": "https://chudesalegko.ru/wp-content/uploads/2013/07/yabloko.jpg"],
    ["Name": "Apple5", "My price": "52", "Public price": "34", "Image URL": "https://chudesalegko.ru/wp-content/uploads/2013/07/yabloko.jpg"],
    ["Name": "Apple6", "My price": "52", "Public price": "34", "Image URL": "https://chudesalegko.ru/wp-content/uploads/2013/07/yabloko.jpg"],
    ["Name": "Apple7", "My price": "52", "Public price": "34", "Image URL": "https://chudesalegko.ru/wp-content/uploads/2013/07/yabloko.jpg"]
]

func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
    URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
}

func setImage(from urlString: String, imageView: UIImageView) {
    if let url = URL(string: urlString) {
        getData(from: url) { data, response, error in
            guard let data = data, error == nil else { return }
            DispatchQueue.main.async() {
                imageView.image = UIImage(data: data)
            }
        }
    }

}

//darkBackground = 

