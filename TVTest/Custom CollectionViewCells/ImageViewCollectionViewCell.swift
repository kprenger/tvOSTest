//
//  ImageViewCollectionViewCell.swift
//  TVTest
//
//  Created by Kurt Prenger on 11/1/17.
//  Copyright © 2017 Kurt Prenger. All rights reserved.
//

import UIKit

class ImageViewCollectionViewCell: UICollectionViewCell {
    
    var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if imageView != nil {
            resetImageView()
        }
        
        setupImageView()
    }
    
    func setupImageView() {
        guard let image = imageSnapshot else { return }
        
        imageView = UIImageView(image: image)
        imageView.adjustsImageWhenAncestorFocused = true
        
        addSubview(imageView)
    }
    
    func resetImageView() {
        imageView.removeFromSuperview()
    }
    
}
