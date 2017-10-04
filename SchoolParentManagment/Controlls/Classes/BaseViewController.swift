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
    var navigationTitleLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    
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
        navigationTitleLabel.textColor = UIColor.appBlueColor
        navigationTitleLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 16)
        navigationTitleLabel.text = title
        navigationTitleLabel.sizeToFit()
        
        navigationItem.titleView = navigationTitleLabel
    }
}