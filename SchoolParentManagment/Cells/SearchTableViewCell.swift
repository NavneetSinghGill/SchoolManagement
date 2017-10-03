//
//  SearchTableViewCell.swift
//  SchoolParentManagment
//
//  Created by Navneet on 10/3/17.
//  Copyright © 2017 Bestpeers. All rights reserved.
//

import UIKit

class SearchTableViewCell: UITableViewCell {
    
    var characterType: CharacterType!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var relationShipOrStandarLabel: UILabel!

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
        } else if let parent = character as? Parent {
            nameLabel.text = "\(parent.firstName!) \(parent.lastName!)"
            relationShipOrStandarLabel.text = parent.relationToStudentChild
        }
    }
    
}
