//
//  Parent.swift
//  SchoolParentManagment
//
//  Created by Bestpeers on 03/10/17.
//  Copyright © 2017 Bestpeers. All rights reserved.
//

import UIKit

class Parent: NSObject {
    
    var firstName: String!
    var lastName: String!
    var phoneNumber: String!
    var occupation: String!
    var relationToStudentChild: String!
    
    func fakeData(for index: Int) {
        let index1 = index%2
        if index1 == 0 {
            firstName = "Mike"
            lastName = "Ommen"
            relationToStudentChild = "Father"
        } else if index1 == 1 {
            firstName = "Bella"
            lastName = "Ommen"
            relationToStudentChild = "Mother"
        }
        else if index1 == 1 { 
            firstName = "Peeter"
            lastName = "Ritso"
            relationToStudentChild = "Father"
        }
    }
    
}
