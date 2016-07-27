//
//  TitleCell.swift
//  AannaFilms
//
//  Created by Pradheep Rajendirane on 04/06/2016.
//  Copyright © 2016 DI2PRA. All rights reserved.
//

import UIKit

class TitleCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var director: UILabel!
    @IBOutlet weak var actors: UILabel!
    @IBOutlet weak var musicDirector: UILabel!
    @IBOutlet weak var sortie: UILabel!
    @IBOutlet weak var coverImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
