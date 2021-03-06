//
//  ParentTableViewCell.swift
//  SchoolParentManagment
//
//  Created by Navneet on 10/4/17.
//  Copyright © 2017 Bestpeers. All rights reserved.
//

import UIKit

class ParentTableViewCell: UITableViewCell {

    var characterType: CharacterType!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var relationShipOrStandarLabel: UILabel!
    @IBOutlet var profilePicImageView: UIImageView!
    @IBOutlet var backGroundCurveView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func setUIFor(characterType: CharacterType!, with character: NSObject) {
        if let parent = character as? Parent {
            nameLabel.text = "\(parent.firstName!) \(parent.lastName!)"
            relationShipOrStandarLabel.text = parent.relationToStudentChild
            setProfileImage(imageName: parent.avtarImage)
        }
        
        profilePicImageView.layer.cornerRadius = profilePicImageView.frame.size.width/2
    }
    
    func setProfileImage(imageName: String?) {
        if imageName != nil {
            profilePicImageView.image = UIImage.init(named: imageName!)
        }
    }
}
