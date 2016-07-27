//
//  ShowCell.swift
//  AannaFilms
//
//  Created by Pradheep Rajendirane on 17/06/2016.
//  Copyright © 2016 DI2PRA. All rights reserved.
//

import UIKit

class ShowCell: UITableViewCell {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var hourContentView: UIView!
    @IBOutlet weak var hourContentViewWith: NSLayoutConstraint!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
