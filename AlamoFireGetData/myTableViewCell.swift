//
//  myTableViewCell.swift
//  AlamoFireGetData
//
//  Created by Admin on 28/10/2019.
//  Copyright © 2019 Brain Plow. All rights reserved.
//

import UIKit

class myTableViewCell: UITableViewCell {

  @IBOutlet var idLabel: UILabel!
  
  @IBOutlet var nameLabel: UILabel!
  
  override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
