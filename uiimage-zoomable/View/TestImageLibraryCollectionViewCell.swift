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
        layer.cornerRadius = (frame.width / 8)  // round corners of the cell
        
        // Add shadow to cell
        self.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        self.layer.shadowColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        self.layer.shadowOpacity = 0.8
        self.layer.shadowRadius = 5.0
        self.layer.shadowOffset = CGSize(width: -3.0, height: 3.0)
        
    }
    
    func updateView(testImage: TestImage) {
        imageView.image = UIImage(named: testImage.image)
        //imageView.image = UIImage(named: testImage.image, in: Bundle(identifier: "com.bgea.uiimage-zoomable"), compatibleWith: nil)
    }
    
    
}
