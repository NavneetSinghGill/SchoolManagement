//
//  ChildrensTableViewController.swift
//  SchoolParentManagment
//
//  Created by Bestpeers on 03/10/17.
//  Copyright © 2017 Bestpeers. All rights reserved.
//

import UIKit

class ChildrensTableViewController: BaseViewController, UITableViewDataSource,UITableViewDelegate {
    
    var studentChilds: [StudentChild] = []
    
    @IBOutlet var tableView: UITableView!
    
    // cell reuse id (cells that scroll out of view can be reused)
    let cellReuseIdentifier = "ChildrensTableViewController"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        setNavigationTitle(title: "CHILDREN")
        
        tableView.estimatedRowHeight = 49
        tableView.rowHeight = UITableViewAutomaticDimension
        
        //Fake data
        let studentChildFake1 = StudentChild()
        studentChildFake1.fakeData(for: 0)
        studentChilds.append(studentChildFake1)
        
        let studentChildFake2 = StudentChild()
        studentChildFake2.fakeData(for: 1)
        studentChilds.append(studentChildFake2)
    
        let studentChildFake3 = StudentChild()
        studentChildFake3.fakeData(for: 2)
        studentChilds.append(studentChildFake3)
      tableView.reloadData()
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
    
    // MARK: - Table view data source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return studentChilds.count
    }
    
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath) as! ChildrensTableViewCell
        
        cell.setUIFor(characterType: .StudentChild, with: studentChilds[indexPath.row])
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
        
        let studentChildDetailsVC = getStudentChildsVC()
        studentChildDetailsVC.studentChild = studentChilds[indexPath.row]
        studentChildDetailsVC.shouldShowBackButton = true
        
        self.navigationController?.pushViewController(studentChildDetailsVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 185.0;
    }
    private func getStudentChildsVC() -> StudentChildDetailsViewController {
        let teacherStoryBoard = UIStoryboard(name: "Teacher", bundle: nil)
        let studentChildDetailsVC: StudentChildDetailsViewController = teacherStoryBoard.instantiateViewController(withIdentifier: "StudentChildDetailsViewController") as! StudentChildDetailsViewController
        
        return studentChildDetailsVC
    }
}
