//
//  TeacherSearchViewController.swift
//  SchoolParentManagment
//
//  Created by Navneet on 10/3/17.
//  Copyright © 2017 Bestpeers. All rights reserved.
//

import UIKit

class TeacherSearchViewController: BaseViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {

    @IBOutlet var tableView: UITableView!
    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var segmentControl: UISegmentedControl!
    
    var studentChilds: [StudentChild] = []
    var parents: [Parent] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let searchNIB = UINib(nibName: "SearchTableViewCell", bundle: nil)
        tableView.register(searchNIB, forCellReuseIdentifier: "SearchTableViewCell")
        
        tableView.estimatedRowHeight = 40
        tableView.rowHeight = UITableViewAutomaticDimension
        
        searchBar.barTintColor = Global.getColorForCurrentEnvironmentType()
        segmentControl.tintColor = Global.getColorForCurrentEnvironmentType()
        
        setNavigationTitle(title: "SEARCH")
                
        //Fake data
        let studentChildFake1 = StudentChild()
        studentChildFake1.fakeData(for: 0)
        studentChilds.append(studentChildFake1)
        
        let parentFake1 = Parent()
        parentFake1.fakeData(for: 0)
        parents.append(parentFake1)
        let parentFake2 = Parent()
        parentFake2.fakeData(for: 1)
        parents.append(parentFake2)
        
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
        
        return cell
    }
    
    //MARK: Tableview delegate methods
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if segmentControl.selectedSegmentIndex == 0 { // ChildStudents
            let studentChildDetailsVC = getStudentChildsVC()
            studentChildDetailsVC.shouldShowBackButton = true
            studentChildDetailsVC.studentChild = studentChilds[indexPath.row]
            
            self.navigationController?.pushViewController(studentChildDetailsVC, animated: true)
        } else { //Parents
            
        }
    }
    
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let blueView = UIView()
//        blueView.backgroundColor = blueColor
//        blueView.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 40)
//
//        let whiteLabel = UILabel()
//        whiteLabel.textColor = UIColor.white
//        if segmentControl.selectedSegmentIndex == 0 {
//            whiteLabel.text = "Students"
//        } else {
//            whiteLabel.text = "Parents"
//        }
//        whiteLabel.sizeToFit()
//        whiteLabel.center = blueView.center
//        blueView.addSubview(whiteLabel)
//
//        return blueView
//    }
//
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 40
//    }
    
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
