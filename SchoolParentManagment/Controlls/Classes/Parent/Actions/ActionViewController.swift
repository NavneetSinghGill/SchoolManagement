//
//  ActionViewController.swift
//  SchoolParentManagment
//
//  Created by Bestpeers on 03/10/17.
//  Copyright © 2017 Bestpeers. All rights reserved.
//

import UIKit

class ActionViewController: BaseViewController ,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var tableViewForAction: UITableView!
    let arrActionType: [String] = [" Leave management", "Application to teacher", "Chat with teacher"]
    let arrCellImages: [String] =  ["leaveApplication", "leaveApplication", "chat"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.navigationItem.hidesBackButton = true
        setNavigationTitle(title: "ACTION")
        
        let actionNIB = UINib(nibName: "NotificationTableViewCell", bundle: nil)
        tableViewForAction.register(actionNIB, forCellReuseIdentifier: "NotificationTableViewCell")
        
        tableViewForAction.estimatedRowHeight = 49
        tableViewForAction.rowHeight = UITableViewAutomaticDimension
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    //MARK: Tableview datasource and  Delegate methods
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrActionType.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: NotificationTableViewCell = tableView.dequeueReusableCell(withIdentifier: "NotificationTableViewCell", for: indexPath) as! NotificationTableViewCell
        
        cell.setUIFor(strNotificationType: self.arrActionType[indexPath.row], strCellImage: self.arrCellImages[indexPath.row])
       // cell.accessoryType = .disclosureIndicator
        
        // Cell Selection Clear color
        let bgColorView = UIView()
        bgColorView.backgroundColor = UIColor.clear
        cell.selectedBackgroundView = bgColorView
        self.tableViewForAction.separatorStyle = .none
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // for Chating
        if indexPath.row == 2 {
            let messagesVC: ZHCDemoMessagesViewController = ZHCDemoMessagesViewController.init();
            messagesVC.presentBool = false;
            self.navigationController?.pushViewController(messagesVC, animated: true);
        }
        else{
            let chatVC = UIStoryboard.getChatController()
            self.navigationController?.pushViewController(chatVC, animated: true)
        }
    }
}
