//
//  EventVC.swift
//  SchoolParentManagment
//
//  Created by Bestpeers on 05/10/17.
//  Copyright © 2017 Bestpeers. All rights reserved.
//

import UIKit

class EventVC: BaseViewController ,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var tableViewForEvent: UITableView!
    //    let arrNotificationsType: [String] = ["Teacher feedback of child", "Transportation updates", "Fees status updates"]
    //    let arrCellImages: [String] =  ["Send feedback", "Transportation", "Fees"]
    //
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.navigationItem.hidesBackButton = true
        setNavigationTitle(title: "Event")
        
        let notificationNIB = UINib(nibName: "EventTableViewCell", bundle: nil)
        tableViewForEvent.register(notificationNIB, forCellReuseIdentifier: "EventTableViewCell")
        
        tableViewForEvent.estimatedRowHeight = 90
        tableViewForEvent.rowHeight = UITableViewAutomaticDimension
        
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
        return 1
        //self.arrNotificationsType.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: EventTableViewCell = tableView.dequeueReusableCell(withIdentifier: "EventTableViewCell", for: indexPath) as! EventTableViewCell
        
        //        cell.setUIFor(strNotificationType: self.arrNotificationsType[indexPath.row], strCellImage: self.arrCellImages[indexPath.row])
        
        cell.lblEventName.text = "‘sh’ sound Activity"
        cell.lblEventTimeDate.text =  "2017-11-04 22:45:00"
        cell.lblEventaddress.text = "Channing School for Girls- Senior School  The Bank, Highgate, London N6 5HF, UK, Phone:+44 20 8340 2328"
        cell.accessoryType = .disclosureIndicator
        
        // Cell Selection Clear color
        let bgColorView = UIView()
        bgColorView.backgroundColor = UIColor.clear
        cell.selectedBackgroundView = bgColorView
        self.tableViewForEvent.separatorStyle = .none
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let alert = UIAlertController(title: "School Managment", message: "This app feature is under working", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
}
