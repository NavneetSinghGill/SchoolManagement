//
//  AboutSchoolViewController.swift
//  SchoolParentManagment
//
//  Created by Bestpeers on 03/10/17.
//  Copyright © 2017 Bestpeers. All rights reserved.
//

import UIKit

class AboutSchoolViewController: BaseViewController ,UITableViewDataSource, UITableViewDelegate{
    
    @IBOutlet weak var tableViewForAboutschool: UITableView!
    let arrTableview: [String] = ["Gallery", "Holiday", "Contact", "Send feedback"]
    let arrCellImages: [String] =  ["Gallery", "Holiday", "Contact", "Send feedback"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.navigationItem.hidesBackButton = true
        setNavigationTitle(title: "ABOUT SCHOOL")
        
        let notificationNIB = UINib(nibName: "NotificationTableViewCell", bundle: nil)
        tableViewForAboutschool.register(notificationNIB, forCellReuseIdentifier: "NotificationTableViewCell")
        
        tableViewForAboutschool.estimatedRowHeight = 49
        tableViewForAboutschool.rowHeight = UITableViewAutomaticDimension
        
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
        return self.arrTableview.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: NotificationTableViewCell = tableView.dequeueReusableCell(withIdentifier: "NotificationTableViewCell", for: indexPath) as! NotificationTableViewCell
        
        cell.setUIFor(strNotificationType: self.arrTableview[indexPath.row], strCellImage: self.arrCellImages[indexPath.row])
      //  cell.accessoryType = .disclosureIndicator
        
        // Cell Selection Clear color
        let bgColorView = UIView()
        bgColorView.backgroundColor = UIColor.clear
        cell.selectedBackgroundView = bgColorView
        self.tableViewForAboutschool.separatorStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let chatVC = UIStoryboard.getChatController()
        self.navigationController?.pushViewController(chatVC, animated: true)
    }
    //func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    //        return 49
    //    }
}
