//
//  ChildrensTableViewController.swift
//  SchoolParentManagment
//
//  Created by Bestpeers on 03/10/17.
//  Copyright © 2017 Bestpeers. All rights reserved.
//

import UIKit

class ChildrensTableViewController: BaseViewController, UITableViewDataSource,UITableViewDelegate {

    let arrEventImges: [String] = ["event0", "event1", "event2", "event3", "event4","event5","event6","event7","event8","event9","event10","event11"]
    let arrChidrensName: [String] = ["John Steev", "Peeter Ritso", "Calvin Harris"]
    let arrChidrensClass: [String] = ["10th", "5th", "LKG"]
    let arrChidrensImages: [String] = ["child1", "child2", "child3"]
    let arrRollNo: [String] = ["C10-12563", "C5-2226566", "LKG-56560"]
    
    @IBOutlet var tableView: UITableView!
    // @IBOutlet var childTableViewHeightConstraint: NSLayoutConstraint!
    
    // cell reuse id (cells that scroll out of view can be reused)
    let cellReuseIdentifier = "ChildrensTableViewController"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true

        setNavigationTitle(title: "Childrens")
            }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

    }
        override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
       // refreshHeightOfTableView()
    }
    
    //MARK: Private methods
    
    func refreshHeightOfTableView() {
        let height = tableView.contentSize.height
        //childTableViewHeightConstraint.constant = height
    }
    // MARK: - Table view data source

     func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.arrChidrensName.count
    }

    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath) as! ChildrensTableViewCell
        
         cell.accessoryType = .disclosureIndicator
       
        let childernName = self.arrChidrensName[indexPath.row]
        let childrenClass = self.arrChidrensClass[indexPath.row]
        let childRollNoIs =  self.arrRollNo[indexPath.row]
        
        //imageView.setRounded()
        cell.imgChildren.layer.borderWidth = 1
        cell.imgChildren.layer.masksToBounds = false
        cell.imgChildren.layer.borderColor = UIColor.black.cgColor
        cell.imgChildren.layer.cornerRadius = cell.imgChildren.frame.height/2
        cell.imgChildren.clipsToBounds = true
        cell.imgChildren.image = UIImage(named: self.arrChidrensImages[indexPath.row])
        
        cell.lblCName.text = childernName
        cell.lblCDetails.text = "Class  " + childrenClass
        cell.lblRollNo.text = "RollNo " + childRollNoIs
       
        // Cell Selection Clear color
        let bgColorView = UIView()
        bgColorView.backgroundColor = UIColor.clear
        cell.selectedBackgroundView = bgColorView
        return cell
    }
   
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//        if (indexPath.row % 2) == 0 {
//            cell.backgroundColor = UIColor.blue
//        }else{
//            cell.backgroundColor = UIColor.appDarkBlueColor
//        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cNmae = self.arrChidrensName[indexPath.row]
        let cRoll = self.arrRollNo[indexPath.row]
        let cClass = self.arrChidrensClass[indexPath.row]
        var cDetails : NSDictionary = ["CNAME": cNmae, "CROLL": cRoll, "CCLASS": cClass ]
        let mainStoryBoard = UIStoryboard(name: "Main", bundle: nil)
        let cDetailVC = mainStoryBoard.instantiateViewController(withIdentifier:sChildrenDetailIdentifier)
        UserDefaults.standard.setValue(cDetails, forKey: "childerns_details")
        print("\(UserDefaults.standard.value(forKey: "childerns_details")!)")
        self.navigationController?.pushViewController(cDetailVC, animated: false)
    }
  
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
         return 185.0;
    }
    
}
