//
//  StudentChildDetailsViewController.swift
//  SchoolParentManagment
//
//  Created by Navneet on 10/3/17.
//  Copyright © 2017 Bestpeers. All rights reserved.
//

import UIKit

class StudentChildDetailsViewController: BaseViewController, UITableViewDataSource, UITableViewDelegate {
    
    let heightOfCell: CGFloat = 66
    
    @IBOutlet var parentsTableView: UITableView!
    @IBOutlet var parentsTableViewHeightConstraint: NSLayoutConstraint!
    
    @IBOutlet var firstNameTextField: UITextField!
    @IBOutlet var lastNameTextField: UITextField!
    @IBOutlet var phoneNumberTextField: UITextField!
    @IBOutlet var standardTextField: UITextField!
    @IBOutlet var rollNumberTextField: UITextField!
    @IBOutlet var attendanceTextField: UITextField!
    
    var parents: [Parent] = []
    
    var shouldShowBackButton: Bool = false
    var studentChild: StudentChild?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let parentNIB = UINib(nibName: "ParentTableViewCell", bundle: nil)
        parentsTableView.register(parentNIB, forCellReuseIdentifier: "ParentTableViewCell")
        
        if shouldShowBackButton {
            addBackButton()
        }
        
        if studentChild != nil {
            setInfo(of: studentChild)
        }
        if studentChild?.firstName != nil {
            if studentChild?.lastName != nil {
                setNavigationTitle(title: "\(studentChild?.firstName! ?? "") \(studentChild?.lastName! ?? "")".uppercased())
            } else {
                setNavigationTitle(title: "\(studentChild?.firstName ?? "")".uppercased())
            }
        } else {
            setNavigationTitle(title: "")
        }
        
        parentsTableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.navigationBar.isHidden = false
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        refreshHeightOfTableView()
    }
    
    //MARK: Private methods
    
    func refreshHeightOfTableView() {
        let height = heightOfCell*CGFloat(parents.count)
        parentsTableViewHeightConstraint.constant = height
//        self.view.layoutIfNeeded()
    }
    
    func setInfo(of studentChild: StudentChild?) {
        firstNameTextField.text = studentChild?.firstName
        lastNameTextField.text = studentChild?.lastName
        phoneNumberTextField.text = studentChild?.phoneNumber
        standardTextField.text = studentChild?.standard
        rollNumberTextField.text = studentChild?.rollNumber
        attendanceTextField.text = studentChild?.attendancePercent
        self.parents = (studentChild?.parents)!
        
        parentsTableView.reloadData()
    }
    
    //MARK: Tableview datasource methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return parents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ParentTableViewCell = tableView.dequeueReusableCell(withIdentifier: "ParentTableViewCell", for: indexPath) as! ParentTableViewCell
        
        cell.setUIFor(characterType: .Parent, with: parents[indexPath.row])
        
        cell.frame.size.height = heightOfCell
        cell.layoutIfNeeded()
        cell.backGroundCurveView.cornerRadius = cell.backGroundCurveView.frame.size.height/2
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
         return heightOfCell
    }

}
