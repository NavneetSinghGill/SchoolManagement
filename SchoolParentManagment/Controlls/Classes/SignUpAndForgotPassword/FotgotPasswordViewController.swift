//
//  FotgotPasswordViewController.swift
//  SchoolParentManagment
//
//  Created by Bestpeers on 04/10/17.
//  Copyright © 2017 Bestpeers. All rights reserved.
//

import UIKit

class FotgotPasswordViewController: BaseViewController ,UITextFieldDelegate{
    
    @IBOutlet weak var txtEmailId: UITextField!
    @IBAction func btnSubmitAction(_ sender: Any) {
        self.performLogIn()
    }
    
    @IBAction func btnBackAction(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       // self.txtEmailId.delegate = self
       // addBackButton()
        
        self.title = "Forgot Password"
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
    
    //MARK:- PERFORM LOGIN
    func performLogIn() -> Void {
        
        if isDataValid() {
            self.navigationController?.popToRootViewController(animated: false)
        }
    }
    //MARK:- Textfield validations And check Empty
    func isDataValid() -> Bool {
        var isValid = false
        var errorMsg : String?
        
        if ((self.txtEmailId?.text?.characters.count)! < 1)
        {
            errorMsg = "Please enter email id"
        }
        else if !(Utility.isValid(email: (self.txtEmailId?.text)!))
        {
            errorMsg = "Please enter valid email id"
        }
            
        else {
            isValid = true
            
        }
        if(!isValid && errorMsg!.characters.count > 0) {
            Utility.showAlertWith(title: "Alert", message: errorMsg!, inController: self)
        }
        return isValid
    }
}
