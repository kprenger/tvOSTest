//
//  CustomCollectionViewCell.swift
//  TVTest
//
//  Created by Kurt Prenger on 10/31/17.
//  Copyright © 2017 Kurt Prenger. All rights reserved.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var label: UILabel!
    
    override var canBecomeFocused: Bool {
        return true
    }
    
    func addGradient(_ color: UIColor) {
        let gradient = CAGradientLayer()
        gradient.frame = bounds
        gradient.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradient.endPoint = CGPoint(x: 1.0, y: 1.0)
        gradient.colors = [#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1).cgColor, color.cgColor]
        
        contentView.layer.addSublayer(gradient)
        contentView.bringSubview(toFront: label)
    }
    
    override func didUpdateFocus(in context: UIFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
        super.didUpdateFocus(in: context, with: coordinator)
        
        guard let nextFocusedView = context.nextFocusedView else { return }
        
        if nextFocusedView == self {
            becomeFocusedUsingAnimationCoordinator(coordinator)
            addParallaxMotionEffects()
        } else {
            resignFocusUsingAnimationCoordinator(coordinator)
            motionEffects = []
        }
    }
    
    func becomeFocusedUsingAnimationCoordinator(_ coordinator: UIFocusAnimationCoordinator) {
        coordinator.addCoordinatedAnimations({ [weak self] () -> Void in
            guard let unwrappedSelf = self else { return }
            
            unwrappedSelf.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
            unwrappedSelf.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            unwrappedSelf.layer.shadowOffset = CGSize(width: 10.0, height: 10.0)
            unwrappedSelf.layer.shadowOpacity = 0.2
            unwrappedSelf.layer.shadowRadius = 5
        })
    }
    
    func resignFocusUsingAnimationCoordinator(_ coordinator: UIFocusAnimationCoordinator) {
        coordinator.addCoordinatedAnimations({ [weak self] () -> Void in
            guard let unwrappedSelf = self else { return }
            
            unwrappedSelf.transform = .identity
            unwrappedSelf.layer.shadowColor = nil
            unwrappedSelf.layer.shadowOffset = .zero
        })
    }
    
}
