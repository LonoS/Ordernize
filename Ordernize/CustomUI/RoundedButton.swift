//
//  RoundedButton.swift
//  Ordernize
//
//  Created by Paul Wiesinger on 09.05.18.
//  Copyright © 2018 Paul Wiesinger. All rights reserved.
//

import UIKit

@IBDesignable
class RoundedButton: UIButton {

    @IBInspectable public var cornerRadius: CGFloat = 10 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }

}
