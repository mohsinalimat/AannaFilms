//
//  MovieCell.swift
//  AannaFilms
//
//  Created by Pradheep Rajendirane on 15/04/2016.
//  Copyright © 2016 DI2PRA. All rights reserved.
//

import UIKit

class MovieCell: UICollectionViewCell {
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var bgview: UIView!
    
    let rightLayer: CAShapeLayer = CAShapeLayer()
    let topLayer: CAShapeLayer = CAShapeLayer()
    let bottomLayer: CAShapeLayer = CAShapeLayer()
    let leftLayer: CAShapeLayer = CAShapeLayer()
    
   /* @IBOutlet weak var sortieLabel: UILabel!
    @IBOutlet weak var realisateurLabel: UILabel!
    @IBOutlet weak var actorLabel: UILabel!
    @IBOutlet weak var musicLabel: UILabel!*/
    
    var delta: CGFloat = 0
    let coverLoadingIndicator = UIActivityIndicatorView()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        title.layer.borderWidth = 5.0
        title.layer.borderColor = UIColor.whiteColor().CGColor
        bgview.backgroundColor = UIColor.blackColor().colorWithAlphaComponent(0.9)
        
        
        coverLoadingIndicator.color = UIColor.whiteColor()
        coverLoadingIndicator.translatesAutoresizingMaskIntoConstraints = false
        coverLoadingIndicator.hidesWhenStopped = true
        
        self.addSubview(coverLoadingIndicator)
        
        self.addConstraint(NSLayoutConstraint(item: coverLoadingIndicator, attribute: .CenterX, relatedBy: .Equal, toItem: self, attribute: .CenterX, multiplier: 1, constant: 0))
        
