//
//  CustomButton.swift
//  Smart Buys
//
//  Created by ipopat on 08/09/2019.
//  Copyright © 2019 rugyron. All rights reserved.
//

import Foundation
import UIKit

extension UIButton {
    class func attributedButton(frame: CGRect) -> UIButton {
        let button = UIButton(frame: frame)
        button.clipsToBounds = true
        button.layer.cornerRadius = button.frame.width/2.0
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.borderWidth = 2.0
        return button
    }
}
