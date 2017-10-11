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
    
    // This function is required for @IBDesignable classes
    // It allows the interface builder to reflect the custom view
    override func prepareForInterfaceBuilder() {
        customizeView()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        customizeView()
    }
    
    // Custom view properties
    func customizeView() {
        clipsToBounds = true // don't let the image bleed over the frame
        self.layer.cornerRadius = (frame.width / 10)  // round corners of the cell
        
        self.contentView.layer.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        
        // Add shadow to cell
        self.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 3.0
        self.layer.shadowOffset = CGSize(width: -1.0, height: 1.0)
    }
    
    func updateView(testImage: TestImage) {
        imageView.image = UIImage(named: testImage.image)
    }
    
    
}
