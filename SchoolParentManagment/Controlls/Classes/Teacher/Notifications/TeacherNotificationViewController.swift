//
//  TeacherNotificationViewController.swift
//  SchoolParentManagment
//
//  Created by Navneet on 10/9/17.
//  Copyright © 2017 Bestpeers. All rights reserved.
//

import UIKit

class TeacherNotificationViewController: BaseViewController, UITabBarDelegate, UITableViewDataSource {

    @IBOutlet weak var notificationTableView: UITableView!
    
    var notifications: [Notificationn] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let notificationsNIB = UINib(nibName: "TeacherNotificationsTableViewCell", bundle: nil)
        notificationTableView.register(notificationsNIB, forCellReuseIdentifier: "TeacherNotificationsTableViewCell")
        
        notificationTableView.estimatedRowHeight = 40
        notificationTableView.rowHeight = UITableViewAutomaticDimension
        
        setNavigationTitle(title: "Notifications")

        //Fake data
        for i in 0..<3 {
            let notificationFake = Notificationn()
            notificationFake.fakeData(for: i)
            notifications.append(notificationFake)
        }
        
        notificationTableView.reloadData()
    }

    
    
    //MARK: Tableview datasource methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return notifications.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: TeacherNotificationsTableViewCell = tableView.dequeueReusableCell(withIdentifier: "TeacherNotificationsTableViewCell", for: indexPath) as! TeacherNotificationsTableViewCell
        
        cell.setUIFor(for: notifications[indexPath.row])
        
        return cell
    }
}
