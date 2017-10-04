//
//  ChildrensTableViewCell.swift
//  SchoolParentManagment
//
//  Created by Bestpeers on 03/10/17.
//  Copyright © 2017 Bestpeers. All rights reserved.
//

import UIKit

class ChildrensTableViewCell: UITableViewCell {

    @IBOutlet weak var lblCDetails: UILabel!
    @IBOutlet weak var lblCName: UILabel!
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

}
