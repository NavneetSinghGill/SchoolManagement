//
//  StudentChild.swift
//  SchoolParentManagment
//
//  Created by Bestpeers on 03/10/17.
//  Copyright © 2017 Bestpeers. All rights reserved.
//

import UIKit

class StudentChild: NSObject {
    
    var firstName: String!
    var lastName: String!
    var parents: [Parent] = []
    var phoneNumber: String!
    var standard: String!
    var rollNumber: String!
    var attendancePercent: String!
    var avtarImage:String!
    
    func fakeData(for index: Int) {
        let index1 = index%3
        if index1 == 0 {
            firstName = "John"
            lastName = "Ommen"
            phoneNumber = "001-001-0001"
            standard = "IX B"
            rollNumber = "1873"
            attendancePercent = ""
            avtarImage = "child1"

            let parent1 = Parent()
            parent1.fakeData(for: 0)
            let parent2 = Parent()
            parent2.fakeData(for: 1)
            let parent3 = Parent()
            parent3.fakeData(for: 2)
            
            parents = [parent1,parent2,parent3]
        } else if index1 == 1 {
            firstName = "Brian"
            lastName = "Ommen"
            phoneNumber = "001-001-0001"
            standard = "VI A"
            rollNumber = "1553"
            attendancePercent = ""
            avtarImage = "child2"
            
            let parent1 = Parent()
            parent1.fakeData(for: 0)
            let parent2 = Parent()
            parent2.fakeData(for: 1)
            
            parents = [parent1,parent2]
        }
        
        else if index1 == 2 {
            firstName = "Calvin"
            lastName = "Harris"
            phoneNumber = "001-001-0001"
            standard = "VI A"
            rollNumber = "1553"
            attendancePercent = ""
            avtarImage = "child3"
            
            let parent1 = Parent()
            parent1.fakeData(for: 0)
            let parent2 = Parent()
            parent2.fakeData(for: 1)
            parents = [parent1,parent2]
            
        }
    }
    
}
