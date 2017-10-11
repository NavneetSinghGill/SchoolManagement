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
    
    let mainStoryBoard = UIStoryboard(name: "Main", bundle: nil)
    var defaults:UserDefaults = UserDefaults.standard
    //@IBOutlet weak var lblLoginUserType: UILabel!
    @IBOutlet weak var btnLogin: UIButton!
    
    @IBOutlet weak var btnSignUp: UIButton!
    @IBOutlet weak var btnForgotPassword: UIButton!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    @IBOutlet weak var segment: UISegmentedControl!
    //MARK: Login Button Clicked Action
    @IBAction func btnLoginAction(_ sender: Any) {
        self.performLogIn()
    }
    //MARK:- Forgot Password
    @IBAction func btnForgotPasswordAction(_ sender: Any) {
        let forgotVC = mainStoryBoard.instantiateViewController(withIdentifier:sFotgotPasswordViewControllerIdentifier)
        self.present(forgotVC, animated: true, completion: nil)
    }
    //MARK:- SignUP Action
    @IBAction func btnSignUpAction(_ sender: Any) {
        let signUpVC = mainStoryBoard.instantiateViewController(withIdentifier: sSignUpViewControllerIdentifier)
        self.present(signUpVC, animated: true, completion: nil)
    }
    
    //MARK:- Segment Action
    @IBAction func segmentAction(_ sender: Any) {
        switch self.segment.selectedSegmentIndex {
        case 0:
            print("segmentindex 0")
            self.segment.tintColor = baseGreen
            self.btnLogin.backgroundColor = baseGreen
//            btnSignUp.setTitleColor(baseGreen, for: UIControlState.normal)
//            self.btnForgotPassword.setTitleColor(baseGreen, for: UIControlState.normal)
            defaults.set(1, forKey: "SignUpType")

        case 1:
            print("segmentindex 1")
            self.segment.tintColor = baseOrange
            self.btnLogin.backgroundColor = baseOrange
//            btnSignUp.setTitleColor(baseOrange, for: UIControlState.normal)
//            self.btnForgotPassword.setTitleColor(baseOrange, for: UIControlState.normal)
            defaults.set(2, forKey: "SignUpType")

        default:
            print("segmentindex 0")
            self.segment.tintColor = baseGreen
            self.segment.tintColor = baseGreen
            self.btnLogin.backgroundColor = baseGreen
//            btnSignUp.setTitleColor(baseGreen, for: UIControlState.normal)
//            self.btnForgotPassword.setTitleColor(baseGreen, for: UIControlState.normal)
            defaults.set(1, forKey: "SignUpType")

        }
        updateEnvironmentCharacterType()
    }
    
    // MARK:- View Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.txtEmail?.delegate = self
        self.txtPassword?.delegate = self
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        self.segment.selectedSegmentIndex = 0
        
        self.txtEmail.text = "N@gamil.com"
        self.txtPassword.text = "123456"
        
        self.segment.selectedSegmentIndex = 0
        self.segment.tintColor = baseGreen
        self.btnLogin.backgroundColor = baseGreen
//        btnSignUp.setTitleColor(baseGreen, for: UIControlState.normal)
//        self.btnForgotPassword.setTitleColor(baseGreen, for: UIControlState.normal)
        updateEnvironmentCharacterType()
        defaults.set(1, forKey: "SignUpType")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.segment.selectedSegmentIndex = 0
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        // self.tabBarController!.tabBar.isHidden = true
        self.segment.tintColor = baseGreen
        self.btnLogin.backgroundColor = baseGreen
//        btnSignUp.setTitleColor(baseGreen, for: UIControlState.normal)
//        self.btnForgotPassword.setTitleColor(baseGreen, for: UIControlState.normal)
        defaults.set(1, forKey: "SignUpType")
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
    
    //MARK:- TextField Delegate Method
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    //MARK:- PERFORM LOGIN
    func performLogIn() -> Void {
        
        if isDataValid() {
            let mainStoryBoard = UIStoryboard(name: "Main", bundle: nil)
            let teacherStoryBoard = UIStoryboard(name: "Teacher", bundle: nil)
            
            print("ValueOfSEgmentIndex \(self.segment.selectedSegmentIndex)")
            
            switch self.segment.selectedSegmentIndex {
            case 0: 
                let techerHomeVC = teacherStoryBoard.instantiateViewController(withIdentifier: sHomeTabBarControllerllerIdentifier)
                self.present(techerHomeVC, animated: true, completion: nil)
            case 1:
                let homeVC = mainStoryBoard.instantiateViewController(withIdentifier:sHomeTabBarControllerllerIdentifier)
                self.present(homeVC, animated: true, completion: nil)
            default:
                let techerHomeVC = teacherStoryBoard.instantiateViewController(withIdentifier: sHomeTabBarControllerllerIdentifier)
                self.present(techerHomeVC, animated: true, completion: nil)
            }
            
            let homeVC = mainStoryBoard.instantiateViewController(withIdentifier:sHomeTabBarControllerllerIdentifier)
            // self.navigationController?.pushViewController(homeVC, animated: true)
            self.present(homeVC, animated: true, completion: nil)
            
        }
    }
    //MARK:- Textfield validations And check Empty
    private func isDataValid() -> Bool {
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
    
    //MARK: Private methods
    
    func updateEnvironmentCharacterType() {
        switch segment.selectedSegmentIndex {
        case 0:
            appDelegate.environmentCharacterType = .Teacher
        case 1:
            appDelegate.environmentCharacterType = .Parent
        default:
            appDelegate.environmentCharacterType = .Parent
        }
    }
}
