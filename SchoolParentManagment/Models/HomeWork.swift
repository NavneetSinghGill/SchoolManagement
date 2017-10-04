//
//  HomeWork.swift
//  SchoolParentManagment
//
//  Created by Navneet on 10/4/17.
//  Copyright © 2017 Bestpeers. All rights reserved.
//

import UIKit

class HomeWork: NSObject {

    var shortDescription: String?
    var forStandard: String?
    var maxMarks: String?
    var subject: String?
    
    func fakeData(for index: Int) {
        let index1 = index%2
        if index1 == 0 {
            subject = "Maths"
            forStandard = "IX - D"
            shortDescription = "Chapter 2 - exercise 3"
        } else if index1 == 1 {
            subject = "English"
            forStandard = "II - B"
            shortDescription = "Write an essay on \"Father\""
        }
    }
    
}
