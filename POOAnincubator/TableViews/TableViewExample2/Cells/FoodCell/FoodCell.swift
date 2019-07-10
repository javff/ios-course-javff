//
//  FoodCell.swift
//  POOAnincubator
//
//  Created by Juan  Vasquez on 7/10/19.
//  Copyright © 2019 com.javffCompany. All rights reserved.
//

import UIKit

class FoodCell: UITableViewCell {

    @IBOutlet weak var foodImageView: UIImageView!
    
    @IBOutlet weak var foodNameLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
