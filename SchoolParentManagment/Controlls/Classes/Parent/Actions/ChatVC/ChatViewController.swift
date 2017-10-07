//
//  ChatViewController.swift
//  SchoolParentManagment
//
//  Created by Bestpeers on 06/10/17.
//  Copyright © 2017 Bestpeers. All rights reserved.
//

import UIKit
//import MMChatFramework
class ChatViewController: BaseViewController  {
    
    @IBOutlet weak var lblMessage: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       // setNavigationTitle(title: "Chat")
        addBackButton()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "chatbackground")!)
        self.lblMessage.backgroundColor = Global.getColorForCurrentEnvironmentType()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    
}
