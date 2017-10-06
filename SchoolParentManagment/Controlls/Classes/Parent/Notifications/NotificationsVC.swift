//
//  NotificationsVC.swift
//  SchoolParentManagment
//
//  Created by Bestpeers on 05/10/17.
//  Copyright © 2017 Bestpeers. All rights reserved.
//

import UIKit

class NotificationsVC: BaseViewController ,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var tableViewForNotification: UITableView!
    let arrNotificationsType: [String] = ["Teacher feedback of child", "Transportation updates", "Fees status updates"]
    let arrCellImages: [String] =  ["Send feedback", "Transportation", "Fees"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.navigationItem.hidesBackButton = true
        setNavigationTitle(title: "Notification")
        
        let notificationNIB = UINib(nibName: "NotificationTableViewCell", bundle: nil)
        tableViewForNotification.register(notificationNIB, forCellReuseIdentifier: "NotificationTableViewCell")
        
        tableViewForNotification.estimatedRowHeight = 49
        tableViewForNotification.rowHeight = UITableViewAutomaticDimension
        
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
        return self.arrNotificationsType.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: NotificationTableViewCell = tableView.dequeueReusableCell(withIdentifier: "NotificationTableViewCell", for: indexPath) as! NotificationTableViewCell
        
        cell.setUIFor(strNotificationType: self.arrNotificationsType[indexPath.row], strCellImage: self.arrCellImages[indexPath.row])
        cell.accessoryType = .disclosureIndicator
        
        // Cell Selection Clear color
        let bgColorView = UIView()
        bgColorView.backgroundColor = UIColor.clear
        cell.selectedBackgroundView = bgColorView
        self.tableViewForNotification.separatorStyle = .none
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       // Utility.showAlertWith(title: "School Managment", message: "This app feature is under working", inController: self)
        let alert = UIAlertController(title: "School Managment", message: "This app feature is under working", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    //func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    //        return 49
    //    }
}
