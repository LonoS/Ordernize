//
//  ShadowLabel.swift
//  Ordernize
//
//  Created by Paul Wiesinger on 09.05.18.
//  Copyright © 2018 Paul Wiesinger. All rights reserved.
//

import UIKit


@IBDesignable
class ShadowLabel: UILabel {

    // shadow style
    
    @IBInspectable var shadowOff: CGSize =  CGSize.zero {
        didSet{
            self.layer.shadowOffset = shadowOff
        }
    }
    
    @IBInspectable var shadowOpa: Float = 0 {
        didSet{
            self.layer.shadowOpacity = shadowOpa
        }
    }
    
    
    @IBInspectable var shadowCol: CGColor = UIColor.clear.cgColor {
        didSet{
            self.layer.shadowColor = shadowCol
        }
    }
    
    
    @IBInspectable var shadowRad: CGFloat = 0 {
        didSet{
            self.layer.shadowRadius = shadowRad
        }
    }

}
