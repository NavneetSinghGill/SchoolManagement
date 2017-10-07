//
//  BaseViewController.swift
//  SchoolParentManagment
//
//  Created by Navneet on 10/3/17.
//  Copyright © 2017 Bestpeers. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    var backBarButton: UIBarButtonItem!
    var rightBarButton: UIBarButtonItem!
    var navigationTitleLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    // For share button action
    func addShareButtonRight() {
        if rightBarButton == nil {
            rightBarButton = UIBarButtonItem(customView: rightButton())
            self.navigationItem.rightBarButtonItem = rightBarButton!
        }
    }
    private func rightButton() -> UIButton {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        button.backgroundColor = .clear
        button.setImage(UIImage(named: "share"), for: .normal)
        button.addTarget(self, action: #selector(EventDetailsViewController.shareButtonPressed(sender:)), for: .touchUpInside)
        
        return button
    }
    // MARK:- Back button action
    func addBackButton() {
        if backBarButton == nil {
            backBarButton = UIBarButtonItem(customView: backButton())
            self.navigationItem.leftBarButtonItem = backBarButton!
        } 
    }
    
    private func backButton() -> UIButton {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        button.backgroundColor = .clear
        button.setImage(UIImage(named: "backIcon"), for: .normal)
        button.addTarget(self, action: #selector(BaseViewController.backButtonTapped), for: .touchUpInside)
        
        return button
    }
    
    @objc func backButtonTapped() {
        if navigationController != nil {
            navigationController?.popViewController(animated: true)
        }
    }
    func setNavigationTitle(title:String) {
        if (navigationTitleLabel == nil) {
            navigationTitleLabel = UILabel()
        }

        navigationTitleLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 18)
        navigationTitleLabel.text = title
        navigationTitleLabel.sizeToFit()
        navigationTitleLabel.textColor = UIColor.black// Global.getLightColorForCurrentEnvironmentType()
        
        navigationItem.titleView = navigationTitleLabel
        self.navigationController?.navigationBar.barTintColor = Global.getColorForCurrentEnvironmentType()
    }
    
    func showAlert(title: String, msg: String) {
        let alert = UIAlertController(title: title, message: msg, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
