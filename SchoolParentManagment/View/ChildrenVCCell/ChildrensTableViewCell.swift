//
//  ChildrensTableViewCell.swift
//  SchoolParentManagment
//
//  Created by Bestpeers on 03/10/17.
//  Copyright © 2017 Bestpeers. All rights reserved.
//

import UIKit

class ChildrensTableViewCell: UITableViewCell {
    var characterType: CharacterType!
    
    @IBOutlet weak var lblCName: UILabel!
    @IBOutlet weak var lblCDetails: UILabel!
    @IBOutlet weak var lblRollNo: UILabel!
    
    @IBOutlet weak var imgChildren: UIImageView!
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
            imgChildren.layer.borderWidth = 1
            imgChildren.layer.masksToBounds = false
            imgChildren.layer.borderColor = UIColor.black.cgColor
            imgChildren.layer.cornerRadius = imgChildren.frame.height/2
            imgChildren.clipsToBounds = true
            imgChildren.image = UIImage(named:studentChild.avtarImage )
            
            lblCName.text = "\(studentChild.firstName!) \(studentChild.lastName!)"
            lblCDetails.text = "Standard  " + studentChild.standard
            lblRollNo.text = "RollNumber " + studentChild.rollNumber
        } else  {
            
        }
    }
    /*func setUIChildren(strChildName: String! , strChildStandard: String, strChildRollNo: String, strChildImageName: String) {
        if (strChildName) != nil {
            imgChildren.layer.borderWidth = 1
            imgChildren.layer.masksToBounds = false
            imgChildren.layer.borderColor = UIColor.black.cgColor
            imgChildren.layer.cornerRadius = imgChildren.frame.height/2
            imgChildren.clipsToBounds = true
            imgChildren.image = UIImage(named:strChildImageName )
            
            lblCName.text = strChildName
            lblCDetails.text = "Standard  " + strChildStandard
            lblRollNo.text = "RollNumber " + strChildRollNo
      
        }
    }*/
}
