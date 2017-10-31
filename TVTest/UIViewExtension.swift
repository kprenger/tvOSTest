//
//  UIViewExtension.swift
//  TVTest
//
//  Created by Kurt Prenger on 10/31/17.
//  Copyright © 2017 Kurt Prenger. All rights reserved.
//

import UIKit

extension UIView {
    
    func addParallaxMotionEffects(tiltValue : CGFloat = 0.25, panValue: CGFloat = 5) {
        
        var xTilt = UIInterpolatingMotionEffect()
        xTilt = UIInterpolatingMotionEffect(keyPath: "layer.transform.rotation.y", type: .tiltAlongHorizontalAxis)
        xTilt.minimumRelativeValue = tiltValue
        xTilt.maximumRelativeValue = -tiltValue
        
        var yTilt = UIInterpolatingMotionEffect()
        yTilt = UIInterpolatingMotionEffect(keyPath: "layer.transform.rotation.x", type: .tiltAlongVerticalAxis)
        yTilt.minimumRelativeValue = -tiltValue
        yTilt.maximumRelativeValue = tiltValue
        
        var xPan = UIInterpolatingMotionEffect()
        xPan = UIInterpolatingMotionEffect(keyPath: "center.x", type: .tiltAlongHorizontalAxis)
        xPan.minimumRelativeValue = panValue
        xPan.maximumRelativeValue = -panValue
        
        var yPan = UIInterpolatingMotionEffect()
        yPan = UIInterpolatingMotionEffect(keyPath: "center.y", type: .tiltAlongVerticalAxis)
        yPan.minimumRelativeValue = -panValue
        yPan.maximumRelativeValue = panValue
        
        let motionGroup = UIMotionEffectGroup()
        motionGroup.motionEffects = [xTilt, yTilt, xPan, yPan]
        
        addMotionEffect(motionGroup)
    }
    
}
