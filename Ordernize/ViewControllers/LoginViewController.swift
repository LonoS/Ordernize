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
    }

    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        UIView.animate(withDuration: 0.2) {
            self.view.frame.origin.y = 0
        }
        telNumberTF.resignFirstResponder()
        pswdTF.resignFirstResponder()
        
        return true
    }
}
