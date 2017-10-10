//
//  NotificationsVC.swift
//  SchoolParentManagment
//
//  Created by Bestpeers on 05/10/17.
//  Copyright © 2017 Bestpeers. All rights reserved.
//

import UIKit
import MessageUI

class NotificationsVC: BaseViewController ,UITableViewDelegate,UITableViewDataSource,NotificationCellProtocol, MFMailComposeViewControllerDelegate {
   
    let heightOfCell: CGFloat = 70
    
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
        
        tableViewForNotification.estimatedRowHeight = 40
        tableViewForNotification.rowHeight = UITableViewAutomaticDimension
        tableViewForNotification.tableFooterView = UIView()
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
        //cell.dividerView.isHidden = indexPath.row == 0
        cell.notificationDelegate = self
        
        //Fills color all over the image
        let templateImage = cell.imgView.image?.withRenderingMode(UIImageRenderingMode.alwaysTemplate)
        cell.imgView.image = templateImage
        cell.imgView.tintColor = Global.getColorForCurrentEnvironmentType()
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            let mailComposeViewController = configuredMailComposeViewController()
            if MFMailComposeViewController.canSendMail() {
                self.present(mailComposeViewController, animated: true, completion: nil)
            } else {
                self.showSendMailErrorAlert()
            }
        case 1:
            let chatVC = UIStoryboard.getChatController()
            self.navigationController?.pushViewController(chatVC, animated: true)
        case 2:
            let chatVC = UIStoryboard.getChatController()
            self.navigationController?.pushViewController(chatVC, animated: true)
        default: 
            let chatVC = UIStoryboard.getChatController()
            self.navigationController?.pushViewController(chatVC, animated: true)
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return heightOfCell
    }
    
    func cellTapped(with index: Int) {
//        let chatVC = UIStoryboard.getChatController()
//        self.navigationController?.pushViewController(chatVC, animated: true)

    }
    func configuredMailComposeViewController() -> MFMailComposeViewController {
        let mailComposerVC = MFMailComposeViewController()
        mailComposerVC.mailComposeDelegate = self // Extremely important to set the --mailComposeDelegate-- property, NOT the --delegate-- property
        
        mailComposerVC.setToRecipients(["someone@somewhere.com"])
        mailComposerVC.setSubject("Sending you an in-app e-mail...")
        mailComposerVC.setMessageBody("Sending e-mail in-app is not so bad!", isHTML: false)
        
        return mailComposerVC
    }
    
    func showSendMailErrorAlert() {
        let sendMailErrorAlert = UIAlertView(title: "Could Not Send Email", message: "Your device could not send e-mail.  Please check e-mail configuration and try again.", delegate: self, cancelButtonTitle: "OK")
        sendMailErrorAlert.show()
    }
    
    // MARK: MFMailComposeViewControllerDelegate Method
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
}
