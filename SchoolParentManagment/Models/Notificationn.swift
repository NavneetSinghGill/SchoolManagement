//
//  Notifictionn.swift
//  SchoolParentManagment
//
//  Created by Navneet on 10/9/17.
//  Copyright © 2017 Bestpeers. All rights reserved.
//

import UIKit

class Notificationn: NSObject {

    var notificationDescription: String?
    var title: String?
    var profileImage: String?
    
    func fakeData(for index: Int) {
        let index1 = index%2
        if index1 == 0 {
            title = "New event @RBA corner"
            notificationDescription = "An event has been organised at RBA corner."
            profileImage = "notif1"
        } else if index1 == 1 {
            title = "Tech Fest"
            notificationDescription = "Tech Fest will be organised in next 3 days. Get ready to prize exiting prizes"
            profileImage = "notif2"
        }
    }
    
}
