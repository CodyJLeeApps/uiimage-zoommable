//
//  TestImageLibraryCollectionViewCell.swift
//  uiimage-zoomable
//
//  Created by Lee, Cody J. on 10/11/17.
//  Copyright © 2017 BGEA. All rights reserved.
//

import UIKit

@IBDesignable
class TestImageLibraryCollectionViewCell: UICollectionViewCell {
    
    // IBOutlet(s)
    @IBOutlet weak var imageView: UIImageView!
    
    var shadowColor: UIColor = UIColor.black {
        didSet {
            self.customizeView()
        }
    }
    
    var shadowOffset: CGSize = CGSize(width: -2.0, height: 2.0) {
        didSet {
            self.customizeView()
        }
    }
 
    var shadowRadius: CGFloat = 4.0 {
        didSet {
            self.customizeView()
        }
    }
    
    var shadowOpacity : Float = 0.8 {
        didSet {
            self.customizeView()
        }
    }
    
    
    // This function is required for @IBDesignable classes
    // It allows the interface builder to reflect the custom view
    override func prepareForInterfaceBuilder() {
        customizeView()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        customizeView()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        updateShadowPath()
    }
    
    // Custom view properties
    func customizeView() {
        clipsToBounds = true // don't let the image bleed over the frame
        self.layer.cornerRadius = (frame.width / 10)  // round corners of the cell
        
        self.contentView.layer.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        
        // Add shadow to cell
        self.layer.shadowColor = shadowColor.cgColor
        self.layer.shadowOpacity = shadowOpacity
        self.layer.shadowRadius = shadowRadius
        self.layer.shadowOffset = shadowOffset
    }
    
    func updateView(testImage: TestImage) {
        imageView.image = UIImage(named: testImage.image)
    }
    
    fileprivate func updateShadowPath() {
        self.layer.shadowPath = UIBezierPath(roundedRect: layer.bounds, cornerRadius: layer.cornerRadius).cgPath
    }
    
    
}
