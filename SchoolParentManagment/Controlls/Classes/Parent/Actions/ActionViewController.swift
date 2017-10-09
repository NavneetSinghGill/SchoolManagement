//
//  ActionViewController.swift
//  SchoolParentManagment
//
//  Created by Bestpeers on 03/10/17.
//  Copyright © 2017 Bestpeers. All rights reserved.
//

import UIKit
class ActionViewController: BaseViewController ,UITableViewDelegate,UITableViewDataSource{
   
    
    @IBOutlet weak var tableViewForAction: UITableView!
    let arrActionType: [String] = [" Leave management", "Application to teacher", "Chat with teacher"]
    let arrCellImages: [String] =  ["leave", "application", "chat"]
    
    let heightOfHeader: CGFloat = 50.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.navigationItem.hidesBackButton = true
        setNavigationTitle(title: "ACTION")
        
        let actionNIB = UINib(nibName: "NotificationTableViewCell", bundle: nil)
        tableViewForAction.register(actionNIB, forCellReuseIdentifier: "NotificationTableViewCell")
        
        tableViewForAction.estimatedRowHeight = 40
        tableViewForAction.rowHeight = UITableViewAutomaticDimension
        tableViewForAction.tableFooterView = UIView()
        
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
        
        cell.disclosure.isHidden = false
        cell.dividerView.isHidden = true
      //  cell.notificationDelegate = self
        //Fills color all over the image
        let templateImage = cell.imgView.image?.withRenderingMode(UIImageRenderingMode.alwaysTemplate)
        cell.imgView.image = templateImage
        cell.imgView.tintColor = Global.getColorForCurrentEnvironmentType()
        
        cell.frame.size.width = tableView.frame.size.width
        cell.frame.size.height = heightOfHeader
        //cell.selectButton.isHidden = false
        
        // Cell Selection Clear color
        cell.selectionStyle = UITableViewCellSelectionStyle.none

        
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
    
   
//    // MARK:- Notification Delegate Method
//    func cellTapped(with index: Int) {
//        let chatVC = UIStoryboard.getChatController()
//        self.navigationController?.pushViewController(chatVC, animated: true)
//    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return heightOfHeader
    }
}
