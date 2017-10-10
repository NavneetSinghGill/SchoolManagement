//
//  AboutSchoolViewController.swift
//  SchoolParentManagment
//
//  Created by Bestpeers on 03/10/17.
//  Copyright © 2017 Bestpeers. All rights reserved.
//

import UIKit

class AboutSchoolViewController: BaseViewController ,UITableViewDataSource, UITableViewDelegate, NotificationCellProtocol{
   
    
    @IBOutlet weak var tableViewForAboutschool: UITableView!
   
    let arrAboutSchool: [String] = ["Transportation details", "Gallery", "Holiday", "Contact", "Send feedback"]
    let arrAboutSchoolImages: [String] =  ["Transportation", "Gallery", "Holiday", "Contact", "Send feedback"]
    let arrAboutSchoolOptions: NSArray = [[], ["Photo", "Video"], [], [], []]
    
    let heightOfHeader: CGFloat = 50

    var isTransportationSectionExpanded: Bool = false
    var isGallerySectionExpanded: Bool = false
    var isHolidaySectionExpanded: Bool = false
    var isContactSectionExpanded: Bool = false
    var isSendfeedbackSectionExpanded: Bool = false
    
    var notificationsNIB: UINib!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.navigationItem.hidesBackButton = true
        setNavigationTitle(title: "ABOUT SCHOOL")
        
        notificationsNIB = UINib(nibName: "NotificationTableViewCell", bundle: nil)
        tableViewForAboutschool.register(notificationsNIB, forCellReuseIdentifier: "NotificationTableViewCell")
        
        tableViewForAboutschool.estimatedRowHeight = 40
        tableViewForAboutschool.rowHeight = UITableViewAutomaticDimension
        tableViewForAboutschool.tableFooterView = UIView()

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: Tableview datasource
    func numberOfSections(in tableView: UITableView) -> Int {
        return arrAboutSchool.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return isTransportationSectionExpanded ? (arrAboutSchoolOptions[section] as! NSArray).count : 0
        case 1:
            return isGallerySectionExpanded ? (arrAboutSchoolOptions[section] as! NSArray).count : 0
        case 2:
            return isHolidaySectionExpanded ? (arrAboutSchoolOptions[section] as! NSArray).count : 0
        case 3:
            return isContactSectionExpanded ? (arrAboutSchoolOptions[section] as! NSArray).count : 0
        case 4:
            return isSendfeedbackSectionExpanded ? (arrAboutSchoolOptions[section] as! NSArray).count : 0
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
        let cell: NotificationTableViewCell = tableView.dequeueReusableCell(withIdentifier: "NotificationTableViewCell", for: indexPath) as! NotificationTableViewCell
        
        cell.setUIFor(strNotificationType: (arrAboutSchoolOptions[indexPath.section] as! NSArray)[indexPath.row] as? String, strCellImage: "")
        cell.disclosure.isHidden = false
        cell.dividerView.isHidden = true
        
        return cell
    }
     //MARK: Tableview Delegate Method
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell: NotificationTableViewCell? = (Bundle.main.loadNibNamed("NotificationTableViewCell", owner: self, options: nil)![0] as? UIView) as? NotificationTableViewCell
        
        cell?.index = section
        cell?.notificationDelegate = self
        cell?.setUIFor(strNotificationType: arrAboutSchool[section] as! String, strCellImage: arrAboutSchoolImages[section] as! String)
        
        //Fills color all over the image
        let templateImage = cell?.imgView.image?.withRenderingMode(UIImageRenderingMode.alwaysTemplate)
        cell?.imgView.image = templateImage
        cell?.imgView.tintColor = Global.getColorForCurrentEnvironmentType()
        
        cell?.frame.size.width = tableView.frame.size.width
        cell?.frame.size.height = heightOfHeader
        cell?.selectButton.isHidden = false
        
        if (arrAboutSchoolOptions[section] as! NSArray).count > 0 {
            if isSectionOpen(of: section) {
                shouldSetAccessory(should: false, of: cell)
            } else {
                shouldSetAccessory(should: true, of: cell)
            }
        } else { // == 0
            shouldSetAccessory(should: true, of: cell)
        }
        cell?.dividerView.isHidden = section == 0
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return heightOfHeader
    }
    
    
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let chatVC = UIStoryboard.getChatController()
//        self.navigationController?.pushViewController(chatVC, animated: true)
//    }
   
    //MARK: Notification cell protocol methods
    func cellTapped(with index: Int) {
        
        //For header Only
        switch index {
        case 0:
//            isHomeWorkSectionExpanded = !isHomeWorkSectionExpanded
            openHomeListViewController()
        case 1:
            isGallerySectionExpanded = !isGallerySectionExpanded
        case 2:
             openHomeListViewController()
        case 3:
            openContactUsVC()
        case 4:
            openHomeListViewController()
        default:
            break;
        }
        tableViewForAboutschool.reloadData()
    }
    
    //MARK: Private methods
    
    func openHomeListViewController() {
//        let homeWorkVC = UIStoryboard(name: "Teacher", bundle: nil).instantiateViewController(withIdentifier: "HomeWorkViewController")
//        self.navigationController?.pushViewController(homeWorkVC, animated: true)
        let chatVC = UIStoryboard.getChatController()
        self.navigationController?.pushViewController(chatVC, animated: true)
    }
    
    func openContactUsVC() -> Void {
        let contactUsVC = UIStoryboard.getContactUs()
        self.navigationController?.pushViewController(contactUsVC, animated: true)
    }
    /*func openHolidays() -> Void {
        let holidays = UIStoryboard.getHolidays()
        self.navigationController?.pushViewController(holidays, animated: true)
        
    }*/
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
            return isTransportationSectionExpanded
        case 1:
            return isGallerySectionExpanded
        case 2:
            return isHolidaySectionExpanded
        case 3:
            return isContactSectionExpanded
        case 4:
            return isSendfeedbackSectionExpanded
        default:
            return false
        }
    }
    
}
