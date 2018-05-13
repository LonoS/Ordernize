//
//  SMSConfirmationViewController.swift
//  Ordernize
//
//  Created by Paul Wiesinger on 10.05.18.
//  Copyright © 2018 Paul Wiesinger. All rights reserved.
//

import UIKit

class SMSConfirmationViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var fehlermeldungLBL: UILabel!
    @IBOutlet weak var headline: UILabel!
    @IBOutlet weak var informationText: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var weiterBTN: RoundedButton!
    @IBOutlet weak var codeTF: UITextField!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    
    
    
    enum UserResponseImage {
        case success
        case error
        
        func getImage() -> UIImage {
            switch self {
            case .success:
                return #imageLiteral(resourceName: "successIcon")
            default:
                return #imageLiteral(resourceName: "errorIcon")
            }
        }
    }
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        activityIndicator.isHidden = true
        codeTF.delegate = self
        redesignTextField()
        let taprecognizer = UITapGestureRecognizer.init(target: self, action: #selector(dissmissKeyboard))
        self.view.addGestureRecognizer(taprecognizer)
    }
    
    func redesignTextField(){
        let border = CALayer()
        
        let width = CGFloat(2.0)
       
        border.borderColor = UIColor.lightGray.cgColor
        
        border.frame = CGRect(x: 0, y: codeTF.frame.size.height - width, width:  codeTF.frame.size.width, height: codeTF.frame.size.height)
        
        border.borderWidth = width
        
        codeTF.layer.addSublayer(border)
    
        codeTF.layer.masksToBounds = true
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func checkBTNpressed(_ sender: Any) {
        // determing if the user has entered a code
        hideAll()
        guard let code = codeTF.text, code != "" else {
            
            // showing the user the error message for a short time
            
            imageView.isHidden = false
            imageView.image = UserResponseImage.error.getImage()
            fehlermeldungLBL.isHidden = false
            fehlermeldungLBL.text = "Du musst den Code in das Feld eingeben."
            
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 4) {
                self.hideAll()
                self.headline.isHidden = false
                self.informationText.isHidden = false
                self.codeTF.isHidden = false
            }
            
            return
        }
        
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
        
        // perform database action here
        
        
        let success = false // your DB result...
        
        
        
        
        
        self.imageView.isHidden = false
        self.activityIndicator.stopAnimating()
        self.self.activityIndicator.isHidden = true
        
        if success {
            self.imageView.image = UserResponseImage.success.getImage()
        } else {
            self.imageView.image = UserResponseImage.error.getImage()
            self.fehlermeldungLBL.text = "Falscher Code."
            self.fehlermeldungLBL.isHidden = false
            
            
            // dismiss it again
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 5, execute: {
                self.hideAll()
                self.headline.isHidden = false
                self.informationText.isHidden = false
                self.codeTF.text = nil
                self.codeTF.isHidden = false
            })
        }
        
        
    }
    
    
    fileprivate func hideAll() {
        imageView.image = nil
        imageView.isHidden = true
        headline.isHidden = true
        informationText.isHidden = true
        fehlermeldungLBL.text = nil
        fehlermeldungLBL.isHidden = true
        activityIndicator.isHidden = true
        codeTF.isHidden = true
    }
    
    
    @objc func dissmissKeyboard() {
        codeTF.resignFirstResponder()
        
        UIView.animate(withDuration: 0.2) {
            self.view.frame.origin.y = 0
        }
    }
    
    // Textfield
    func textFieldDidBeginEditing(_ textField: UITextField) {
        UIView.animate(withDuration: 0.5) {
            self.view.frame.origin.y = -130
        }
        textField.layer.sublayers![0].borderColor = UIColor.orange.cgColor
    }
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextFieldDidEndEditingReason) {
        textField.layer.sublayers![0].borderColor = UIColor.lightGray.cgColor
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        codeTF.resignFirstResponder()
        
        UIView.animate(withDuration: 0.2) {
            self.view.frame.origin.y = 0
        }
        return true
    }
}
