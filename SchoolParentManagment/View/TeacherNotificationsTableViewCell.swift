//
//  TeacherNotificationsTableViewCell.swift
//  SchoolParentManagment
//
//  Created by Navneet on 10/9/17.
//  Copyright © 2017 Bestpeers. All rights reserved.
//

import UIKit

class TeacherNotificationsTableViewCell: UITableViewCell {
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var notificationImageView: UIImageView!
    @IBOutlet var backGroundCurveView: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setUIFor(for notification:Notificationn) {
        titleLabel.text = notification.title
        descriptionLabel.text = notification.notificationDescription
        notificationImageView.image = UIImage.init(named: notification.profileImage!)
        
        notificationImageView.layer.cornerRadius = notificationImageView.frame.size.width/2
        
        backGroundCurveView.layer.cornerRadius = 25
    }
    
}