        self.addConstraint(NSLayoutConstraint(item: coverLoadingIndicator, attribute: .Top, relatedBy: .Equal, toItem: self, attribute: .Top, multiplier: 1, constant: 20))
        
        
    }
    
    override func applyLayoutAttributes(layoutAttributes: UICollectionViewLayoutAttributes) {
        
        super.applyLayoutAttributes(layoutAttributes)
        
        /*bottomLayer.removeFromSuperlayer()
        topLayer.removeFromSuperlayer()
        leftLayer.removeFromSuperlayer()
        rightLayer.removeFromSuperlayer()
        
        
        let size: CGFloat = 40.0
        let padding: CGFloat = 15.0
        let lineWidth: CGFloat = 5.0
        let color: UIColor = UIColor.whiteColor()
        
        // Right Path
        let rightStartPath: UIBezierPath = UIBezierPath()
        rightStartPath.moveToPoint(CGPointMake(padding, padding))
        rightStartPath.addLineToPoint(CGPointMake(padding, padding + size))
        
        let rightEndPath: UIBezierPath = UIBezierPath()
        rightEndPath.moveToPoint(CGPointMake(padding, self.frame.height - (padding + size)))
        rightEndPath.addLineToPoint(CGPointMake(padding, self.frame.height - padding))
        
        
        // Left Path
        let leftStartPath: UIBezierPath = UIBezierPath()
        leftStartPath.moveToPoint(CGPointMake(self.frame.width - padding, self.frame.height - padding))
        leftStartPath.addLineToPoint(CGPointMake(self.frame.width - padding, self.frame.height - (padding+size)))
        
        let leftEndPath: UIBezierPath = UIBezierPath()
        leftEndPath.moveToPoint(CGPointMake(self.frame.width - padding, padding + size))
        leftEndPath.addLineToPoint(CGPointMake(self.frame.width - padding, padding))
        
        
        // Bottom Path
        let bottomStartPath: UIBezierPath = UIBezierPath()
        bottomStartPath.moveToPoint(CGPointMake(padding, self.frame.height - padding))
        bottomStartPath.addLineToPoint(CGPointMake(padding + size, self.frame.height - padding))
        
        let bottomEndPath: UIBezierPath = UIBezierPath()
        bottomEndPath.moveToPoint(CGPointMake(self.frame.width - (padding + size), self.frame.height - padding))
        bottomEndPath.addLineToPoint(CGPointMake(self.frame.width - padding, self.frame.height - padding))
        
        
        // Top Path
        let topStartPath: UIBezierPath = UIBezierPath()
        topStartPath.moveToPoint(CGPointMake(self.frame.width - padding, padding))
        topStartPath.addLineToPoint(CGPointMake(self.frame.width - (padding + size), padding))
        
        let topEndPath: UIBezierPath = UIBezierPath()
        topEndPath.moveToPoint(CGPointMake(padding + size, padding))
        topEndPath.addLineToPoint(CGPointMake(padding, padding))
        
        
        
        //let rightLayer: CAShapeLayer = CAShapeLayer()
        rightLayer.frame = self.bounds
        rightLayer.path = rightStartPath.CGPath
        rightLayer.strokeColor = color.CGColor
        rightLayer.fillColor = nil
        rightLayer.lineWidth = lineWidth
        
        //let leftLayer: CAShapeLayer = CAShapeLayer()
        leftLayer.frame = self.bounds
        leftLayer.path = leftStartPath.CGPath
        leftLayer.strokeColor = color.CGColor
        leftLayer.fillColor = nil
        leftLayer.lineWidth = lineWidth
        
        //let bottomLayer: CAShapeLayer = CAShapeLayer()
        bottomLayer.frame = self.bounds
        bottomLayer.path = bottomStartPath.CGPath
        bottomLayer.strokeColor = color.CGColor
        bottomLayer.fillColor = nil
        bottomLayer.lineWidth = lineWidth
        
        //let topLayer: CAShapeLayer = CAShapeLayer()
        topLayer.frame = self.bounds
        topLayer.path = topStartPath.CGPath
        topLayer.strokeColor = color.CGColor
        topLayer.fillColor = nil
        topLayer.lineWidth = lineWidth
        
        self.layer.addSublayer(rightLayer)
        self.layer.addSublayer(bottomLayer)
        self.layer.addSublayer(topLayer)
        self.layer.addSublayer(leftLayer)
        
        let rightAnimation: CABasicAnimation = CABasicAnimation(keyPath: "path")
        rightAnimation.fromValue = rightStartPath.CGPath
        rightAnimation.toValue = rightEndPath.CGPath
        rightAnimation.duration = 2.0
        rightAnimation.repeatCount = Float.infinity
        rightAnimation.fillMode = kCAFillModeForwards
        rightAnimation.removedOnCompletion = false
        rightLayer.addAnimation(rightAnimation, forKey: nil)
        
        
        let bottomAnimation: CABasicAnimation = CABasicAnimation(keyPath: "path")
        bottomAnimation.fromValue = bottomStartPath.CGPath
        bottomAnimation.toValue = bottomEndPath.CGPath
        bottomAnimation.duration = 1.0
        bottomAnimation.repeatCount = Float.infinity
        bottomAnimation.fillMode = kCAFillModeForwards
        bottomAnimation.removedOnCompletion = false
        bottomLayer.addAnimation(bottomAnimation, forKey: nil)
        
        
        let topAnimation: CABasicAnimation = CABasicAnimation(keyPath: "path")
        topAnimation.fromValue = topStartPath.CGPath
        topAnimation.toValue = topEndPath.CGPath
        topAnimation.duration = 1.0
        topAnimation.repeatCount = Float.infinity
        topAnimation.fillMode = kCAFillModeForwards
        topAnimation.removedOnCompletion = false
        topLayer.addAnimation(topAnimation, forKey: nil)
        
        
        let leftAnimation: CABasicAnimation = CABasicAnimation(keyPath: "path")
        leftAnimation.fromValue = leftStartPath.CGPath
        leftAnimation.toValue = leftEndPath.CGPath
        leftAnimation.duration = 1.0
        leftAnimation.repeatCount = Float.infinity
        leftAnimation.fillMode = kCAFillModeForwards
        leftAnimation.removedOnCompletion = false
        leftLayer.addAnimation(leftAnimation, forKey: nil)*/
        
        
        
        
        let standardHeight = MovieLayoutConstants.Cell.standardHeight
        let featuredHeight = MovieLayoutConstants.Cell.featuredHeight
        
        
        delta = 1 - ((featuredHeight-CGRectGetHeight(frame))/(featuredHeight-standardHeight))
        
        /*sortieLabel.alpha = delta
        realisateurLabel.alpha = delta
        actorLabel.alpha = delta
        musicLabel.alpha = delta*/
        
        let scale = max(delta, 0.5)
        title.transform = CGAffineTransformMakeScale(scale, scale)
        
        bgview.alpha = 1 - delta
        
        
    }

}
