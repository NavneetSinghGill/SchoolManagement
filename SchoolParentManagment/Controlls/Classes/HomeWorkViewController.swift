//
//  HomeWorkViewController.swift
//  SchoolParentManagment
//
//  Created by Navneet on 10/4/17.
//  Copyright © 2017 Bestpeers. All rights reserved.
//

import UIKit

class HomeWorkViewController: BaseViewController , UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var homeWorkTableView: UITableView!
    var homeWorks: [HomeWork] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let homeWorkNIB = UINib(nibName: "HomeWorkTableViewCell", bundle: nil)
        homeWorkTableView.register(homeWorkNIB, forCellReuseIdentifier: "HomeWorkTableViewCell")
        
        homeWorkTableView.estimatedRowHeight = 40
        homeWorkTableView.rowHeight = UITableViewAutomaticDimension
        
        setNavigationTitle(title: "ACTIONS")
        
        //Fake data
        let homwWorkFake1 = HomeWork()
        homwWorkFake1.fakeData(for: 0)
        homeWorks.append(homwWorkFake1)
        
        let homwWorkFake2 = HomeWork()
        homwWorkFake2.fakeData(for: 1)
        homeWorks.append(homwWorkFake2)
        
        homeWorkTableView.reloadData()
    }

    
    
    //MARK: Tableview datasource methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.homeWorks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: HomeWorkTableViewCell = tableView.dequeueReusableCell(withIdentifier: "HomeWorkTableViewCell", for: indexPath) as! HomeWorkTableViewCell
        
        cell.setUIFor(homeWork: homeWorks[indexPath.row])
        
        return cell
    }
    
}
