//
//  UIColorExtension.swift
//  SchoolParentManagment
//
//  Created by Bestpeers on 04/10/17.
//  Copyright © 2017 Bestpeers. All rights reserved.

import UIKit

extension UIColor {
    
    class var appBlueColor : UIColor {
        return UIColor.init(red: 0.0/255.0, green: 90.0/255.0, blue: 160.0/255.0, alpha: 1.0)
    }
    
    class var appGreyColor : UIColor {
        return UIColor.init(red: 102.0/255.0, green: 102.0/255.0, blue: 102.0/255.0, alpha: 1.0)
    }
    
    class var appBlackTextColor : UIColor {
        return UIColor.init(red: 51.0/255.0, green: 51.0/255.0, blue: 51.0/255.0, alpha: 1.0)
    }
    
    
    class var appDarkBlueColor : UIColor {
        return UIColor.init(red: 0, green: 37.0/255.0, blue: 80.0/255.0, alpha: 1.0)
    }
    class var appbaseLightOrange : UIColor {
        return UIColor.init(red: 240/255.0, green: 218/255.0, blue: 156/255, alpha: 1.0)
    }
    class var appbaseGreen : UIColor {
        return UIColor.init(red: 73/255.0, green: 128/255.0, blue: 67/255, alpha: 1.0)
    }
}
extension UIImageView {
    func setRounded() {
        self.layer.cornerRadius = (self.frame.width / 2) //instead of let radius = CGRectGetWidth(self.frame) / 2
        self.layer.masksToBounds = true
    }
}

extension String {
    var isPhoneNumber: Bool {
        do {
            let detector = try NSDataDetector(types: NSTextCheckingResult.CheckingType.phoneNumber.rawValue)
            let matches = detector.matches(in: self, options: [], range: NSMakeRange(0, self.characters.count))
            if let res = matches.first {
                return res.resultType == .phoneNumber && res.range.location == 0 && res.range.length == self.characters.count && self.characters.count == 10 
            } else {
                return false
            }
        } catch {
            return false
        }
    }
}
