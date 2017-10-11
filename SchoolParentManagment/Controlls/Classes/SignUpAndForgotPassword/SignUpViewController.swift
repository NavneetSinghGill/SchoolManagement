//
//  SignUpViewController.swift
//  SchoolParentManagment
//
//  Created by Bestpeers on 03/10/17.
//  Copyright © 2017 Bestpeers. All rights reserved.
//

import UIKit

class SignUpViewController: BaseViewController,UITextFieldDelegate {

    @IBOutlet weak var textFieldName: UITextField!
    @IBOutlet weak var textFieldEmail: UITextField!
    @IBOutlet weak var textFieldPassword: UITextField!
    @IBOutlet weak var textFieldMobile: UITextField!
    
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet var textFields: [UITextField]!
    
    @IBAction func saveAction(_ sender: Any) {
        self.performLogIn()
    }
    
    @IBAction func btnBackAction(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        addBackButton()
        self.textFieldName.delegate = self
        self.textFieldEmail.delegate = self
        self.textFieldPassword.delegate = self
        self.textFieldMobile.delegate = self
        
        let str: Int  = UserDefaults.standard.integer(forKey: "SignUpType")
        switch str {
        case 1:
            self.saveButton.backgroundColor = baseGreen
        case 2:
            self.saveButton.backgroundColor = baseOrange
        default:
            self.saveButton.backgroundColor = baseGreen
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //MARK:- TextField Delegate Method
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == self.textFieldMobile{
            let acceptedCharsters = self.textFieldMobile.text
            let newLength: Int = (textField.text?.count ?? 0) + (string.count ) - range.length
            return (newLength > 10) ? false : true
            let cs = CharacterSet(charactersIn: acceptedCharsters!).inverted
            let filtered: String = string.components(separatedBy: cs).joined(separator: "")
            return string == filtered
            return true
        }
        else{
            return true
        }
        
    }
    //MARK:- Textfield validations And check Empty
    private func isDataValid() -> Bool {
        var isValid = false
        var errorMsg : String?
        
        
        if ((self.textFieldName?.text?.characters.count)! < 1)
        {
            errorMsg = "Please enter name"
        }
        else if ((self.textFieldEmail?.text?.characters.count)! < 1)
        {
            errorMsg = "Please enter email id"
        }
        else if ((self.textFieldPassword?.text?.characters.count)! < 1)
        {
            errorMsg = "Please enter password"
        }
        else if ((self.textFieldMobile?.text?.count)! < 1)
        {
            errorMsg = "Please enter password"
        }
        else if !(Utility.isValid(email: (self.textFieldEmail?.text)!))
        {
            errorMsg = "Please enter valid email id"
        }
            //        else if !(((self.textFieldEmail?.text)?.isPhoneNumber)!)
            //        {
            //            errorMsg = "Please enter 10 Digit"
            //        }
        else {
            isValid = true
            
        }
        if(!isValid && errorMsg!.characters.count > 0) {
            //self.textFieldPassword?.text = ""
            Utility.showAlertWith(title: "Oops!", message: errorMsg!, inController: self)
        }
        return isValid
    }
    
    func performLogIn() -> Void {
        if isDataValid() {
            self.dismiss(animated: true, completion: nil)
        }
        
    }
}
