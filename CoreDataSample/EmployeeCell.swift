//
//  EmployeeCell.swift
//  CoreDataSample
//
//  Created by Epos Admin on 18/05/18.
//  Copyright © 2018 Epos Admin. All rights reserved.
//

import UIKit

class EmployeeCell: UITableViewCell {
    
    @IBOutlet weak var empName : UILabel!
    @IBOutlet weak var empPhoneNo : UILabel!
    @IBOutlet weak var empRole : UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
