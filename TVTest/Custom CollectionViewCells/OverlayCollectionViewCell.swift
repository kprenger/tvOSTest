//
//  OverlayCollectionViewCell.swift
//  TVTest
//
//  Created by Kurt Prenger on 11/1/17.
//  Copyright © 2017 Kurt Prenger. All rights reserved.
//

import UIKit

class OverlayCollectionViewCell: UICollectionViewCell {
    
    var labelString = ""
    var overlay: OverlayView!
    @IBOutlet weak var imageView: UIImageView!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if overlay != nil {
            resetOverlay()
        }
        
        addOverlay()
    }
    
    func addOverlay() {
        imageView.image = UIImage.image(with: backgroundColor ?? #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), in: bounds)
        imageView.adjustsImageWhenAncestorFocused = true
        
        overlay = OverlayView.loadView()
        overlay.label.text = labelString
        overlay.clipsToBounds = true
        
        let contentView = imageView.overlayContentView
        contentView.addSubview(overlay)
        
        overlay.translatesAutoresizingMaskIntoConstraints = false
        overlay.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        overlay.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        overlay.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        overlay.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }
    
    func resetOverlay() {
        overlay.label.text = ""
        overlay.removeFromSuperview()
    }
}
