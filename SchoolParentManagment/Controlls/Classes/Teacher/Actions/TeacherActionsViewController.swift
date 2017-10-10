//
//  TeacherActionsViewController.swift
//  SchoolParentManagment
//
//  Created by Navneet on 10/5/17.
//  Copyright © 2017 Bestpeers. All rights reserved.
//

import UIKit

class TeacherActionsViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource, NotificationCellProtocol {

    let heightOfHeader: CGFloat = 70
    let heightOfCell: CGFloat = 54
    
    let actions: NSArray = ["Home work", "Children management", "Attendance management", "Leave management", "Application management"]
    let actionImages: NSArray = ["homework", "children", "attendance", "leave", "application"]
    let actionOptions: NSArray = [[], ["Add child", "Search child"], [], ["Pending approvals", "Approved leaves"], []]
    
    @IBOutlet weak var actionsTableView: UITableView!
    var notificationsNIB: UINib!
    
    var isHomeWorkSectionExpanded: Bool = false
    var isChildrenSectionExpanded: Bool = false
    var isAttendanceSectionExpanded: Bool = false
    var isLeaveSectionExpanded: Bool = false
    var isApplicationSectionExpanded: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        notificationsNIB = UINib(nibName: "NotificationTableViewCell", bundle: nil)
        actionsTableView.register(notificationsNIB, forCellReuseIdentifier: "NotificationTableViewCell")
        
        actionsTableView.estimatedRowHeight = 40
        actionsTableView.rowHeight = UITableViewAutomaticDimension
        
        setNavigationTitle(title: "ACTIONS")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        actionsTableView.reloadData()
    }
    
    //MARK: Tableview datasource methods
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return actions.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return isHomeWorkSectionExpanded ? (actionOptions[section] as! NSArray).count : 0
        case 1:
            return isChildrenSectionExpanded ? (actionOptions[section] as! NSArray).count : 0
        case 2:
            return isAttendanceSectionExpanded ? (actionOptions[section] as! NSArray).count : 0
        case 3:
            return isLeaveSectionExpanded ? (actionOptions[section] as! NSArray).count : 0
        case 4:
            return isApplicationSectionExpanded ? (actionOptions[section] as! NSArray).count : 0
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: NotificationTableViewCell = tableView.dequeueReusableCell(withIdentifier: "NotificationTableViewCell", for: indexPath) as! NotificationTableViewCell
        
        cell.setUIFor(strNotificationType: (actionOptions[indexPath.section] as! NSArray)[indexPath.row] as? String, strCellImage: "")
        cell.disclosure.isHidden = false
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return heightOfCell
    }
    
    //MARK: Tableview delegate methods
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell: NotificationTableViewCell? = (Bundle.main.loadNibNamed("NotificationTableViewCell", owner: self, options: nil)![0] as? UIView) as? NotificationTableViewCell
        cell?.frame.size.height = heightOfHeader
        cell?.layoutIfNeeded()
        
        cell?.index = section
        cell?.notificationDelegate = self
        cell?.setUIFor(strNotificationType: actions[section] as! String, strCellImage: actionImages[section] as! String)
        
        //Fills color all over the image
        let templateImage = cell?.imgView.image?.withRenderingMode(UIImageRenderingMode.alwaysTemplate)
        cell?.imgView.image = templateImage
        cell?.imgView.tintColor = Global.getColorForCurrentEnvironmentType()
        
        cell?.frame.size.width = tableView.frame.size.width
        cell?.frame.size.height = heightOfHeader
        cell?.selectButton.isHidden = false
        
        if (actionOptions[section] as! NSArray).count > 0 {
            if isSectionOpen(of: section) {
                shouldSetAccessory(should: false, of: cell)
            } else {
                shouldSetAccessory(should: true, of: cell)
            }
        } else { // == 0
            shouldSetAccessory(should: true, of: cell)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return heightOfHeader
    }
    
    //MARK: Notification cell protocol methods
    
    func cellTapped(with index: Int) {
        
        //For header Only
        switch index {
        case 0:
//            isHomeWorkSectionExpanded = !isHomeWorkSectionExpanded
            openHomeListViewController()
        case 1:
            isChildrenSectionExpanded = !isChildrenSectionExpanded
        case 2:
            isAttendanceSectionExpanded = !isAttendanceSectionExpanded
        case 3:
            isLeaveSectionExpanded = !isLeaveSectionExpanded
        case 4:
            isApplicationSectionExpanded = !isApplicationSectionExpanded
        default:
            break;
        }
        actionsTableView.reloadData()
    }

    //MARK: Private methods
    
    func openHomeListViewController() {
        let homeWorkVC = UIStoryboard(name: "Teacher", bundle: nil).instantiateViewController(withIdentifier: "HomeWorkViewController")
        self.navigationController?.pushViewController(homeWorkVC, animated: true)
    }
    
    func shouldSetAccessory(should: Bool, of cell:NotificationTableViewCell?) {
        if should {
            cell?.disclosure.isHidden = false
        } else {
            cell?.disclosure.isHidden = true
        }
    }
    
    func isSectionOpen(of index: Int) -> Bool {
        
        //For header Only
        switch index {
        case 0:
            return isHomeWorkSectionExpanded
        case 1:
            return isChildrenSectionExpanded
        case 2:
            return isAttendanceSectionExpanded
        case 3:
            return isLeaveSectionExpanded
        case 4:
            return isApplicationSectionExpanded
        default:
            return false
        }
    }
    
}
