//
//  HomeWorkTableViewCell.swift
//  SchoolParentManagment
//
//  Created by Navneet on 10/4/17.
//  Copyright © 2017 Bestpeers. All rights reserved.
//

import UIKit

class HomeWorkTableViewCell: UITableViewCell {

    @IBOutlet var subjectLabel: UILabel!
    @IBOutlet var standarLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func setUIFor(homeWork: HomeWork) {
        subjectLabel.text = homeWork.subject
        standarLabel.text = homeWork.forStandard
        descriptionLabel.text = homeWork.shortDescription
    }
    
}
