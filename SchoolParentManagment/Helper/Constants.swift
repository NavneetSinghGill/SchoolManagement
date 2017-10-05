//
//  Constants.swift
//  SchoolParentManagment
//
//  Created by Bestpeers on 03/10/17.
//  Copyright © 2017 Bestpeers. All rights reserved.
//

import Foundation
import UIKit

//APP

let baseOrange = UIColor(red: 240/255.0, green: 146/255.0, blue: 34/255, alpha: 1.0)
let baseLightOrange = UIColor(red: 240/255.0, green: 218/255.0, blue: 156/255, alpha: 1.0)
let baseGreen = UIColor(red: 73/255.0, green: 128/255.0, blue: 67/255, alpha: 1.0)
let baseLightGreen = UIColor(red: 153/255.0, green: 255/255.0, blue: 133/255, alpha: 1.0)

//MARK: - ENUMs

enum ImageSourceType : Int {
    case none = 0
    case gallery
    case camera
}

// MARK: - Application

let appDelegate = UIApplication.shared.delegate as! AppDelegate
let kAppName = "SchoolParentManagment"

//MARK: - Cell Identifiers
let kMoreCellIdentifier = "moreCell"

// MARK: - Segue Identifiers

let kToProfilePhotoSegue = "toProfilePhoto"

// MARK: - UserDefaults

let kDidCompleteWalkthrough = "didCompleteWalkThrough"
let kWebToken = "webtoken"

//MARK: - Storyboard Identifiers

let kLoginViewControllerIdentifier = "LoginViewController"
let kLoginNavigationControllerIdentifier = "LoginNavigationController"

let sLoginViewControllerIdentifier = "LoginViewController"
let sHomeTabBarControllerllerIdentifier = "sHomeTabBarController"
let sEventTableViewControllerIdentifier = "sEventTableViewController"

let sSignUpViewControllerIdentifier = "sSignUpViewController"
let sFotgotPasswordViewControllerIdentifier = "sFotgotPasswordViewController"
let sChildrenDetailIdentifier = "sChildrenDetail"
let sNotificationsVCIdentifier = "sNotificationsVC"

//MARK: Colors

let blueColor = UIColor(red: 0, green: 110/255.0, blue: 190/255, alpha: 1.0)

enum CharacterType {
    case Teacher
    case Parent
    case StudentChild
}
