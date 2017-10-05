//
//  NotificationTableViewCell.swift
//  SchoolParentManagment
//
//  Created by Bestpeers on 05/10/17.
//  Copyright © 2017 Bestpeers. All rights reserved.
//

import UIKit

class NotificationTableViewCell: UITableViewCell {

    @IBOutlet weak var imgCell: UIImageView!
    
    @IBOutlet weak var lblNotificationType: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setUIFor(strNotificationType: String!, strCellImage: String) {
        if (strNotificationType) != nil {
            lblNotificationType.text = strNotificationType
            imageView?.image = UIImage(named: strCellImage)
        }
    }
}
