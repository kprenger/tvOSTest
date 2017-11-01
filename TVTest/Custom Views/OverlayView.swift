//
//  OverlayView.swift
//  TVTest
//
//  Created by Kurt Prenger on 11/1/17.
//  Copyright © 2017 Kurt Prenger. All rights reserved.
//

import UIKit

class OverlayView: UIView {

    @IBOutlet weak var label: UILabel!
    
    static func loadView() -> OverlayView {
        guard let view = Bundle.main.loadNibNamed("OverlayView", owner: nil, options: nil) else {
            preconditionFailure("OverlayView should be an existing nib")
        }
        
        guard let overlayView = view.first as? OverlayView else {
            preconditionFailure("View should have been an OverlayView")
        }
        
        return overlayView
    }

}
