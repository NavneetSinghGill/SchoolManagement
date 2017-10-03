//
//  LoginViewController.swift
//  SchoolParentManagment
//
//  Created by Bestpeers on 03/10/17.
//  Copyright © 2017 Bestpeers. All rights reserved.
//


/*
 If app background login than set segment index -1
 */

import UIKit

class LoginViewController: UIViewController,UITextFieldDelegate {
    
    
    @IBOutlet weak var lblLoginUserType: UILabel!
    
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    @IBOutlet weak var segment: UISegmentedControl!
    
    @IBAction func btnLoginAction(_ sender: Any) {
        self.performLogIn()
    }
    
    @IBAction func btnForgotPasswordAction(_ sender: Any) {
    }
    
    @IBAction func btnSignUpAction(_ sender: Any) {
    }
    
    @IBAction func segmentAction(_ sender: Any) {
        
        switch self.segment.selectedSegmentIndex {
        case 0:
            self.lblLoginUserType.text = "Login Teacher"
        case 1:
            self.lblLoginUserType.text = "Login Parent"
        case 2:
            self.lblLoginUserType.text = "Login Student"
        default:
            self.lblLoginUserType.text = "Login Teacher"
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.txtEmail?.delegate = self
        self.txtPassword?.delegate = self
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        self.segment.selectedSegmentIndex = 0
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.segment.selectedSegmentIndex = 0
        self.lblLoginUserType.text = "Login Teacher"
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        // self.tabBarController!.tabBar.isHidden = true
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        //  self.tabBarController!.tabBar.isHidden = false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    //MARK:- TextField Delegate Method
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    //MARK:- PERFORM LOGIN
    func performLogIn() -> Void {
        
        if isDataValid() {
            let mainStoryBoard = UIStoryboard(name: "Main", bundle: nil)
            let homeVC = mainStoryBoard.instantiateViewController(withIdentifier:sHomeTabBarControllerllerIdentifier)
            self.navigationController?.pushViewController(homeVC, animated: true)
        }
    }
    
    func isDataValid() -> Bool {
        var isValid = false
        var errorMsg : String?
        
        if ((self.txtEmail?.text?.characters.count)! < 1)
        {
            errorMsg = "Please enter email id"
        }
        else if ((self.txtPassword?.text?.characters.count)! < 1)
        {
            errorMsg = "Please enter password"
        }
        else if !(Utility.isValid(email: (self.txtEmail?.text)!))
        {
            errorMsg = "Please enter valid email id"
        }
            //        else if !(Utility.isValid(password:(self.txtPassword?.text!)!))
            //        {
            //            errorMsg = "Please enter valid password"
            //        }
        else {
            isValid = true
            
        }
        if(!isValid && errorMsg!.characters.count > 0) {
            self.txtPassword?.text = ""
            Utility.showAlertWith(title: "Invalid Credentials", message: errorMsg!, inController: self)
        }
        return isValid
    }
    
    //MARK: - AlertView Controller
    func alert(title: String, message: String) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
    }
}
