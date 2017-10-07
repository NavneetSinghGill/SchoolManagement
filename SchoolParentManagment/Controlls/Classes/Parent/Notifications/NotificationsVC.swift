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
        setNavigationTitle(title: "NOTIFICATIONS")
        
        let notificationNIB = UINib(nibName: "NotificationTableViewCell", bundle: nil)
        tableViewForNotification.register(notificationNIB, forCellReuseIdentifier: "NotificationTableViewCell")
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
        cell.dividerView.isHidden = indexPath.row == 0
        
        // Cell Selection Clear color
        let bgColorView = UIView()
        bgColorView.backgroundColor = UIColor.clear
        cell.selectedBackgroundView = bgColorView
        self.tableViewForNotification.separatorStyle = .none
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let chatVC = UIStoryboard.getChatController()
        self.navigationController?.pushViewController(chatVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
}
