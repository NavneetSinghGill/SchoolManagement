//
//  ChildrenDetail.swift
//  SchoolParentManagment
//
//  Created by Bestpeers on 04/10/17.
//  Copyright © 2017 Bestpeers. All rights reserved.
//

import UIKit

class ChildrenDetail: BaseViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
       
      print("\(UserDefaults.standard.value(forKey: "childerns_details")!)")
        // Do any additional setup after loading the view.
        addBackButton()
        setNavigationTitle(title: "Children Details")
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

}
