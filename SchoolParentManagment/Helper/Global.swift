//
//  Global.swift
//  SchoolParentManagment
//
//  Created by Navneet on 10/5/17.
//  Copyright © 2017 Bestpeers. All rights reserved.
//

import UIKit

class Global: NSObject {
    
    class func getColorForCurrentEnvironmentType() -> UIColor {
        switch appDelegate.environmentCharacterType {
        case .Teacher?:
            return baseGreen
        case .Parent?:
            return baseOrange
        default:
            return baseOrange
        }
    }

}
