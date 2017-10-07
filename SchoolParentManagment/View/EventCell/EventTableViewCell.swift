//
//  EventTableViewCell.swift
//  SchoolParentManagment
//
//  Created by Bestpeers on 05/10/17.
//  Copyright © 2017 Bestpeers. All rights reserved.
//

import UIKit

class EventTableViewCell: UITableViewCell {
    
    @IBOutlet weak var lblEventName: UILabel!
    @IBOutlet weak var lblEventTimeDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
        
       // lblEName.textColor = Global.getColorForCurrentEnvironmentType()
       // lblETimeDate.textColor = Global.getColorForCurrentEnvironmentType()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func setUIForEvents(strEventName: String! , strEventTimeDate: String) {
        if (strEventName) != nil {
            
            lblEventName.text = strEventName
            lblEventTimeDate.text = strEventTimeDate
        }
    }
}
