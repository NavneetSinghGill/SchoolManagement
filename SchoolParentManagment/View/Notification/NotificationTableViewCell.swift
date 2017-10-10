//
//  NotificationTableViewCell.swift
//  SchoolParentManagment
//
//  Created by Bestpeers on 05/10/17.
//  Copyright © 2017 Bestpeers. All rights reserved.
//

import UIKit

protocol NotificationCellProtocol {
    func cellTapped(with index: Int)
}

class NotificationTableViewCell: UITableViewCell {

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var lblNotificationType: UILabel!
    @IBOutlet weak var selectButton: UIButton!
    @IBOutlet weak var dividerView: UIView!
    @IBOutlet weak var disclosure: UIImageView!
    
    @IBOutlet weak var withImageBackgroundView: UIView!
    @IBOutlet weak var withImageBackgroundViewSubView: UIView!
    @IBOutlet weak var withoutImageBackgroundView: UIView!
    @IBOutlet weak var withoutImageBackgroundViewSubView: UIView!
    
    var index: Int!
    var notificationDelegate: NotificationCellProtocol?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setUIFor(strNotificationType: String!, strCellImage: String) {
        self.layoutIfNeeded()
        
        if (strNotificationType) != nil {
            lblNotificationType.text = strNotificationType
            if strCellImage.characters.count > 0 {
                imgView?.image = UIImage(named: strCellImage)
                withImageBackgroundView.isHidden = false
                withoutImageBackgroundView.isHidden = true
            } else {
                withImageBackgroundView.isHidden = true
                withoutImageBackgroundView.isHidden = false
            }
        }
        
        withImageBackgroundViewSubView.layer.cornerRadius = withImageBackgroundView.bounds.size.height/2
        withoutImageBackgroundViewSubView.layer.cornerRadius = withoutImageBackgroundView.bounds.size.height/2
    }
    
    @IBAction func selectButtonTapped() {
        notificationDelegate?.cellTapped(with: index)
    }
}
