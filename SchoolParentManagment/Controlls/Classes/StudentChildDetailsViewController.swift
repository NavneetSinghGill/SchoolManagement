//
//  StudentChildDetailsViewController.swift
//  SchoolParentManagment
//
//  Created by Navneet on 10/3/17.
//  Copyright © 2017 Bestpeers. All rights reserved.
//

import UIKit

class StudentChildDetailsViewController: BaseViewController {

    var shouldShowBackButton: Bool = false
    var studentChild: StudentChild?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if shouldShowBackButton {
            addBackButton()
        }
    }

}
