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
        let index1 = index%2
        if index1 == 0 {
            eventName = "‘sh’ sound Activity"
            eventTimeAndDate = "2017-11-04 22:45:00"
            eventDescription = """
            During the first week of September (31st August to 7th September), the children of UKG did a mat making activity. It was undertaken to recap the ‘sh’ sound words. The children wrote ‘sh’ sound words on the cut-outs of different shapes, and pasted them to make a mat. It helped them to recap the words. They learnt by having fun.
            """
            eventLocation = "Channing School for Girls- Senior School  The Bank, Highgate, London N6 5HF, UK, Phone:+44 20 8340 2328 "
            eventImages = ["event0", "event1", "event2", "event3", "event4","event5","event6","event7","event8","event9","event10","event11"]
            
        } else if index1 == 1 {
            eventName = "Story Writing using Idioms"
            eventTimeAndDate = "November 5, 2017, 8:15:30 pm"
            eventDescription = """
            Story writing is a powerful tool which allows the children to use their imagination and think on a particular topic. It broadens their thought process. It also helps them to refine their language skills.
            The students of 6A did an activity of Story Writing using various Idioms. The initial preparation included reading the newspaper and looking for the Idioms. They prepared an Idiom bank.
            The teacher divided the class into eight groups. She gave them ten clue words to frame the story. They were also instructed to use Idioms wherever needed.  The students even did story mapping. The tasks were divided amongst the students according to their strengths.
            This activity promoted their team spirit. The end result is worth appreciating.
            """
            eventLocation = "Channing School for Girls- Senior School  The Bank, Highgate, London N6 5HF, UK, Phone:+44 20 8340 2328 "
            eventImages = ["event0", "event1", "event2", "event3", "event4","event5","event6","event7","event8","event9","event10","event11"]
        }
        else if index1 == 2 {
            eventName = "Choco pie activity"
            eventTimeAndDate = "November 5, 2017, 8:15:30 pm"
            eventDescription = "001-001-0001"
            eventLocation = "Channing School for Girls- Senior School  The Bank, Highgate, London N6 5HF, UK, Phone:+44 20 8340 2328 "
            eventImages = ["event0", "event1", "event2", "event3", "event4","event5","event6","event7","event8","event9","event10","event11"]
        }
        else if index1 == 3 {
            eventName = "U.K.G Story time (Rooney’s Adventure)"
            eventTimeAndDate = "November 5, 2017, 8:15:30 pm"
            eventDescription = "001-001-0001"
            eventLocation = "Channing School for Girls- Senior School  The Bank, Highgate, London N6 5HF, UK, Phone:+44 20 8340 2328 "
            eventImages = ["event0", "event1", "event2", "event3", "event4","event5","event6","event7","event8","event9","event10","event11"]
        }
        else if index1 == 4 {
            eventName = "World of insects English Speaking Activity(4C)"
            eventTimeAndDate = "November 5, 2017, 8:15:30 pm"
            eventDescription = "001-001-0001"
            eventLocation = "Channing School for Girls- Senior School  The Bank, Highgate, London N6 5HF, UK, Phone:+44 20 8340 2328 "
            eventImages = ["event0", "event1", "event2", "event3", "event4","event5","event6","event7","event8","event9","event10","event11"]
        }
        else if index1 == 5 {
            eventName = "Speaking Activity Animal Kingdom"
            eventTimeAndDate = "November 5, 2017, 8:15:30 pm"
            eventDescription = "001-001-0001"
            eventLocation = "Channing School for Girls- Senior School  The Bank, Highgate, London N6 5HF, UK, Phone:+44 20 8340 2328 "
            eventImages = ["event0", "event1", "event2", "event3", "event4","event5","event6","event7","event8","event9","event10","event11"]
        }
        else if index1 == 6 {
            eventName = "STORY: THE BLUE JACKAL"
            eventTimeAndDate = "November 5, 2017, 8:15:30 pm"
            eventDescription = "001-001-0001"
            eventLocation = "Channing School for Girls- Senior School  The Bank, Highgate, London N6 5HF, UK, Phone:+44 20 8340 2328 "
            eventImages = ["event0", "event1", "event2", "event3", "event4","event5","event6","event7","event8","event9","event10","event11"]
        }
        else if index1 == 7 {
            eventName = "Learning Conjunctions through fun"
            eventTimeAndDate = "November 5, 2017, 8:15:30 pm"
            eventDescription = "001-001-0001"
            eventLocation = "Channing School for Girls- Senior School  The Bank, Highgate, London N6 5HF, UK, Phone:+44 20 8340 2328 "
            eventImages = ["event0", "event1", "event2", "event3", "event4","event5","event6","event7","event8","event9","event10","event11"]
        } else if index1 == 8 {
            eventName = "Cleaning the classroom"
            eventTimeAndDate = "November 5, 2017, 8:15:30 pm"
            eventDescription = "001-001-0001"
            eventLocation = "Channing School for Girls- Senior School  The Bank, Highgate, London N6 5HF, UK, Phone:+44 20 8340 2328 "
            eventImages = ["event0", "event1", "event2", "event3", "event4","event5","event6","event7","event8","event9","event10","event11"]
        } else if index1 == 9 {
            eventName = "The Fruit Salad Party"
            eventTimeAndDate = "November 5, 2017, 8:15:30 pm"
            eventDescription = """
            The EVS topic from 3rd Oct. to 7th Oct. was FRUITS. The children of LKG and UKG celebrated ‘FRUIT WEEK’. To summarize the week, there was a Fruit Salad Party on 7th Oct. The children brought different fruits and made fruit salad with the help of the teachers and enjoyed a lot.
            """
            eventLocation = "Channing School for Girls- Senior School  The Bank, Highgate, London N6 5HF, UK, Phone:+44 20 8340 2328 "
            eventImages = ["event0", "event1", "event2", "event3", "event4","event5","event6","event7","event8","event9","event10","event11"]
        } else if index1 == 10 {
            eventName = "Poster Making Activity"
            eventTimeAndDate = "November 5, 2017, 8:15:30 pm"
            eventDescription = """
            Posters provide a logical and cost-effective way of communicating to a particular target market. When placed correctly, attractive posters can lure nearby people into a specific event and alert them of an upcoming product or service. Posters have the ability to stick to viewers' minds and can be a great tool to increase brand awareness. A poster speaks for itself. It is therefore possible to reach a broader audience.
            The students of class 6A did an individual activity of Poster making on SAVE ANIMALS. The learners drafted visually appealing posters on animal rights. They were presented very colourfully. Each poster had a catchy slogan. The learners made posters on marine life to birds, tigers, cheetah, rhinoceros to elephants.
            It was a very interesting session where the students don their imaginative hat and tried their level best to spread awareness amongst the society members to protect animals to protect our mother nature.
            """
            eventLocation = "Channing School for Girls- Senior School  The Bank, Highgate, London N6 5HF, UK, Phone:+44 20 8340 2328 "
            eventImages = ["event0", "event1", "event2", "event3", "event4","event5","event6","event7","event8","event9","event10","event11"]
        } else if index1 == 11 {
            eventName = "Organizations for Animal Rights"
            eventTimeAndDate = "November 5, 2017, 8:15:30 pm"
            eventDescription = """
            The students of class 6 A did a group activity in English. The class was divided into six groups. Each group chose an organization which is actively working for animal rights all over the world and researched on it. Organizations like PETA i.e People for the Ethical Treatment of Animals, WSPA i.e World society for the Protection of Animals, BFA i.e Best Friends of Animal Rights, CFA i.e Care for Animals were chosen by the students. These organizations have been vociferously campaigning for animal rights. They inspire several individual and groups to stand for animal rights.
            The learners researched on the origin and motto of these organizations and the steps taken by them to provide a better life to animals. The learners even made a list of important people associated with these prestigious organizations.
            This activity was very informative for the learners and the teacher.
"""
            eventLocation = "Channing School for Girls- Senior School  The Bank, Highgate, London N6 5HF, UK, Phone:+44 20 8340 2328 "
            eventImages = ["event0", "event1", "event2", "event3", "event4","event5","event6","event7","event8","event9","event10","event11"]
        }
    }
    
}
