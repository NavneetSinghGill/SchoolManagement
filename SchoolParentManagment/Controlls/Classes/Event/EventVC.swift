//
//  EventVC.swift
//  SchoolParentManagment
//
//  Created by Bestpeers on 05/10/17.
//  Copyright © 2017 Bestpeers. All rights reserved.
//

import UIKit

class EventVC: BaseViewController ,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var tableViewForEvent: UITableView!
    var events: [Event] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.navigationItem.hidesBackButton = true
        setNavigationTitle(title: "EVENT")
        
        let notificationNIB = UINib(nibName: "EventTableViewCell", bundle: nil)
        tableViewForEvent.register(notificationNIB, forCellReuseIdentifier: "EventTableViewCell")
        
        tableViewForEvent.estimatedRowHeight = 68
        tableViewForEvent.rowHeight = UITableViewAutomaticDimension
        
        //Fake data
        let eventFake1 = Event()
        eventFake1.fakeData(for: 0)
        events.append(eventFake1)
        let eventFake2 = Event()
        eventFake2.fakeData(for: 1)
        events.append(eventFake2)
        let eventFake3 = Event()
        eventFake3.fakeData(for: 2)
        events.append(eventFake3)
        let eventFake4 = Event()
        eventFake4.fakeData(for: 3)
        events.append(eventFake4)
        let eventFake5 = Event()
        eventFake5.fakeData(for: 4)
        events.append(eventFake5)
        let eventFake6 = Event()
        eventFake6.fakeData(for: 5)
        events.append(eventFake6)
        let eventFake7 = Event()
        eventFake7.fakeData(for: 6)
        events.append(eventFake7)
        let eventFake8 = Event()
        eventFake8.fakeData(for: 7)
        events.append(eventFake8)
        let eventFake9 = Event()
        eventFake9.fakeData(for: 8)
        events.append(eventFake9)
        let eventFake10 = Event()
        eventFake10.fakeData(for: 9)
        events.append(eventFake10)
        
        let eventFake11 = Event()
        eventFake11.fakeData(for: 10)
        events.append(eventFake11)
        
        tableViewForEvent.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: Tableview datasource and  Delegate methods
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events.count
        //self.arrNotificationsType.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: EventTableViewCell = tableView.dequeueReusableCell(withIdentifier:"EventTableViewCell", for: indexPath) as! EventTableViewCell
        
        cell.setUIForEvents(strEventName: events[indexPath.row].eventName, strEventTimeDate: events[indexPath.row].eventTimeAndDate)
        
      //  cell.accessoryType = .disclosureIndicator
        
        // Cell Selection Clear color
        let bgColorView = UIView()
        bgColorView.backgroundColor = UIColor.clear
        cell.selectedBackgroundView = bgColorView
        self.tableViewForEvent.separatorStyle = .none
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let eventDetailVC = UIStoryboard.getEventDetailController()
        eventDetailVC.eventDetils = events[indexPath.row]
        self.navigationController?.pushViewController(eventDetailVC, animated: true)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 68 ;
    }
}
