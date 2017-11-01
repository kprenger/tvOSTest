//
//  ViewController.swift
//  TVTest
//
//  Created by Kurt Prenger on 10/31/17.
//  Copyright © 2017 Kurt Prenger. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    let colors = [#colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1), #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1), #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1), #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1), #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1), #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1), #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)]
    let identifiers = ["reusableCell", "reusableImageCell", "reusableOverlayCell"]

}

extension ViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, canFocusItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    
}

extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let identifier = identifiers[indexPath.row % 3]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath)
        cell.backgroundColor = colors[indexPath.row % 7]
        
        if let cell = cell as? CustomCollectionViewCell {
            cell.label.text = "This is a custom motion effect - \(indexPath.row)"
        }
        
        if let cell = cell as? ImageViewCollectionViewCell {
            cell.label.text = "This is an image view render - \(indexPath.row)"
        }
        
        //Only available in iOS 11
        if let cell = cell as? OverlayCollectionViewCell {
            cell.labelString = "This is an overlay view (tvOS11) - \(indexPath.row)"
        }
        
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 60
    }
    
}

