//
//  LoginViewController.swift
//  Ordernize
//
//  Created by Paul Wiesinger on 09.05.18.
//  Copyright © 2018 Paul Wiesinger. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var telNumberTF: UITextField!
    @IBOutlet weak var pswdTF: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        telNumberTF.delegate = self
        pswdTF.delegate = self
        redesign()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    
    // Textfield
    func textFieldDidBeginEditing(_ textField: UITextField) {
        UIView.animate(withDuration: 0.5) {
            self.view.frame.origin.y = -130
            
        }
        textField.layer.sublayers![0].borderColor = UIColor.orange.cgColor
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.layer.sublayers![0].borderColor = UIColor.lightGray.cgColor
    }
   
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        UIView.animate(withDuration: 0.2) {
            self.view.frame.origin.y = 0
        }
        telNumberTF.resignFirstResponder()
        pswdTF.resignFirstResponder()
        
        return true
    }
    
    func redesign(){
        let border = CALayer()
        let border2 = CALayer()

        let width = CGFloat(2.0)
        
        border.borderColor = UIColor.lightGray.cgColor
        border2.borderColor = UIColor.lightGray.cgColor

        border.frame = CGRect(x: 0, y: telNumberTF.frame.size.height - width, width:  telNumberTF.frame.size.width, height: telNumberTF.frame.size.height)
        border2.frame = CGRect(x: 0, y: pswdTF.frame.size.height - width, width:  pswdTF.frame.size.width, height: pswdTF.frame.size.height)
        
        border.borderWidth = width
        border2.borderWidth = width
        
        
        telNumberTF.layer.addSublayer(border)
        pswdTF.layer.addSublayer(border2)
        
        telNumberTF.layer.masksToBounds = true
        pswdTF.layer.masksToBounds = true
        
        
        
    }
    
    
}
