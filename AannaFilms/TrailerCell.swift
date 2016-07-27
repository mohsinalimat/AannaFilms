//
//  TrailerCell.swift
//  AannaFilms
//
//  Created by Pradheep Rajendirane on 23/06/2016.
//  Copyright © 2016 DI2PRA. All rights reserved.
//

import UIKit

class TrailerCell: UITableViewCell {

    
    @IBOutlet weak var trailerView: UIWebView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        trailerView.scrollView.scrollEnabled = false
        trailerView.scrollView.bounces = false
        
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
