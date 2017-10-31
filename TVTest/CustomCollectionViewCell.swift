//
//  CustomCollectionViewCell.swift
//  TVTest
//
//  Created by Kurt Prenger on 10/31/17.
//  Copyright © 2017 Kurt Prenger. All rights reserved.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    
    override var canBecomeFocused: Bool {
        return true
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
