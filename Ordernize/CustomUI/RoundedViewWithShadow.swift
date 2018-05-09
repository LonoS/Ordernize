//
//  RoundedViewWithShadow.swift
//  Ordernize
//
//  Created by Paul Wiesinger on 09.05.18.
//  Copyright © 2018 Paul Wiesinger. All rights reserved.
//

import UIKit

@IBDesignable
class RoundedViewWithShadow: UIView {
    
    @IBInspectable public var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }
    
    
    
    // shadow style
    
    @IBInspectable var shadowOffset: CGSize =  CGSize.zero {
        didSet{
            self.layer.shadowOffset = shadowOffset
        }
    }
    
    @IBInspectable var shadowOpacity: Float = 0 {
        didSet{
            self.layer.shadowOpacity = shadowOpacity
        }
    }
    
    
    @IBInspectable var shadowColor: CGColor = UIColor.clear.cgColor {
        didSet{
            self.layer.shadowColor = shadowColor
        }
    }
    
    
    @IBInspectable var shadowRadius: CGFloat = 0 {
        didSet{
            self.layer.shadowRadius = shadowRadius
        }
    }
}
