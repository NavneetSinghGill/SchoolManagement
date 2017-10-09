//
//  SearchTableViewCell.swift
//  SchoolParentManagment
//
//  Created by Bestpeers on 03/10/17.
//  Copyright © 2017 Bestpeers. All rights reserved.
//

import UIKit

class SearchTableViewCell: UITableViewCell {
    
    var characterType: CharacterType!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var relationShipOrStandarLabel: UILabel!
    @IBOutlet var profileImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func setUIFor(characterType: CharacterType!, with character: NSObject) {
        if let studentChild = character as? StudentChild {
            nameLabel.text = "\(studentChild.firstName!) \(studentChild.lastName!)"
            relationShipOrStandarLabel.text = studentChild.standard
            setProfileImage(imageName: studentChild.avtarImage)
        } else if let parent = character as? Parent {
            nameLabel.text = "\(parent.firstName!) \(parent.lastName!)"
            relationShipOrStandarLabel.text = parent.relationToStudentChild
            setProfileImage(imageName: parent.avtarImage)
        }
        
        profileImageView.cornerRadius = profileImageView.bounds.size.width/2
    }
    
    func setProfileImage(imageName: String?) {
        if imageName != nil {
            profileImageView.image = UIImage.init(named: imageName!)
        }
    }
    
}
