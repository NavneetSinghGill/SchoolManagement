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
    var avtarImage:String!
    
    func fakeData(for index: Int) {
        let index1 = index%3
        if index1 == 0 {
            firstName = "Mike"
            lastName = "Ommen"
            relationToStudentChild = "Father"
            avtarImage = "parent1"
        } else if index1 == 1 {
            firstName = "Bella"
            lastName = "Ommen"
            relationToStudentChild = "Mother"
            avtarImage = "parent2"
        }
        else if index1 == 2 {
            firstName = "Peeter"
            lastName = "Ritso"
            relationToStudentChild = "Uncle"
            avtarImage = "parent3"
        }
    }
    
}
