//
//  TeacherSearchViewController.swift
//  SchoolParentManagment
//
//  Created by Navneet on 10/3/17.
//  Copyright © 2017 Bestpeers. All rights reserved.
//

import UIKit

class TeacherSearchViewController: BaseViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {
    
    let heightOfCell: CGFloat = 66

    @IBOutlet var tableView: UITableView!
    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var segmentControl: UISegmentedControl!
    
    var studentChilds: [StudentChild] = []
    var parents: [Parent] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let searchNIB = UINib(nibName: "SearchTableViewCell", bundle: nil)
        tableView.register(searchNIB, forCellReuseIdentifier: "SearchTableViewCell")
        
        searchBar.barTintColor = Global.getColorForCurrentEnvironmentType()
        segmentControl.tintColor = Global.getColorForCurrentEnvironmentType()
        
        setNavigationTitle(title: "SEARCH")
                
        //Fake data
        for i in 0..<3 {
            let studentChildFake = StudentChild()
            studentChildFake.fakeData(for: i)
            studentChilds.append(studentChildFake)
        }
        for i in 0..<3 {
            let parentFake = Parent()
            parentFake.fakeData(for: i)
            parents.append(parentFake)
        }
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }
    
    //MARK: Tableview datasource methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if segmentControl.selectedSegmentIndex == 0 {
            return self.studentChilds.count
        } else {
            return self.parents.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: SearchTableViewCell = tableView.dequeueReusableCell(withIdentifier: "SearchTableViewCell", for: indexPath) as! SearchTableViewCell
        
        if segmentControl.selectedSegmentIndex == 0 {
            cell.setUIFor(characterType: .StudentChild, with: studentChilds[indexPath.row])
        } else {
            cell.setUIFor(characterType: .Parent, with: parents[indexPath.row])
        }
        
        cell.frame.size.height = heightOfCell
        cell.layoutIfNeeded()
        cell.backGroundCurveView.cornerRadius = cell.backGroundCurveView.frame.size.height/2
        return cell
    }
    
    //MARK: Tableview delegate methods
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if segmentControl.selectedSegmentIndex == 0 { // ChildStudents
            let studentChildDetailsVC = getStudentChildsVC()
            studentChildDetailsVC.shouldShowBackButton = true
            studentChildDetailsVC.studentChild = studentChilds[indexPath.row]
            
            self.navigationController?.pushViewController(studentChildDetailsVC, animated: true)
        } else { //Parents
            
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return heightOfCell
    }
    
    //MARK: Search bar delegate methods
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
    }
    
    //MARK: Private methods
    
    private func getStudentChildsVC() -> StudentChildDetailsViewController {
        let teacherStoryBoard = UIStoryboard(name: "Teacher", bundle: nil)
        let studentChildDetailsVC: StudentChildDetailsViewController = teacherStoryBoard.instantiateViewController(withIdentifier: "StudentChildDetailsViewController") as! StudentChildDetailsViewController
        
        return studentChildDetailsVC
    }
    
    //MARK: IBAction methods
    
    @IBAction func segmentValueChanged(segmentControl: UISegmentedControl) {
        tableView.reloadData()
    }
    
    @IBAction func addChildButtonTapped() {
        let studentChildDetailsVC = getStudentChildsVC()
        studentChildDetailsVC.shouldShowBackButton = true
        
        self.navigationController?.pushViewController(studentChildDetailsVC, animated: true)
    }

}
