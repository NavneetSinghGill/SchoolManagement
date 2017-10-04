//
//  EventTableViewController.swift
//  SchoolParentManagment
//
//  Created by Bestpeers on 03/10/17.
//  Copyright © 2017 Bestpeers. All rights reserved.
//

import UIKit

class EventTableViewController: BaseViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet var tableview: UITableView!
    
    let arrEventImges: [String] = ["event0", "event1", "event2", "event3", "event4","event5","event6","event7","event8","event9","event10","event11"]
    
    // cell reuse id (cells that scroll out of view can be reused)
    let cellReuseIdentifier = "EventsTableViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //addBackButton()
        self.navigationItem.hidesBackButton = true
        setNavigationTitle(title: "Events")
        let barButton = UIBarButtonItem(image: UIImage(named: "add"), style: .plain, target: self, action: #selector(logoutTapped))
        self.navigationController?.topViewController?.navigationItem.rightBarButtonItem = barButton
        
//        self.navigationController?.navigationBar.topItem?.title = "School Events"
//        let nav = self.navigationController?.navigationBar
//        nav?.barStyle = UIBarStyle.black
//        nav?.tintColor = UIColor.white
//        nav?.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.appDarkBlueColor]
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }

    @objc func logoutTapped() -> Void {
        self.navigationController?.popToRootViewController(animated: false)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source
     func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrEventImges.count
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell  = tableview.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as! EventsTableViewCell!
        //  let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as PlacesTableViewCell
        // Configure the cell...
        
        let events = self.arrEventImges[indexPath.row]
       // cell.textLabel?.text = fruitName
        //cell.detailTextLabel?.text = "Event Is!"
        cell?.imgEvent?.image = UIImage(named: events)
        cell?.btnLike.tag = indexPath.row
        cell?.btnComment.tag = indexPath.row
        return cell!
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
