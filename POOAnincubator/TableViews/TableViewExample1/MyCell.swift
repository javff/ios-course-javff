//
//  MyCell.swift
//  POOAnincubator
//
//  Created by Juan  Vasquez on 7/2/19.
//  Copyright © 2019 com.javffCompany. All rights reserved.
//

import UIKit

class MyCell: UITableViewCell {

    @IBOutlet weak var myLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
