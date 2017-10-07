//
//  UIStoryboardExtension.swift
//  BuildingsGenie
//
//  Created by Cibirix on 2/2/17.
//  Copyright © 2017 Cibirix. All rights reserved.
//

import UIKit

extension UIStoryboard {

    //MARK: - More Storyboard Methods
    
  /*  class func getMySalesTeamController() -> MySalesTeamViewController
    {
        let moreStoryboard = self.getMoreStoryboard()
        return moreStoryboard.instantiateViewController(withIdentifier: kMySalesTeamControllerIdentifier) as! MySalesTeamViewController
    }
    
    class func getUserDetailsController() -> UserDetailsViewController {
        let moreStoryboard = self.getMoreStoryboard()
        return moreStoryboard.instantiateViewController(withIdentifier:kUserDetailControllerIdentifier ) as! UserDetailsViewController
    }
    
    class func getFeedbackController() -> FeedbackViewController {
        
        let moreStoryboard = self.getMoreStoryboard()
       return  moreStoryboard.instantiateViewController(withIdentifier: kToFeedbackViewControllerIdentifier) as! FeedbackViewController
    }

    
    //MARK: - Get Main storyboard Controller
    
     
    class func getCreateEstimateController() -> CreateYourEstimateViewController {
        
        let mainStoryboard = self.getMainStoryboard()
        return mainStoryboard.instantiateViewController(withIdentifier: kToCreateEstimateIdentifier) as! CreateYourEstimateViewController
    }
    //MARK: - Get Walkthrough Controller 
    
    class func getWalkthroughNavController() -> UINavigationController {
    
        let walkthroughStoryboard = self.getWalkthroughStoryboard()
        return walkthroughStoryboard.instantiateViewController(withIdentifier: kWalkthroughNavigationControllerIdentifier) as! UINavigationController
    }
    */
    
    
    //MARK: - Get Chat Controller
    class func getChatController() -> ChatViewController {
        let mainStoryboard = self.getMainStoryboard()
        return mainStoryboard.instantiateViewController(withIdentifier: sChatViewControllerIdentifier) as! ChatViewController
    }
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
