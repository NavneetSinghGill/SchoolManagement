//
//  EventDetailsViewController.swift
//  SchoolParentManagment
//
//  Created by Bestpeers on 06/10/17.
//  Copyright © 2017 Bestpeers. All rights reserved.
//

import UIKit
import ImageSlideshow

class EventDetailsViewController: BaseViewController {
    
    @IBOutlet weak var lblEventName: UILabel!
    var pageNo: Int!
    @IBOutlet weak var lblDescription: UILabel!
    let localSource = [ImageSource(imageString: "event0")!, ImageSource(imageString: "event1")!, ImageSource(imageString: "event2")!, ImageSource(imageString: "event3")!, ImageSource(imageString: "event4")!, ImageSource(imageString: "event5")!, ImageSource(imageString: "event6")!, ImageSource(imageString: "event7")!, ImageSource(imageString: "event8")!, ImageSource(imageString: "event9")!, ImageSource(imageString: "event10")!,ImageSource(imageString: "event11")!]
    let arraryImage: [String] = ["event0", "event1","event3", "event4", "event5", "event6", "event7", "event8", "event9", "event10", "event11"]
    
    var eventDetils: Event?
    
    
    @IBOutlet weak var slideshow: ImageSlideshow!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addBackButton()
        setNavigationTitle(title: "EVENT DETAIL")
        addShareButtonRight()
        
        
        if eventDetils != nil {
            setInfo(of: eventDetils)
        }
        
        // Do any additional setup after loading the view.
        slideshow.backgroundColor = UIColor.white
        slideshow.slideshowInterval = Double(localSource.count)
        slideshow.pageControlPosition = PageControlPosition.underScrollView
        slideshow.pageControl.currentPageIndicatorTintColor = UIColor.lightGray
        slideshow.pageControl.pageIndicatorTintColor = UIColor.black
        slideshow.contentScaleMode = UIViewContentMode.scaleAspectFill
        
        // optional way to show activity indicator during image load (skipping the line will show no activity indicator)
        slideshow.activityIndicator = DefaultActivityIndicator()
        slideshow.currentPageChanged = { page in
            print("current page:", page)
            self.pageNo = page
            print("current page No:", self.pageNo)
        }
        
        // can be used with other sample sources as `afNetworkingSource`, `alamofireSource` or `sdWebImageSource` or `kingfisherSource`
        slideshow.setImageInputs(localSource as [InputSource])
        
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(EventDetailsViewController.didTap))
        slideshow.addGestureRecognizer(recognizer)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func didTap() {
        let fullScreenController = slideshow.presentFullScreenController(from: self)
        // set the activity indicator for full screen controller (skipping the line will show no activity indicator)
        fullScreenController.slideshow.activityIndicator = DefaultActivityIndicator(style: .white, color: nil)
    }
    
    
    func setInfo(of eventDetils: Event?) {
        lblEventName.textColor = Global.getColorForCurrentEnvironmentType()
        lblEventName.text = eventDetils?.eventName
        lblDescription.text = eventDetils?.eventDescription
    }
    //MARK:- Share Action
    
    
    @IBAction func shareButtonPressed(sender: AnyObject) {
        let myWebsite = NSURL(string:"http://www.bestpeers.com/")
        
        let img: UIImage = UIImage(named: self.arraryImage[0])!
        
        guard let url = myWebsite else {
            print("nothing found")
            return
        }
        let shareItems:Array = [img, url]
        let activityViewController:UIActivityViewController = UIActivityViewController(activityItems: shareItems, applicationActivities: nil)
        activityViewController.excludedActivityTypes = [UIActivityType.postToFlickr, UIActivityType.postToWeibo, UIActivityType.message, UIActivityType.mail, UIActivityType.print, UIActivityType.copyToPasteboard, UIActivityType.assignToContact, UIActivityType.saveToCameraRoll, UIActivityType.addToReadingList, UIActivityType.postToFlickr, UIActivityType.postToVimeo, UIActivityType.postToTencentWeibo]
        self.present(activityViewController, animated: true, completion: nil)
    }
    
    //    @IBAction func share(_ sender: AnyObject) {
    //        guard let detailBeer = detailBeer,
    //            let url = detailBeer.exportToFileURL() else {
    //                return
    //        }
    //
    //        let activityViewController = UIActivityViewController(
    //            activityItems: ["Check out this beer I liked using Beer Tracker.", url],
    //            applicationActivities: nil)
    //        if let popoverPresentationController = activityViewController.popoverPresentationController {
    //            popoverPresentationController.barButtonItem = (sender as! UIBarButtonItem)
    //        }
    //        present(activityViewController, animated: true, completion: nil)
    //    }
}
