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
    
//    //MARK: - Get Main storyboard Controller
//    func getLoginViewController(<#parameters#>) -> <#return type#> {
//        <#function body#>
//    }
//    
    
    //MARK: - Get login Storyboard Controller
    
    class func getLoginNavigationViewController() -> UINavigationController {
        let loginStoryboard = self.getLoginStoryboard()
        return loginStoryboard.instantiateViewController(withIdentifier: kLoginNavigationControllerIdentifier) as! UINavigationController
    }
    
    //MARK: - Get Storyboard Methods
    
    class func getMainStoryboard() -> UIStoryboard {
        return UIStoryboard(name: "Main", bundle: nil)
    }
    
    class func getLoginStoryboard() -> UIStoryboard {
        return UIStoryboard(name: "Teacher", bundle: nil)
    }
    
    class func getWalkthroughStoryboard() -> UIStoryboard {
        return UIStoryboard(name: "Student", bundle: nil)
    }
    
    
}
