//
//  ZoomImageScrollView.swift
//  uiimage-zoomable
//
//  Created by Lee, Cody J. on 10/10/17.
//  Copyright © 2017 BGEA. All rights reserved.
//

import UIKit

class ZoomImageScrollView: UIScrollView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.minimumZoomScale = 1
        self.maximumZoomScale = 6.0
    }
    

}
