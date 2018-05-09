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
        
        let tapper = UITapGestureRecognizer.init(target: self, action: #selector(dissmissKeyboard))
        self.view.addGestureRecognizer(tapper)
    }
    
    
    @IBAction func weiterBTNpressed(_ sender: Any) {
        
        dissmissKeyboard()
        
        guard let pswd = pswdTF.text, let telNumber = telNumberTF.text, telNumber != "", pswd != "" else {
            let alert = UIAlertController.init(title: "Ungültige Eingabe!", message: "Gib bitte eine Telefonnummer und ein Passwort ein.", preferredStyle: .alert)
            alert.addAction(UIAlertAction.init(title: "Okay", style: .default, handler: nil))
            
            self.present(alert, animated: true, completion: nil)
            
            
            return
        }
        
        // check if accountDetails are valid.
        
        
        // user has to createaccount
        let hasToCreate = true
        
        if hasToCreate {
            // the user has to confirm his passwd.
            let alert = UIAlertController.init(title: "Bestätige bitte dein Passwort", message: "Gib dein Passwort noch einmal ein um es zu bestätigen. Anschließend wird dein Account erstellt.", preferredStyle: .alert)
            
            alert.addTextField { (textfield) in
                textfield.isSecureTextEntry = true
            }
            
            alert.addAction(UIAlertAction.init(title: "Passwort prüfen", style: .default, handler: { (action) in
                let secondPass = alert.textFields?.first?.text
                
                guard let secondPswd = secondPass else {
                    alert.dismiss(animated: true, completion: nil)
                    return
                }
                
                let isValid = (pswd == secondPswd)

                if isValid == false {
                    let alert = UIAlertController.init(title: "Passwörter stimmen nicht überein!", message: "Versuche es erneut.", preferredStyle: .alert)
                    self.present(alert, animated: true, completion: {
                        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3, execute: {
                            alert.dismiss(animated: true, completion: nil)
                        })
                    })
                } else {
                    // proceed with account creation.
                    print("auth was right")
                }
                
            }))
            
            alert.addAction(UIAlertAction.init(title: "Abbrechen", style: .cancel, handler: nil))
            
            self.present(alert, animated: true, completion: nil)
        } else {
            
        }
        
        
    }
    
    
    
    @objc func dissmissKeyboard() {
        pswdTF.resignFirstResponder()
        telNumberTF.resignFirstResponder()
        
        UIView.animate(withDuration: 0.2) {
            self.view.frame.origin.y = 0
        }
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
