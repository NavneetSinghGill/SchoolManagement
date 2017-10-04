//
//  NotificationViewController.swift
//  SchoolParentManagment
//
//  Created by Bestpeers on 03/10/17.
//  Copyright © 2017 Bestpeers. All rights reserved.
//

import UIKit

class NotificationViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //addBackButton()
        self.navigationItem.hidesBackButton = true
       let left = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(logoutTapped))
       self.tabBarController?.navigationItem.leftBarButtonItem = left
        setNavigationTitle(title: "Notification")
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @objc func logoutTapped() -> Void {
        self.navigationController?.popToRootViewController(animated: false)
    }
    //MARK:- Notification Buttons Clicked Action
    
    @IBAction func btnClickedAction(_ sender: Any) {
        switch (sender as AnyObject).tag {
        case 0: print("0") //button1
        break;
        case 1: print("1")//button2
        break;
        case 2: print("2") //button3
        break;
        default: ()
        break;
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
