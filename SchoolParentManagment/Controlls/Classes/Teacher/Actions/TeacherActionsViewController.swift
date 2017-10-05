//
//  TeacherActionsViewController.swift
//  SchoolParentManagment
//
//  Created by Navneet on 10/5/17.
//  Copyright © 2017 Bestpeers. All rights reserved.
//

import UIKit

class TeacherActionsViewController: BaseViewController {

    let actions: NSArray = ["Home work", "Children"]
    
    override func viewDidLoad() {
        super.viewDidLoad()


    }
    
    
    
    //MARK: Tableview datasource methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: HomeWorkTableViewCell = tableView.dequeueReusableCell(withIdentifier: "HomeWorkTableViewCell", for: indexPath) as! HomeWorkTableViewCell
        
//        cell.setUIFor(homeWork: homeWorks[indexPath.row])
        
        return cell
    }

}
