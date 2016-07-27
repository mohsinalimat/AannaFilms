//
//  TheaterCell.swift
//  AannaFilms
//
//  Created by Pradheep Rajendirane on 17/06/2016.
//  Copyright © 2016 DI2PRA. All rights reserved.
//

import UIKit

class TheaterCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var LocationButton: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
