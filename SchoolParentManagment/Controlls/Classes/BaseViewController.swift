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
    
    var backGroundView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        addGradient()
    }
    
    func addGradient() {
        //This method is separately created because in case if we dont want gradient in a controller then just ovverride this method leaving it blank
        addGradientView(withImageIndex: tabBarController?.selectedIndex ?? -1)
    }
    
    func addGradientView(withImageIndex imageIndex: Int! = -1) {
        if backGroundView == nil {
            let backgroundImageView = UIImageView()
            if appDelegate.environmentCharacterType == .Teacher {
                switch imageIndex {
                case 0:
                    backgroundImageView.image = UIImage(named: "wall0")
                case 1:
                    backgroundImageView.image = UIImage(named: "wall1")
                case 2:
                    backgroundImageView.image = UIImage(named: "wall2")
                case 3:
                    backgroundImageView.image = UIImage(named: "wall3")
                default:
                    backgroundImageView.image = UIImage(named: "wall2")
                }
            } else if appDelegate.environmentCharacterType == .Parent {
                switch imageIndex {
                case 0:
                    backgroundImageView.image = UIImage(named: "wall0")
                case 1:
                    backgroundImageView.image = UIImage(named: "wall1")
                case 2:
                    backgroundImageView.image = UIImage(named: "wall2")
                case 3:
                    backgroundImageView.image = UIImage(named: "wall3")
                case 4:
                    backgroundImageView.image = UIImage(named: "wall4")
                default:
                    backgroundImageView.image = UIImage(named: "wall2")
                }
            }
            backgroundImageView.frame = view.frame
            
            let visualEffect = UIBlurEffect(style: .dark)
            let visualView = UIVisualEffectView(effect: visualEffect)
            visualView.frame = view.bounds
            visualView.alpha = 0.7
            
            backGroundView = UIView(frame: view.frame)
            backGroundView.addSubview(backgroundImageView)
            backGroundView.addSubview(visualView)
            backGroundView.bringSubview(toFront: visualView)
            
            view.addSubview(backGroundView)
            view.sendSubview(toBack: backGroundView)
        }
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
        
        var image = UIImage(named: "backIcon")
        //Fills color all over the image
        let templateImage = image?.withRenderingMode(UIImageRenderingMode.alwaysTemplate)
        image = templateImage
        button.imageView?.tintColor = Global.getColorForCurrentEnvironmentType()
        
        button.setImage(image, for: .normal)
        
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
        navigationTitleLabel.text = title.uppercased()
        navigationTitleLabel.sizeToFit()
        navigationTitleLabel.textColor = Global.getColorForCurrentEnvironmentType()
        
        navigationItem.titleView = navigationTitleLabel
        self.navigationController?.navigationBar.barTintColor = UIColor.black
    }
    
    func showAlert(title: String, msg: String) {
        let alert = UIAlertController(title: title, message: msg, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
