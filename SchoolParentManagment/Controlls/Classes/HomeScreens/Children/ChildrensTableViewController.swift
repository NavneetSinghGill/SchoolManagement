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
    let arrChidrensImages: [String] = ["John Steev", "Peeter Ritso", "calvin Harris"]
    let arrRollNo: [String] = ["C10-12563", "C5-2226566", "LKG-56560"]
    
    @IBOutlet var tableView: UITableView!
    
    
    // cell reuse id (cells that scroll out of view can be reused)
    let cellReuseIdentifier = "ChildrensTableViewController"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true

        setNavigationTitle(title: "Childrens")
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        self.navigationController?.navigationBar.topItem?.title = "Childrens"
//        let nav = self.navigationController?.navigationBar
//        nav?.barStyle = UIBarStyle.black
//        nav?.tintColor = UIColor.white
//        nav?.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.appDarkBlueColor]
    }
    
//    override func viewWillDisappear(_ animated: Bool) {
//        super.viewWillDisappear(animated)
//          self.navigationController?.navigationBar.topItem?.title = nil
//    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
       
      //  let childImg = self.arrEventImges[indexPath.row]
        let childernName = self.arrChidrensName[indexPath.row]
        let childrenClass = self.arrChidrensClass[indexPath.row]
        let childRollNoIs =  self.arrRollNo[indexPath.row]
        
        
        // cell.textLabel?.text = fruitName
        //cell.detailTextLabel?.text = "Event Is!"
       // cell.imgChildren?.image = UIImage(named: events)
        cell.lblCName.text = childernName
        cell.lblCDetails.text = "Class  " + childrenClass
        cell.lblRollNo.text = "RollNo " + childRollNoIs
        
        let bgColorView = UIView()
        bgColorView.backgroundColor = UIColor.clear
        cell.selectedBackgroundView = bgColorView
        
        return cell
    }
   
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if (indexPath.row % 2) == 0 {
            cell.backgroundColor = UIColor.blue
        }else{
            cell.backgroundColor = UIColor.appDarkBlueColor
        }
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
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
