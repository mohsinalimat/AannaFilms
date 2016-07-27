//
//  InsetLabel.swift
//  AannaFilms
//
//  Created by Pradheep Rajendirane on 01/07/2016.
//  Copyright © 2016 DI2PRA. All rights reserved.
//

import Foundation

class InsetLabel: UILabel {
    let topInset = CGFloat(12.0), bottomInset = CGFloat(4.0), leftInset = CGFloat(12.0), rightInset = CGFloat(12.0)
    
    override func drawTextInRect(rect: CGRect) {
        let insets: UIEdgeInsets = UIEdgeInsets(top: topInset, left: leftInset, bottom: bottomInset, right: rightInset)
        super.drawTextInRect(UIEdgeInsetsInsetRect(rect, insets))
    }
    
    override func intrinsicContentSize() -> CGSize {
        var intrinsicSuperViewContentSize = super.intrinsicContentSize()
        intrinsicSuperViewContentSize.height += topInset + bottomInset
        intrinsicSuperViewContentSize.width += leftInset + rightInset
        return intrinsicSuperViewContentSize
    }
}
