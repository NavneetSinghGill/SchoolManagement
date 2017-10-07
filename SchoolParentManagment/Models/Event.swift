//
//  Event.swift
//  SchoolParentManagment
//
//  Created by Bestpeers on 05/10/17.
//  Copyright © 2017 Bestpeers. All rights reserved.
//

import UIKit

class Event: NSObject {
    
    var eventName: String!
    var eventTimeAndDate: String!
    var eventDescription: String!
    var eventLocation: String!
    var eventImages: [String]!
    
    func fakeData(for index: Int) {
        let index1 = index%11
        if index1 == 0 {
            eventName = "‘sh’ sound Activity"
            eventTimeAndDate = "2017-11-04 22:45:00"
            eventDescription = "During the first week of September (31st August to 7th September), the children of UKG did a mat making activity. "
            eventLocation = "Channing School The Bank, Highgate, London N6 5HF, UK, Phone:+44 20 8340 2328 "
            eventImages = ["event0", "event1", "event2", "event3", "event4","event5","event6","event7","event8","event9","event10","event11"]
            
        } else if index1 == 1 {
            eventName = "Story Writing using Idioms"
            eventTimeAndDate = "November 5, 2017, 8:15:30 pm"
            eventDescription = "Story writing is a powerful tool which allows the children to use their imagination and think on a particular topic. It broadens their thought process. It also helps them to refine their language skills."
            
            eventLocation = "Channing School The Bank, Highgate, London N6 5HF, UK, Phone:+44 20 8340 2328 "
            eventImages = ["event0", "event1", "event2", "event3", "event4","event5","event6","event7","event8","event9","event10","event11"]
        }
        else if index1 == 2 {
            eventName = "Choco pie activity"
            eventTimeAndDate = "November 5, 2017, 8:15:30 pm"
            eventDescription = "Story writing is a powerful tool which allows the children to use their imagination and think on a particular topic. It broadens their thought process. It also helps them to refine their language skills."
            eventLocation = "Channing School The Bank, Highgate, London N6 5HF, UK, Phone:+44 20 8340 2328 "
            eventImages = ["event0", "event1", "event2", "event3", "event4","event5","event6","event7","event8","event9","event10","event11"]
        }
        else if index1 == 3 {
            eventName = "U.K.G Story time (Rooney’s Adventure)"
            eventTimeAndDate = "November 5, 2017, 8:15:30 pm"
            eventDescription = "The EVS topic from 3rd Oct. to 7th Oct. was FRUITS. The children of LKG and UKG celebrated ‘FRUIT WEEK’."
            eventLocation = "Channing School The Bank, Highgate, London N6 5HF, UK, Phone:+44 20 8340 2328 "
            eventImages = ["event0", "event1", "event2", "event3", "event4","event5","event6","event7","event8","event9","event10","event11"]
        }
        else if index1 == 4 {
            eventName = "World of insects English Speaking Activity(4C)"
            eventTimeAndDate = "November 5, 2017, 8:15:30 pm"
            eventDescription = "The EVS topic from 3rd Oct. to 7th Oct. was FRUITS. The children of LKG and UKG celebrated ‘FRUIT WEEK’."
            eventLocation = "Channing School The Bank, Highgate, London N6 5HF, UK, Phone:+44 20 8340 2328 "
            eventImages = ["event0", "event1", "event2", "event3", "event4","event5","event6","event7","event8","event9","event10","event11"]
        }
        else if index1 == 5 {
            eventName = "Speaking Activity Animal Kingdom"
            eventTimeAndDate = "November 5, 2017, 8:15:30 pm"
            eventDescription = "The EVS topic from 3rd Oct. to 7th Oct. was FRUITS. The children of LKG and UKG celebrated ‘FRUIT WEEK’."
            eventLocation = "Channing School The Bank, Highgate, London N6 5HF, UK, Phone:+44 20 8340 2328 "
            eventImages = ["event0", "event1", "event2", "event3", "event4","event5","event6","event7","event8","event9","event10","event11"]
        }
        else if index1 == 6 {
            eventName = "STORY: THE BLUE JACKAL"
            eventTimeAndDate = "November 5, 2017, 8:15:30 pm"
            eventDescription = "The EVS topic from 3rd Oct. to 7th Oct. was FRUITS. The children of LKG and UKG celebrated ‘FRUIT WEEK’."
            eventLocation = "Channing School The Bank, Highgate, London N6 5HF, UK, Phone:+44 20 8340 2328 "
            eventImages = ["event0", "event1", "event2", "event3", "event4","event5","event6","event7","event8","event9","event10","event11"]
        }
        else if index1 == 7 {
            eventName = "Learning Conjunctions through fun"
            eventTimeAndDate = "November 5, 2017, 8:15:30 pm"
            eventDescription = "The EVS topic from 3rd Oct. to 7th Oct. was FRUITS. The children of LKG and UKG celebrated ‘FRUIT WEEK’."
            eventLocation = "Channing School The Bank, Highgate, London N6 5HF, UK, Phone:+44 20 8340 2328 "
            eventImages = ["event0", "event1", "event2", "event3", "event4","event5","event6","event7","event8","event9","event10","event11"]
        } else if index1 == 8 {
            eventName = "Cleaning the classroom"
            eventTimeAndDate = "November 5, 2017, 8:15:30 pm"
            eventDescription = "The EVS topic from 3rd Oct. to 7th Oct. was FRUITS. The children of LKG and UKG celebrated ‘FRUIT WEEK’."
            eventLocation = "Channing School The Bank, Highgate, London N6 5HF, UK, Phone:+44 20 8340 2328 "
            eventImages = ["event0", "event1", "event2", "event3", "event4","event5","event6","event7","event8","event9","event10","event11"]
        } else if index1 == 9 {
            eventName = "The Fruit Salad Party"
            eventTimeAndDate = "November 5, 2017, 8:15:30 pm"
            eventDescription = "The EVS topic from 3rd Oct. to 7th Oct. was FRUITS. The children of LKG and UKG celebrated ‘FRUIT WEEK’."
            eventLocation = "Channing School The Bank, Highgate, London N6 5HF, UK, Phone:+44 20 8340 2328 "
            eventImages = ["event0", "event1", "event2", "event3", "event4","event5","event6","event7","event8","event9","event10","event11"]
        } else if index1 == 10 {
            eventName = "Poster Making Activity"
            eventTimeAndDate = "November 5, 2017, 8:15:30 pm"
            eventDescription = "Posters provide a logical and cost-effective way of communicating to a particular target market. When placed correctly,"
            eventLocation = "Channing School The Bank, Highgate, London N6 5HF, UK, Phone:+44 20 8340 2328 "
            eventImages = ["event0", "event1", "event2", "event3", "event4","event5","event6","event7","event8","event9","event10","event11"]
        } else if index1 == 11 {
            eventName = "Organizations for Animal Rights"
            eventTimeAndDate = "November 5, 2017, 8:15:30 pm"
            eventDescription = "The students of class 6 A did a group activity in English. The class was divided into six groups."
            eventLocation = "Channing School The Bank, Highgate, London N6 5HF, UK, Phone:+44 20 8340 2328 "
            eventImages = ["event0", "event1", "event2", "event3", "event4","event5","event6","event7","event8","event9","event10","event11"]
        }
    }
    
}
