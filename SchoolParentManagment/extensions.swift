//
//  extensions.swift
//  LevelSense
//
//  Created by Zoeb Sheikh on 8/21/17.
//  Copyright © 2017 Zoeb Sheikh. All rights reserved.
//

import Foundation
import UIKit

extension String {
    
    func isValidEmail() -> Bool {
        
        let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
        return emailPredicate.evaluate(with: self)
    }
    
    func trim() -> String {
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}

/*
 extension CGFloat {
    
    func rounded(toPlaces places:Int) -> String {
        let divisor: CGFloat = pow(10.0, CGFloat(places))
        return "\((self * divisor).rounded() / divisor)"
    }
}
 */

extension UIView {
    @IBInspectable var borderWidth : CGFloat {
        set {
            layer.borderWidth = newValue
        }
        
        get {
            return layer.borderWidth
        }
    }
    
    @IBInspectable var cornerRadius : CGFloat {
        set {
            layer.masksToBounds = true
            layer.cornerRadius = newValue
        }
        
        get {
            return layer.cornerRadius
        }
    }
    
    @IBInspectable var borderColor : CGColor {
        set {
            layer.borderColor = newValue
        }
        
        get {
            return layer.borderColor!
        }
    }
}

extension UITableView {
    func registerNib(withIdentifierAndNibName: String) -> Void {
        let nib = UINib(nibName: withIdentifierAndNibName, bundle: nil)
        self.register(nib, forCellReuseIdentifier: withIdentifierAndNibName)
    }
}

extension CALayer {
    func removeSubLayersAndPaths() {
        for i in 0..<(self.sublayers?.count != nil ? (self.sublayers?.count)! : 0) {
            let subLayer = self.sublayers?[i]
            if let shape = subLayer as? CAShapeLayer {
                shape.path = nil
            }
            subLayer?.removeSubLayersAndPaths()
            subLayer?.sublayers?.removeAll()
        }
    }
}
