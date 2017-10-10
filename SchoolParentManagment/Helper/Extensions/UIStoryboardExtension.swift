//
//  UIStoryboardExtension.swift
//  SchoolParentManagment
//
//  Created by Bestpeers on 04/10/17.
//  Copyright © 2017 Bestpeers. All rights reserved.


import UIKit

extension UIStoryboard {
    
    //MARK: - Get Chat Controller
    class func getChatController() -> ChatViewController {
        let mainStoryboard = self.getMainStoryboard()
        return mainStoryboard.instantiateViewController(withIdentifier: sChatViewControllerIdentifier) as! ChatViewController
    }
    
    //MARK: - Get ContactUS Controller
    class func getContactUs() -> ContactUsViewController {
        let mainStoryboard = self.getMainStoryboard()
        return mainStoryboard.instantiateViewController(withIdentifier: sContactUsViewControllerIdentifier) as! ContactUsViewController
    }
    //MARK: - Get Holidays Controller
//    class func getHolidays() -> HolidayViewController {
//        let mainStoryboard = self.getMainStoryboard()
//        return mainStoryboard.instantiateViewController(withIdentifier: sHolidayViewControllerIdentifier) as! HolidayViewController
//    }
    //MARK: - Get SignUp Controller
    class func getSigunUpController() -> SignUpViewController {
        let mainStoryboard = self.getMainStoryboard()
        return mainStoryboard.instantiateViewController(withIdentifier: sSignUpViewControllerIdentifier) as! SignUpViewController
    }
    class func getForgotPassController() -> FotgotPasswordViewController {
        let mainStoryboard = self.getMainStoryboard()
        return mainStoryboard.instantiateViewController(withIdentifier: sFotgotPasswordViewControllerIdentifier) as! FotgotPasswordViewController
    }
    
    //MARK:-  Get Event Details Controller
    class func getEventDetailController() -> EventDetailsViewController {
        let eventStoryboard = self.getMainStoryboard()
        return eventStoryboard.instantiateViewController(withIdentifier: sEventDetailsViewControllerIdentifier) as! EventDetailsViewController
    }
    
    //MARK: - Get Storyboard Methods
    
    class func getMainStoryboard() -> UIStoryboard {
        return UIStoryboard(name: "Main", bundle: nil)
    }
    
    class func getLoginStoryboard() -> UIStoryboard {
        return UIStoryboard(name: "Teacher", bundle: nil)
    }
   
    
    
}
