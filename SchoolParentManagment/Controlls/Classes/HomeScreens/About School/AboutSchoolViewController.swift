//
//  AboutSchoolViewController.swift
//  SchoolParentManagment
//
//  Created by Bestpeers on 03/10/17.
//  Copyright © 2017 Bestpeers. All rights reserved.
//

import UIKit

class AboutSchoolViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //addBackButton()
        self.navigationItem.hidesBackButton = true
        
        setNavigationTitle(title: "About School")
        //self.navigationController?.navigationBar.topItem?.title = "About School"
       // self.navigationController?.title = "About School"

//        let nav = self.navigationController?.navigationBar
//        nav?.barStyle = UIBarStyle.black
//        nav?.tintColor = UIColor.white
//        nav?.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.appDarkBlueColor]
    }
//    override func viewWillDisappear(_ animated: Bool) {
//        super.viewWillDisappear(animated)
//        self.navigationController?.navigationBar.topItem?.title = nil
//    }
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

    @IBAction func btnClickedActions(_ sender: Any) {
    }
}
