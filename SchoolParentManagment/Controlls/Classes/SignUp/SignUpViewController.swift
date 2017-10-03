//
//  SignUpViewController.swift
//  SchoolParentManagment
//
//  Created by Bestpeers on 03/10/17.
//  Copyright © 2017 Bestpeers. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var textFieldName: UITextField!
    @IBOutlet weak var textFieldEmail: UITextField!
    @IBOutlet weak var textFieldPassword: UITextField!
    @IBOutlet weak var textFieldMobile: UITextField!
    @IBOutlet weak var passwordValidationLabel: UILabel!
    
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet var textFields: [UITextField]!
    
    @IBAction func saveAction(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.textFieldName.delegate = self
        self.textFieldEmail.delegate = self
        self.textFieldPassword.delegate = self
        self.textFieldMobile.delegate = self
        
        setupView()
        // Register View Controller as Observer
        NotificationCenter.default.addObserver(self, selector: #selector(textDidChange(_:)), name: Notification.Name.UITextFieldTextDidChange, object: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - View Methods
    fileprivate func setupView() {
        // Configure Save Button
        saveButton.isEnabled = false
        
        // Configure Password Validation Label
        passwordValidationLabel.isHidden = true
    }
    // MARK: - Notification Handling
    
    @objc private func textDidChange(_ notification: Notification) {
        var formIsValid = true
        
        for textField in textFields {
            // Validate Text Field
            let (valid, _) = validate(textField)
            
            guard valid else {
                formIsValid = false
                break
            }
        }
        
        // Update Save Button
        saveButton.isEnabled = formIsValid
    }
    
    // MARK: - Helper Methods
    
    fileprivate func validate(_ textField: UITextField) -> (Bool, String?) {
        guard let text = textField.text else {
            return (false, nil)
        }
        
        if textField == textFieldPassword {
            return (text.characters.count >= 6, "Your password is too short.")
        }
        
        return (text.characters.count > 0, "This field cannot be empty.")
    }
}

extension SignUpViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case textFieldName:
            textFieldEmail.becomeFirstResponder()
        case textFieldEmail:
            textFieldPassword.becomeFirstResponder()
        case textFieldPassword:
            // Validate Text Field
            let (valid, message) = validate(textField)
            
            if valid {
                textFieldMobile.becomeFirstResponder()
            }
            
            // Update Password Validation Label
            self.passwordValidationLabel.text = message
            
            // Show/Hide Password Validation Label
            UIView.animate(withDuration: 0.25, animations: {
                self.passwordValidationLabel.isHidden = valid
            })
        default:
            textFieldMobile.resignFirstResponder()
        }
        
        return true
    }

}
