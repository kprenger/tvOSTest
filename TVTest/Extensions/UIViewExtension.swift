//
//  UIViewExtension.swift
//  TVTest
//
//  Created by Kurt Prenger on 10/31/17.
//  Copyright © 2017 Kurt Prenger. All rights reserved.
//

import UIKit

extension UIView {
    
    var imageSnapshot: UIImage? {
        let size = bounds.size
        UIGraphicsBeginImageContext(size)
        
        guard let context = UIGraphicsGetCurrentContext() else { return nil }
        
        layer.render(in: context)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        return image
    }
    
    func addParallaxMotionEffects(tiltValue : CGFloat = 0.25, panValue: CGFloat = 20) {
        let xTilt = UIInterpolatingMotionEffect(keyPath: "layer.transform.rotation.y", type: .tiltAlongHorizontalAxis)
        xTilt.minimumRelativeValue = -tiltValue
        xTilt.maximumRelativeValue = tiltValue
        
        let yTilt = UIInterpolatingMotionEffect(keyPath: "layer.transform.rotation.x", type: .tiltAlongVerticalAxis)
        yTilt.minimumRelativeValue = -tiltValue
        yTilt.maximumRelativeValue = tiltValue
        
        let xPan = UIInterpolatingMotionEffect(keyPath: "center.x", type: .tiltAlongHorizontalAxis)
        xPan.minimumRelativeValue = -panValue
        xPan.maximumRelativeValue = panValue
        
        let yPan = UIInterpolatingMotionEffect(keyPath: "center.y", type: .tiltAlongVerticalAxis)
        yPan.minimumRelativeValue = -panValue
        yPan.maximumRelativeValue = panValue
        
        let motionGroup = UIMotionEffectGroup()
        motionGroup.motionEffects = [xTilt, yTilt, xPan, yPan]
        
        addMotionEffect(motionGroup)
    }
    
}
