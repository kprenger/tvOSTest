//
//  UIImageExtension.swift
//  TVTest
//
//  Created by Kurt Prenger on 11/1/17.
//  Copyright © 2017 Kurt Prenger. All rights reserved.
//

import UIKit

extension UIImage {
    class func image(with color: UIColor, in bounds: CGRect) -> UIImage {
        UIGraphicsBeginImageContext(bounds.size)
        guard let context = UIGraphicsGetCurrentContext() else { return UIImage() }
        
        context.setFillColor(color.cgColor)
        context.fill(bounds)
        
        guard let image = UIGraphicsGetImageFromCurrentImageContext() else { return UIImage() }
        UIGraphicsEndImageContext()
        
        return image
    }
}
